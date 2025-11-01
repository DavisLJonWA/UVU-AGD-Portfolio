using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;
using System.Collections.Generic;

public class RTSSystem : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask selectableLayer = 1 << 6;
    [SerializeField] private LayerMask groundLayer = 1 << 7;
    [SerializeField] private Material selectedMaterial;
    
    [Header("UI References")]
    [SerializeField] private RectTransform selectionBox;
    [SerializeField] private Canvas canvas;
    
    [Header("Selection Thresholds")]
    [SerializeField] private float clickDragThreshold = 20f;
    
    [Header("Debug")]
    [SerializeField] private bool debugMode = true;
    
    private List<Minion> selectedMinions = new List<Minion>();
    private List<Material[]> originalMaterials = new List<Material[]>();
    private Camera mainCamera;
    private Vector2 selectionStart;
    private bool isSelecting = false;

    void Start()
    {
        mainCamera = Camera.main;
        
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
        
        if (debugMode) Debug.Log("RTSSystem initialized");
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
        boxObj.transform.SetAsLastSibling();
        
        selectionBox = boxObj.AddComponent<RectTransform>();
        Image boxImage = boxObj.AddComponent<Image>();
        
        boxImage.color = new Color(0.2f, 0.4f, 1f, 0.4f);
        
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
            UpdateSelectionBoxPosition(selectionStart, selectionStart);
        }
        
        // Only clear selection if not holding shift for multi-select
        if (!Input.GetKey(KeyCode.LeftShift))
        {
            ClearSelection();
        }
        
        if (debugMode) Debug.Log("Selection started");
    }

    void UpdateSelectionBox()
    {
        if (selectionBox == null) return;
        UpdateSelectionBoxPosition(selectionStart, Input.mousePosition);
    }

    void UpdateSelectionBoxPosition(Vector2 startPos, Vector2 currentPos)
    {
        float width = currentPos.x - startPos.x;
        float height = currentPos.y - startPos.y;
        
        Vector2 boxPosition = new Vector2(
            Mathf.Min(startPos.x, currentPos.x),
            Mathf.Min(startPos.y, currentPos.y)
        );
        
        Vector2 boxSize = new Vector2(Mathf.Abs(width), Mathf.Abs(height));
        
        selectionBox.anchoredPosition = boxPosition;
        selectionBox.sizeDelta = boxSize;
    }

    void EndSelection()
    {
        isSelecting = false;
        
        if (selectionBox != null)
        {
            selectionBox.gameObject.SetActive(false);
        }
        
        Vector2 selectionEnd = Input.mousePosition;
        
        if (Vector2.Distance(selectionStart, selectionEnd) < clickDragThreshold)
        {
            HandleSingleClickSelection();
        }
        else
        {
            HandleBoxSelection(selectionStart, selectionEnd);
        }
        
        if (debugMode) Debug.Log($"Selection ended. {selectedMinions.Count} minions selected");
    }

    void HandleSingleClickSelection()
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, selectableLayer))
        {
            Minion minion = hit.collider.GetComponent<Minion>();
            if (minion != null)
            {
                // If shift is held, add to selection instead of replacing
                if (!Input.GetKey(KeyCode.LeftShift))
                {
                    ClearSelection();
                }
                SelectMinion(minion);
                
                if (debugMode) Debug.Log($"Single click selected: {minion.gameObject.name}");
            }
        }
        else
        {
            // Clicked on empty space - clear selection unless shift is held
            if (!Input.GetKey(KeyCode.LeftShift))
            {
                ClearSelection();
            }
        }
    }

    void HandleBoxSelection(Vector2 startScreen, Vector2 endScreen)
    {
        Rect selectionRect = GetScreenRect(startScreen, endScreen);
        Minion[] allMinions = FindObjectsOfType<Minion>();
        
        int selectedCount = 0;
        foreach (Minion minion in allMinions)
        {
            Vector2 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
            if (selectionRect.Contains(screenPos))
            {
                SelectMinion(minion);
                selectedCount++;
            }
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
                    if (debugMode) Debug.Log($"Commanding {selectedMinions.Count} minions to {navHit.position}");
                    
                    // Show move markers for all SELECTED minions only
                    foreach (Minion minion in selectedMinions)
                    {
                        if (minion != null)
                        {
                            minion.ShowMoveMarker(navHit.position);
                        }
                    }

                    // Move only SELECTED minions
                    if (selectedMinions.Count == 1)
                    {
                        if (selectedMinions[0] != null)
                        {
                            selectedMinions[0].MoveTo(navHit.position);
                        }
                    }
                    else
                    {
                        MoveGroupTo(navHit.position);
                    }
                }
            }
        }
    }

    void SelectMinion(Minion minion)
    {
        if (selectedMinions.Contains(minion)) 
        {
            if (debugMode) Debug.Log($"Minion {minion.gameObject.name} already selected");
            return;
        }
        
        selectedMinions.Add(minion);
        
        // Store original materials and apply selection material
        Renderer[] renderers = minion.GetComponentsInChildren<Renderer>();
        Material[] originalMats = new Material[renderers.Length];
        
        for (int i = 0; i < renderers.Length; i++)
        {
            if (renderers[i] != null)
            {
                originalMats[i] = renderers[i].material;
                if (selectedMaterial != null)
                {
                    renderers[i].material = selectedMaterial;
                }
            }
        }
        
        originalMaterials.Add(originalMats);
        minion.OnSelected();
        
        if (debugMode) Debug.Log($"Selected minion: {minion.gameObject.name}");
    }

    void ClearSelection()
    {
        if (debugMode) Debug.Log($"Clearing selection of {selectedMinions.Count} minions");
        
        // Restore original materials for all selected minions
        for (int i = 0; i < selectedMinions.Count; i++)
        {
            if (selectedMinions[i] != null)
            {
                Renderer[] renderers = selectedMinions[i].GetComponentsInChildren<Renderer>();
                if (i < originalMaterials.Count && originalMaterials[i] != null)
                {
                    for (int j = 0; j < renderers.Length && j < originalMaterials[i].Length; j++)
                    {
                        if (renderers[j] != null && originalMaterials[i][j] != null)
                        {
                            renderers[j].material = originalMaterials[i][j];
                        }
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
        
        // Simple formation calculation - only for SELECTED minions
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
        
        if (debugMode) Debug.Log($"Moved group of {count} minions to formation");
    }

    // Debug methods
    [ContextMenu("Log Selected Minions")]
    void LogSelectedMinions()
    {
        Debug.Log($"=== SELECTED MINIONS: {selectedMinions.Count} ===");
        for (int i = 0; i < selectedMinions.Count; i++)
        {
            if (selectedMinions[i] != null)
            {
                Debug.Log($"{i}: {selectedMinions[i].gameObject.name}");
            }
            else
            {
                Debug.Log($"{i}: NULL (missing minion)");
            }
        }
    }

    [ContextMenu("Clear Selection")]
    void ClearSelectionContext()
    {
        ClearSelection();
    }

    [ContextMenu("Select All Minions")]
    void SelectAllMinions()
    {
        ClearSelection();
        Minion[] allMinions = FindObjectsOfType<Minion>();
        foreach (Minion minion in allMinions)
        {
            SelectMinion(minion);
        }
        Debug.Log($"Selected all {allMinions.Length} minions");
    }
}