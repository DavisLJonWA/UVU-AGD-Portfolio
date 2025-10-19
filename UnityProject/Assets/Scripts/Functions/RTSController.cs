using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class RTSController : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask selectableLayer = 1 << 6;
    [SerializeField] private LayerMask groundLayer = 1 << 7;
    [SerializeField] private Material selectedMaterial;
    [SerializeField] private RectTransform selectionBox;
    
    private Vector2 selectionStart;
    private List<Minion> selectedMinions = new List<Minion>();
    private Camera mainCamera;
    private bool isSelecting = false;
    private Canvas canvas;

    void Start()
    {
        mainCamera = Camera.main;
        canvas = selectionBox?.GetComponentInParent<Canvas>();
        
        if (selectionBox != null)
            selectionBox.gameObject.SetActive(false);
    }

    void Update()
    {
        HandleSelection();
        HandleCommands();
    }

    void HandleSelection()
    {
        if (Input.GetMouseButtonDown(0))
        {
            selectionStart = Input.mousePosition;
            isSelecting = true;
            
            if (selectionBox != null)
            {
                selectionBox.gameObject.SetActive(true);
                UpdateSelectionBox(selectionStart, selectionStart);
            }
            
            if (!Input.GetKey(KeyCode.LeftShift))
            {
                ClearSelection();
            }
        }

        if (Input.GetMouseButton(0) && isSelecting && selectionBox != null)
        {
            UpdateSelectionBox(selectionStart, Input.mousePosition);
        }

        if (Input.GetMouseButtonUp(0) && isSelecting)
        {
            if (selectionBox != null)
                selectionBox.gameObject.SetActive(false);
            
            FinalizeSelection();
            isSelecting = false;
        }
    }

    void UpdateSelectionBox(Vector2 startPos, Vector2 currentPos)
    {
        // Convert screen coordinates to canvas coordinates
        Vector2 localStart, localCurrent;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            canvas.transform as RectTransform, startPos, canvas.worldCamera, out localStart);
        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            canvas.transform as RectTransform, currentPos, canvas.worldCamera, out localCurrent);

        // Calculate the rectangle
        Vector2 min = Vector2.Min(localStart, localCurrent);
        Vector2 max = Vector2.Max(localStart, localCurrent);
        Vector2 size = max - min;

        // Apply to selection box
        selectionBox.anchoredPosition = min;
        selectionBox.sizeDelta = size;
    }

    void HandleCommands()
    {
        if (Input.GetMouseButtonDown(1) && selectedMinions.Count > 0)
        {
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, groundLayer))
            {
                if (NavMesh.SamplePosition(hit.point, out NavMeshHit navHit, 1.0f, NavMesh.AllAreas))
                {
                    // Create move markers for all selected minions
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

    void FinalizeSelection()
    {
        // Check if it was a click (not drag)
        bool wasClick = Vector2.Distance(selectionStart, Input.mousePosition) < 10f;

        if (wasClick)
        {
            // Single click selection
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit, Mathf.Infinity, selectableLayer))
            {
                Minion minion = hit.collider.GetComponent<Minion>();
                if (minion != null)
                {
                    SelectMinion(minion);
                    return;
                }
            }
        }
        else
        {
            // Box selection
            Rect selectionRect = GetScreenRect(selectionStart, Input.mousePosition);
            Minion[] allMinions = FindObjectsOfType<Minion>();
            
            foreach (Minion minion in allMinions)
            {
                Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
                
                // Check if minion is within selection rect
                if (selectionRect.Contains(screenPos))
                {
                    SelectMinion(minion);
                }
            }
        }
    }

    Rect GetScreenRect(Vector2 screenPosition1, Vector2 screenPosition2)
    {
        // Convert to bottom-left origin coordinates
        screenPosition1.y = Screen.height - screenPosition1.y;
        screenPosition2.y = Screen.height - screenPosition2.y;
        
        // Calculate the rectangle
        Vector2 topLeft = Vector2.Min(screenPosition1, screenPosition2);
        Vector2 bottomRight = Vector2.Max(screenPosition1, screenPosition2);
        
        return Rect.MinMaxRect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
    }

    void SelectMinion(Minion minion)
    {
        if (selectedMinions.Contains(minion)) return;
        
        selectedMinions.Add(minion);
        minion.OnSelected(selectedMaterial);
        
        Debug.Log($"Selected minion: {minion.name}");
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
        
        Debug.Log($"Moving {count} minions to {destination}");
    }

    // Helper method for Minion to check selection status
    public bool IsMinionSelected(Minion minion)
    {
        return selectedMinions.Contains(minion);
    }
    
}