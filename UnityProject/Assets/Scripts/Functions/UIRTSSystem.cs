using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class UIRTSSystem : MonoBehaviour
{
   [Header("Selection Settings")]
   [SerializeField] private LayerMask selectableLayer = 1 << 6;
   [SerializeField] private LayerMask groundLayer = 1 << 7;
   [SerializeField] private Material selectedMaterial;
  
   [Header("UI References")]
   [SerializeField] private RectTransform selectionBox;
   [SerializeField] private Canvas canvas;
  
   [Header("Selection Settings")]
   [SerializeField] private float selectionTolerance = 10f;
   [SerializeField] private bool useColliderBounds = true;
  
   [Header("Team Settings")]
   [SerializeField] private TeamAffiliation playerTeam = TeamAffiliation.Team1;
  
   [Header("Performance Settings")]
   [SerializeField] private int maxMinionsToProcessPerFrame = 15;
  
   [Header("Debug")]
   [SerializeField] private bool debugMode = true;
   [SerializeField] private bool drawDebugRays = false;
  
   private List<Minion> selectedMinions = new List<Minion>();
   private List<Material[][]> originalMaterials = new List<Material[][]>();
   private Minion[] minionCache;
   private Camera mainCamera;
   private Vector2 selectionStart;
   private bool isSelecting = false;


   void Start()
   {
       mainCamera = Camera.main;
       InitializeUI();
       CacheMinions();
      
       if (debugMode) Debug.Log("UIRTSSystem initialized");
   }


   void InitializeUI()
   {
       if (canvas == null)
       {
           canvas = FindObjectOfType<Canvas>();
           if (canvas == null) CreateCanvas();
       }
      
       if (selectionBox == null)
       {
           CreateSelectionBox();
       }
       else
       {
           selectionBox.gameObject.SetActive(false);
       }
   }


   void CreateCanvas()
   {
       GameObject canvasObj = new GameObject("SelectionCanvas");
       canvas = canvasObj.AddComponent<Canvas>();
       canvas.renderMode = RenderMode.ScreenSpaceOverlay;
       canvasObj.AddComponent<CanvasScaler>();
       canvasObj.AddComponent<GraphicRaycaster>();
   }


   void CreateSelectionBox()
   {
       if (canvas == null) return;


       GameObject boxObj = new GameObject("SelectionBox");
       boxObj.transform.SetParent(canvas.transform);
      
       selectionBox = boxObj.AddComponent<RectTransform>();
       Image boxImage = boxObj.AddComponent<Image>();
      
       boxImage.color = new Color(0.2f, 0.4f, 1f, 0.2f);
      
       Outline outline = boxObj.AddComponent<Outline>();
       outline.effectColor = Color.blue;
       outline.effectDistance = new Vector2(1, -1);
      
       selectionBox.anchorMin = Vector2.zero;
       selectionBox.anchorMax = Vector2.zero;
       selectionBox.pivot = Vector2.zero;
      
       selectionBox.gameObject.SetActive(false);
   }


   void Update()
   {
       HandleSelectionInput();
       HandleCommands();
      
       // Update cache every few seconds
       if (Time.frameCount % 300 == 0) // Every 300 frames (~5 seconds at 60fps)
       {
           CacheMinions();
       }
   }


   void CacheMinions()
   {
       minionCache = FindObjectsOfType<Minion>();
       if (debugMode) Debug.Log($"Minion cache updated: {minionCache.Length} minions");
   }


   void HandleSelectionInput()
   {
       if (Input.GetMouseButtonDown(0))
       {
           StartSelection();
       }


       if (Input.GetMouseButton(0) && isSelecting)
       {
           UpdateSelectionBox();
       }


       if (Input.GetMouseButtonUp(0) && isSelecting)
       {
           EndSelection();
       }
   }


   void StartSelection()
   {
       selectionStart = Input.mousePosition;
       isSelecting = true;
      
       if (selectionBox != null)
       {
           selectionBox.gameObject.SetActive(true);
           ResetSelectionBox();
       }
      
       // Only clear selection if we're not clicking directly on a minion with shift held
       if (!Input.GetKey(KeyCode.LeftShift))
       {
           Minion clickedMinion = GetMinionUnderMouse();
           if (clickedMinion == null)
           {
               ClearSelection();
           }
       }
      
       if (debugMode) Debug.Log($"Selection started at: {selectionStart}");
   }


   void ResetSelectionBox()
   {
       if (selectionBox == null) return;
       selectionBox.anchoredPosition = selectionStart;
       selectionBox.sizeDelta = Vector2.zero;
   }


   void UpdateSelectionBox()
   {
       if (selectionBox == null) return;
      
       Vector2 currentMousePos = Input.mousePosition;
       Vector2 min = Vector2.Min(selectionStart, currentMousePos);
       Vector2 max = Vector2.Max(selectionStart, currentMousePos);
      
       selectionBox.anchoredPosition = min;
       selectionBox.sizeDelta = max - min;
   }


   void EndSelection()
   {
       isSelecting = false;
      
       if (selectionBox != null)
       {
           selectionBox.gameObject.SetActive(false);
       }
      
       Vector2 selectionEnd = Input.mousePosition;
       float dragDistance = Vector2.Distance(selectionStart, selectionEnd);
      
       if (dragDistance < 5f)
       {
           HandleSingleClickSelection();
       }
       else
       {
           HandleBoxSelection(selectionStart, selectionEnd);
       }
   }


   void HandleSingleClickSelection()
   {
       Minion minion = GetMinionUnderMouse();
       if (minion != null)
       {
           // Team check - only select friendly units
           Team minionTeam = minion.GetComponent<Team>();
           if (minionTeam != null && minionTeam.GetTeam() != playerTeam)
           {
               if (debugMode) Debug.Log($"Cannot select enemy unit: {minion.gameObject.name}");
               return;
           }

           if (!Input.GetKey(KeyCode.LeftShift))
           {
               ClearSelection();
           }
           SelectMinion(minion);
          
           if (debugMode) Debug.Log($"Single click selected: {minion.gameObject.name}");
       }
       else
       {
           if (debugMode) Debug.Log("Single click on empty space - no minion found");
       }
   }


   void HandleBoxSelection(Vector2 startScreen, Vector2 endScreen)
   {
       // Create selection rectangle in screen coordinates
       Rect selectionRect = new Rect(
           Mathf.Min(startScreen.x, endScreen.x),
           Mathf.Min(startScreen.y, endScreen.y),
           Mathf.Abs(endScreen.x - startScreen.x),
           Mathf.Abs(endScreen.y - startScreen.y)
       );
      
       if (debugMode)
       {
           Debug.Log($"Selection Rect: {selectionRect}");
           Debug.Log($"Screen size: {Screen.width}x{Screen.height}");
       }
      
       int selectedCount = 0;
       int processedThisFrame = 0;
      
       foreach (Minion minion in minionCache)
       {
           if (minion == null) continue;
          
           // Team check - only select friendly units
           Team minionTeam = minion.GetComponent<Team>();
           if (minionTeam != null && minionTeam.GetTeam() != playerTeam)
           {
               continue; // Skip enemy units
           }

           if (processedThisFrame >= maxMinionsToProcessPerFrame)
           {
               if (debugMode) Debug.Log("Reached minion processing limit for this frame");
               break;
           }
          
           // Check if minion is within selection rectangle
           if (IsMinionInSelectionRect(minion, selectionRect))
           {
               SelectMinion(minion);
               selectedCount++;
           }
          
           processedThisFrame++;
       }
      
       if (debugMode) Debug.Log($"Box selection completed: {selectedCount} minions selected");
   }


   bool IsMinionInSelectionRect(Minion minion, Rect selectionRect)
   {
       if (useColliderBounds)
       {
           // Use collider bounds for more accurate selection
           Collider collider = minion.GetComponent<Collider>();
           if (collider != null)
           {
               Bounds bounds = collider.bounds;
               return IsBoundsInSelectionRect(bounds, selectionRect);
           }
       }
      
       // Fallback to transform position
       Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
      
       // Skip if behind camera
       if (screenPos.z <= 0) return false;
      
       // Apply tolerance
       Rect expandedRect = new Rect(
           selectionRect.x - selectionTolerance,
           selectionRect.y - selectionTolerance,
           selectionRect.width + (selectionTolerance * 2),
           selectionRect.height + (selectionTolerance * 2)
       );
      
       bool isInRect = expandedRect.Contains(new Vector2(screenPos.x, screenPos.y));
      
       if (debugMode && drawDebugRays)
       {
           Debug.DrawRay(minion.transform.position, Vector3.up * 2f, isInRect ? Color.green : Color.red, 1f);
       }
      
       return isInRect;
   }


   bool IsBoundsInSelectionRect(Bounds bounds, Rect selectionRect)
   {
       // Check multiple points of the bounds to ensure accurate selection
       Vector3[] boundPoints = new Vector3[8];
      
       // Get all corners of the bounds
       boundPoints[0] = bounds.min;
       boundPoints[1] = bounds.max;
       boundPoints[2] = new Vector3(bounds.min.x, bounds.min.y, bounds.max.z);
       boundPoints[3] = new Vector3(bounds.min.x, bounds.max.y, bounds.min.z);
       boundPoints[4] = new Vector3(bounds.max.x, bounds.min.y, bounds.min.z);
       boundPoints[5] = new Vector3(bounds.min.x, bounds.max.y, bounds.max.z);
       boundPoints[6] = new Vector3(bounds.max.x, bounds.min.y, bounds.max.z);
       boundPoints[7] = new Vector3(bounds.max.x, bounds.max.y, bounds.min.z);
      
       int pointsInRect = 0;
      
       foreach (Vector3 worldPoint in boundPoints)
       {
           Vector3 screenPoint = mainCamera.WorldToScreenPoint(worldPoint);
          
           // Skip if behind camera
           if (screenPoint.z <= 0) continue;
          
           // Apply tolerance
           Rect expandedRect = new Rect(
               selectionRect.x - selectionTolerance,
               selectionRect.y - selectionTolerance,
               selectionRect.width + (selectionTolerance * 2),
               selectionRect.height + (selectionTolerance * 2)
           );
          
           if (expandedRect.Contains(new Vector2(screenPoint.x, screenPoint.y)))
           {
               pointsInRect++;
           }
       }
      
       // Consider the bounds in the selection rect if at least one point is inside
       return pointsInRect > 0;
   }


   Minion GetMinionUnderMouse()
   {
       Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
       RaycastHit hit;
      
       if (Physics.Raycast(ray, out hit, Mathf.Infinity, selectableLayer))
       {
           Minion minion = hit.collider.GetComponent<Minion>();
           if (minion != null)
           {
               if (debugMode) Debug.Log($"Clicked on minion: {minion.gameObject.name}");
               return minion;
           }
       }
      
       return null;
   }


// Update the HandleCommands method in both RTSSystem and UIRTSSystem
void HandleCommands()
{
    if (Input.GetMouseButtonDown(1) && selectedMinions.Count > 0)
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundLayer | selectableLayer))
        {
            // Check if we clicked on an enemy (minion or building)
            Health enemyHealth = hit.collider.GetComponent<Health>();
            Team enemyTeam = hit.collider.GetComponent<Team>();
            
            if (enemyHealth != null && enemyTeam != null && enemyTeam.GetTeam() != playerTeam && enemyHealth.IsAlive())
            {
                // ATTACK COMMAND
                Debug.Log($"[RTS] Attack command issued to {selectedMinions.Count} units against {hit.collider.gameObject.name}");
                
                foreach (Minion minion in selectedMinions)
                {
                    if (minion != null)
                    {
                        UnitCombat combat = minion.GetComponent<UnitCombat>();
                        if (combat != null)
                        {
                            combat.SetTarget(enemyHealth);
                            Debug.Log($"[RTS] {minion.gameObject.name} targeting {enemyHealth.gameObject.name}");
                        }
                        
                        MinionMovement movement = minion.GetComponent<MinionMovement>();
                        if (movement != null)
                        {
                            movement.ShowAttackMarker(enemyHealth.transform.position);
                        }
                    }
                }
            }
            else
            {
                // MOVE COMMAND
                if (NavMesh.SamplePosition(hit.point, out NavMeshHit navHit, 1.0f, NavMesh.AllAreas))
                {
                    Debug.Log($"[RTS] Move command issued to {selectedMinions.Count} units to {navHit.position}");
                    
                    foreach (Minion minion in selectedMinions)
                    {
                        if (minion != null)
                        {
                            UnitCombat combat = minion.GetComponent<UnitCombat>();
                            if (combat != null)
                            {
                                combat.ClearTarget();
                            }
                            
                            MinionMovement movement = minion.GetComponent<MinionMovement>();
                            if (movement != null)
                            {
                                movement.MoveTo(navHit.position);
                            }
                        }
                    }
                }
            }
        }
    }
}


void SelectMinion(Minion minion)
{
    if (selectedMinions.Contains(minion))
    {
        if (debugMode) Debug.Log($"[SELECTION] {minion.gameObject.name} already selected");
        return;
    }
    
    // Team check
    Team minionTeam = minion.GetComponent<Team>();
    if (minionTeam != null && minionTeam.GetTeam() != playerTeam)
    {
        if (debugMode) Debug.Log($"[SELECTION] Cannot select enemy unit: {minion.gameObject.name}");
        return;
    }

    selectedMinions.Add(minion);
    
    // Apply selection material to non-health bar renderers
    Renderer[] allRenderers = minion.GetComponentsInChildren<Renderer>();
    List<Material[]> originalMatsList = new List<Material[]>();
    
    foreach (Renderer renderer in allRenderers)
    {
        // Skip health bar and its children
        if (renderer.transform.parent != null && 
            (renderer.transform.parent.name.Contains("HealthBar") || 
             renderer.gameObject.name.Contains("HealthBar")))
        {
            continue;
        }
        
        Material[] originalMats = new Material[renderer.materials.Length];
        for (int i = 0; i < renderer.materials.Length; i++)
        {
            originalMats[i] = renderer.materials[i];
        }
        originalMatsList.Add(originalMats);
        
        // Apply selection material
        if (selectedMaterial != null)
        {
            Material[] selectionMats = new Material[renderer.materials.Length];
            for (int i = 0; i < selectionMats.Length; i++)
            {
                selectionMats[i] = selectedMaterial;
            }
            renderer.materials = selectionMats;
        }
    }
    
    // FIX: Add to list instead of dictionary
    originalMaterials.Add(originalMatsList.ToArray());
    minion.OnSelected();
    
    if (debugMode) Debug.Log($"[SELECTION] Selected {minion.gameObject.name}");
}

// Update ClearSelection method in UIRTSSystem
void ClearSelection()
{
    if (debugMode) Debug.Log($"[SELECTION] Clearing selection of {selectedMinions.Count} minions");
    
    for (int i = 0; i < selectedMinions.Count; i++)
    {
        if (selectedMinions[i] != null)
        {
            Renderer[] renderers = selectedMinions[i].GetComponentsInChildren<Renderer>();
            int materialIndex = 0;
            
            foreach (Renderer renderer in renderers)
            {
                // Skip health bar renderers
                if (renderer.transform.parent != null && 
                    (renderer.transform.parent.name.Contains("HealthBar") || 
                     renderer.gameObject.name.Contains("HealthBar")))
                {
                    continue;
                }
                
                if (i < originalMaterials.Count && materialIndex < originalMaterials[i].Length)
                {
                    renderer.materials = originalMaterials[i][materialIndex];
                    materialIndex++;
                }
            }
            
            selectedMinions[i].OnDeselected();
        }
    }
    
    selectedMinions.Clear();
    originalMaterials.Clear();
}


   void MoveGroupTo(Vector3 destination)
   {
       int count = selectedMinions.Count;
       if (count == 0) return;
      
       int rows = Mathf.CeilToInt(Mathf.Sqrt(count));
       float spacing = 2f;
      
       for (int i = 0; i < count; i++)
       {
           if (selectedMinions[i] == null) continue;
          
           int row = i / rows;
           int col = i % rows;
          
           Vector3 offset = new Vector3(
               (col - (rows - 1) * 0.5f) * spacing,
               0,
               (row - (rows - 1) * 0.5f) * spacing
           );
          
           Vector3 targetPos = destination + offset;
          
           if (NavMesh.SamplePosition(targetPos, out NavMeshHit hit, 2f, NavMesh.AllAreas))
           {
               MinionMovement movement = selectedMinions[i].GetComponent<MinionMovement>();
               if (movement != null)
               {
                   movement.MoveTo(hit.position);
               }
           }
       }
   }


   [ContextMenu("Test Top Screen Selection")]
   void TestTopScreenSelection()
   {
       Debug.Log("=== TESTING TOP SCREEN SELECTION ===");
      
       // Create a test selection rectangle at the top of the screen
       Rect testRect = new Rect(Screen.width * 0.25f, Screen.height * 0.75f, Screen.width * 0.5f, Screen.height * 0.2f);
       Debug.Log($"Test Rect: {testRect}");
      
       int foundMinions = 0;
       foreach (Minion minion in minionCache)
       {
           if (minion == null) continue;
          
           Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
           Debug.Log($"Minion {minion.gameObject.name} at screen position: {screenPos}");
          
           if (testRect.Contains(new Vector2(screenPos.x, screenPos.y)))
           {
               Debug.Log($"MINION IN TEST RECT: {minion.gameObject.name}");
               foundMinions++;
           }
       }
      
       Debug.Log($"Found {foundMinions} minions in top screen area");
       Debug.Log("=== TEST COMPLETE ===");
   }


   [ContextMenu("Debug All Minion Positions")]
   void DebugAllMinionPositions()
   {
       Debug.Log("=== MINION SCREEN POSITIONS ===");
       foreach (Minion minion in minionCache)
       {
           if (minion == null) continue;
          
           Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
           string status = screenPos.z > 0 ? "ON SCREEN" : "BEHIND CAMERA";
           Team team = minion.GetComponent<Team>();
           string teamInfo = team != null ? $"Team: {team.GetTeam()}" : "No Team";
           Debug.Log($"{minion.gameObject.name}: {screenPos} - {status} - {teamInfo}");
       }
       Debug.Log("=== END POSITIONS ===");
   }


   void OnDrawGizmos()
   {
       if (!drawDebugRays) return;
      
       // Draw debug rays from camera to minions
       foreach (Minion minion in minionCache)
       {
           if (minion == null) continue;
          
           Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
           if (screenPos.z > 0)
           {
               // Green if on screen, red if off screen
               bool onScreen = screenPos.x >= 0 && screenPos.x <= Screen.width &&
                              screenPos.y >= 0 && screenPos.y <= Screen.height;
               Gizmos.color = onScreen ? Color.green : Color.red;
               Gizmos.DrawLine(mainCamera.transform.position, minion.transform.position);
           }
       }
   }
}