using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;
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
    
    [Header("Performance Settings")]
    [SerializeField] private float minionUpdateInterval = 0.1f; // Batch minion updates
    [SerializeField] private int maxMinionsToProcessPerFrame = 10;
    
    [Header("Debug")]
    [SerializeField] private bool debugMode = false;
    
    // Optimized data structures
    private List<Minion> selectedMinions = new List<Minion>();
    private Dictionary<Minion, Material[]> originalMaterials = new Dictionary<Minion, Material[]>();
    private Minion[] minionCache;
    private float lastMinionCacheTime;
    private float minionCacheRefreshRate = 1f; // Refresh cache every second
    
    private Camera mainCamera;
    private Vector2 selectionStart;
    private bool isSelecting = false;
    private float nextMinionUpdateTime;

    void Start()
    {
        mainCamera = Camera.main;
        InitializeUI();
        CacheMinions(); // Initial cache
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
        
        // Update minion cache periodically (less frequent than every frame)
        if (Time.time - lastMinionCacheTime > minionCacheRefreshRate)
        {
            CacheMinions();
        }
    }

    void CacheMinions()
    {
        // Only recache if enough time has passed
        minionCache = FindObjectsOfType<Minion>();
        lastMinionCacheTime = Time.time;
        
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
        
        // Only clear selection if not holding shift for multi-select
        if (!Input.GetKey(KeyCode.LeftShift))
        {
            // Check if we clicked directly on a minion
            Minion clickedMinion = GetMinionUnderMouse();
            if (clickedMinion == null)
            {
                ClearSelection();
            }
        }
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
        
        if (dragDistance < 10f)
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
            if (!Input.GetKey(KeyCode.LeftShift))
            {
                ClearSelection();
            }
            SelectMinion(minion);
        }
    }

    void HandleBoxSelection(Vector2 startScreen, Vector2 endScreen)
    {
        Rect selectionRect = GetScreenRect(startScreen, endScreen);
        int selectedCount = 0;
        int processedThisFrame = 0;
        
        // Use cached minions instead of FindObjectsOfType every time
        foreach (Minion minion in minionCache)
        {
            if (minion == null) continue;
            
            // Limit processing per frame to prevent lag with many minions
            if (processedThisFrame >= maxMinionsToProcessPerFrame)
            {
                // Continue processing next frame
                if (debugMode) Debug.Log("Reached minion processing limit for this frame");
                break;
            }
            
            Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
            
            // Skip if behind camera
            if (screenPos.z < 0) continue;
            
            Vector2 screenPos2D = new Vector2(screenPos.x, screenPos.y);
            
            if (selectionRect.Contains(screenPos2D))
            {
                SelectMinion(minion);
                selectedCount++;
            }
            
            processedThisFrame++;
        }
        
        if (debugMode) Debug.Log($"Box selection: {selectedCount} minions selected");
    }

    Rect GetScreenRect(Vector2 screenPosition1, Vector2 screenPosition2)
    {
        screenPosition1.y = Screen.height - screenPosition1.y;
        screenPosition2.y = Screen.height - screenPosition2.y;
        
        Vector2 topLeft = Vector2.Min(screenPosition1, screenPosition2);
        Vector2 bottomRight = Vector2.Max(screenPosition1, screenPosition2);
        
        return Rect.MinMaxRect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
    }

    Minion GetMinionUnderMouse()
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, selectableLayer))
        {
            return hit.collider.GetComponent<Minion>();
        }
        
        return null;
    }

    void HandleCommands()
    {
        if (Input.GetMouseButtonDown(1) && selectedMinions.Count > 0)
        {
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            
            if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundLayer))
            {
                if (NavMesh.SamplePosition(hit.point, out NavMeshHit navHit, 1.0f, NavMesh.AllAreas))
                {
                    // Process commands in batches to avoid frame spikes
                    StartCoroutine(ProcessCommandsCoroutine(navHit.position));
                }
            }
        }
    }

    private System.Collections.IEnumerator ProcessCommandsCoroutine(Vector3 destination)
    {
        if (debugMode) Debug.Log($"Commanding {selectedMinions.Count} minions to {destination}");
        
        int processed = 0;
        foreach (Minion minion in selectedMinions)
        {
            if (minion == null) continue;
            
            minion.ShowMoveMarker(destination);
            processed++;
            
            // Yield every few minions to spread workload across frames
            if (processed % 5 == 0)
                yield return null;
        }
        
        // Move minions
        if (selectedMinions.Count == 1)
        {
            if (selectedMinions[0] != null)
            {
                selectedMinions[0].MoveTo(destination);
            }
        }
        else
        {
            MoveGroupTo(destination);
        }
    }

    void SelectMinion(Minion minion)
    {
        if (selectedMinions.Contains(minion)) return;
        
        selectedMinions.Add(minion);
        
        // Apply selection material with caching
        if (selectedMaterial != null)
        {
            Renderer[] renderers = minion.GetComponentsInChildren<Renderer>();
            Material[] originalMats = new Material[renderers.Length];
            
            for (int i = 0; i < renderers.Length; i++)
            {
                if (renderers[i] != null)
                {
                    originalMats[i] = renderers[i].material;
                    renderers[i].material = selectedMaterial;
                }
            }
            
            originalMaterials[minion] = originalMats;
        }
        
        minion.OnSelected();
    }

    void ClearSelection()
    {
        // Restore original materials using dictionary for faster lookups
        foreach (Minion minion in selectedMinions)
        {
            if (minion != null)
            {
                if (originalMaterials.TryGetValue(minion, out Material[] originalMats))
                {
                    Renderer[] renderers = minion.GetComponentsInChildren<Renderer>();
                    for (int j = 0; j < renderers.Length && j < originalMats.Length; j++)
                    {
                        if (renderers[j] != null && originalMats[j] != null)
                        {
                            renderers[j].material = originalMats[j];
                        }
                    }
                    originalMaterials.Remove(minion);
                }
                minion.OnDeselected();
            }
        }
        
        selectedMinions.Clear();
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
                selectedMinions[i].MoveTo(hit.position);
            }
        }
    }
}