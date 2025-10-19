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
    
    private List<Minion> selectedMinions = new List<Minion>();
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
        
        // Set anchors and pivot to stretch properly
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
            // Start with zero size at click position
            selectionBox.anchoredPosition = selectionStart;
            selectionBox.sizeDelta = Vector2.zero;
        }
        
        if (!Input.GetKey(KeyCode.LeftShift))
        {
            Minion clickedMinion = GetMinionUnderMouse();
            if (clickedMinion == null)
            {
                ClearSelection();
            }
        }
    }

    void UpdateSelectionBox()
    {
        if (selectionBox == null) return;
        
        Vector2 currentMousePos = Input.mousePosition;
        
        // Calculate the rectangle from start to current position
        float width = currentMousePos.x - selectionStart.x;
        float height = currentMousePos.y - selectionStart.y;
        
        // Set position - always use the minimum coordinates as anchor
        Vector2 boxPosition = new Vector2(
            Mathf.Min(selectionStart.x, currentMousePos.x),
            Mathf.Min(selectionStart.y, currentMousePos.y)
        );
        
        // Set size - always use absolute values
        Vector2 boxSize = new Vector2(
            Mathf.Abs(width),
            Mathf.Abs(height)
        );
        
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
        
        if (Vector2.Distance(selectionStart, selectionEnd) < 5f)
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
        Minion[] allMinions = FindObjectsOfType<Minion>();
        
        foreach (Minion minion in allMinions)
        {
            Vector2 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
            
            if (selectionRect.Contains(screenPos))
            {
                SelectMinion(minion);
            }
        }
    }

    Rect GetScreenRect(Vector2 screenPosition1, Vector2 screenPosition2)
    {
        // Convert to bottom-left origin coordinates
        screenPosition1.y = Screen.height - screenPosition1.y;
        screenPosition2.y = Screen.height - screenPosition2.y;
        
        // Calculate the rectangle bounds - always use min/max to handle all directions
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
                    foreach (Minion minion in selectedMinions)
                    {
                        minion.ShowMoveMarker(navHit.position);
                    }

                    if (selectedMinions.Count == 1)
                    {
                        selectedMinions[0].MoveTo(navHit.position);
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
        if (selectedMinions.Contains(minion)) return;
        
        selectedMinions.Add(minion);
        minion.OnSelected(selectedMaterial);
        
        Debug.Log($"Selected: {minion.name}");
    }

    void ClearSelection()
    {
        foreach (Minion minion in selectedMinions)
        {
            if (minion != null)
            {
                minion.OnDeselected();
            }
        }
        
        selectedMinions.Clear();
        Debug.Log("Selection cleared");
    }

    void MoveGroupTo(Vector3 destination)
    {
        int count = selectedMinions.Count;
        if (count == 0) return;
        
        int rows = Mathf.CeilToInt(Mathf.Sqrt(count));
        float spacing = 2f;
        
        for (int i = 0; i < count; i++)
        {
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
        
        Debug.Log($"Moving {count} units to {destination}");
    }
}