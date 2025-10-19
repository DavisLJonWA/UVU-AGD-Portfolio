using UnityEngine;
using UnityEngine.AI;
using System.Collections.Generic;

public class RTSSystem : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask selectableLayer = 1 << 6;
    [SerializeField] private LayerMask groundLayer = 1 << 7;
    [SerializeField] private Material selectedMaterial;
    
    [Header("Selection Visual")]
    [SerializeField] private GameObject selectionBoxPrefab;
    [SerializeField] private Color selectionBoxColor = new Color(0, 0.5f, 1f, 0.3f);
    [SerializeField] private Color selectionBoxBorderColor = Color.blue;
    
    private List<Minion> selectedMinions = new List<Minion>();
    private Camera mainCamera;
    private Vector3 selectionStartWorld;
    private bool isSelecting = false;
    private GameObject selectionBox;
    private MeshRenderer selectionBoxRenderer;

    void Start()
    {
        mainCamera = Camera.main;
        CreateSelectionBox();
    }

    void CreateSelectionBox()
    {
        // Create selection box visual
        selectionBox = new GameObject("SelectionBox");
        selectionBox.transform.SetParent(transform);
        
        // Add mesh components
        MeshFilter meshFilter = selectionBox.AddComponent<MeshFilter>();
        selectionBoxRenderer = selectionBox.AddComponent<MeshRenderer>();
        
        // Create a simple quad mesh
        Mesh mesh = new Mesh();
        mesh.vertices = new Vector3[] {
            new Vector3(0, 0, 0),
            new Vector3(1, 0, 0),
            new Vector3(1, 1, 0),
            new Vector3(0, 1, 0)
        };
        mesh.triangles = new int[] { 0, 1, 2, 2, 3, 0 };
        mesh.uv = new Vector2[] {
            new Vector2(0, 0),
            new Vector2(1, 0),
            new Vector2(1, 1),
            new Vector2(0, 1)
        };
        meshFilter.mesh = mesh;
        
        // Create material for selection box
        Material material = new Material(Shader.Find("Standard"));
        material.color = selectionBoxColor;
        material.SetFloat("_Mode", 2); // Fade mode
        material.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
        material.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
        material.SetInt("_ZWrite", 0);
        material.DisableKeyword("_ALPHATEST_ON");
        material.EnableKeyword("_ALPHABLEND_ON");
        material.DisableKeyword("_ALPHAPREMULTIPLY_ON");
        material.renderQueue = 3000;
        
        selectionBoxRenderer.material = material;
        selectionBox.SetActive(false);
    }

    void Update()
    {
        HandleSelectionInput();
        HandleCommands();
    }

    void HandleSelectionInput()
    {
        // Start selection
        if (Input.GetMouseButtonDown(0))
        {
            StartSelection();
        }

        // Update selection
        if (Input.GetMouseButton(0) && isSelecting)
        {
            UpdateSelection();
        }

        // End selection
        if (Input.GetMouseButtonUp(0) && isSelecting)
        {
            EndSelection();
        }
    }

    void StartSelection()
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundLayer))
        {
            selectionStartWorld = hit.point;
            isSelecting = true;
            selectionBox.SetActive(true);
            
            // Only clear selection if not holding shift
            if (!Input.GetKey(KeyCode.LeftShift))
            {
                ClearSelection();
            }
        }
    }

    void UpdateSelection()
    {
        // Keep the selection box active while dragging
        if (selectionBox.activeInHierarchy)
        {
            UpdateSelectionBoxVisual();
        }
    }

    void EndSelection()
    {
        isSelecting = false;
        selectionBox.SetActive(false);
        
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundLayer))
        {
            Vector3 selectionEndWorld = hit.point;
            
            // Check if it was a click (small selection area)
            float selectionSize = Vector3.Distance(selectionStartWorld, selectionEndWorld);
            
            if (selectionSize < 1f)
            {
                // Single click selection
                HandleSingleClickSelection(hit.point);
            }
            else
            {
                // Box selection
                HandleBoxSelection(selectionStartWorld, selectionEndWorld);
            }
        }
    }

    void HandleSingleClickSelection(Vector3 clickPosition)
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, selectableLayer))
        {
            Minion minion = hit.collider.GetComponent<Minion>();
            if (minion != null)
            {
                SelectMinion(minion);
            }
        }
    }

    void HandleBoxSelection(Vector3 startWorld, Vector3 endWorld)
    {
        // Calculate selection bounds in world space
        Bounds selectionBounds = new Bounds();
        selectionBounds.SetMinMax(
            Vector3.Min(startWorld, endWorld),
            Vector3.Max(startWorld, endWorld)
        );
        
        // Expand bounds vertically to catch all minions
        selectionBounds.Expand(new Vector3(0, 10f, 0));
        
        // Find all minions in scene
        Minion[] allMinions = FindObjectsOfType<Minion>();
        
        foreach (Minion minion in allMinions)
        {
            if (selectionBounds.Contains(minion.transform.position))
            {
                SelectMinion(minion);
            }
        }
    }

    void UpdateSelectionBoxVisual()
    {
        if (!isSelecting) return;

        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        
        if (Physics.Raycast(ray, out hit, Mathf.Infinity, groundLayer))
        {
            Vector3 currentWorldPos = hit.point;
            
            // Calculate center and size of selection box
            Vector3 center = (selectionStartWorld + currentWorldPos) / 2f;
            Vector3 size = new Vector3(
                Mathf.Abs(currentWorldPos.x - selectionStartWorld.x),
                0.1f,
                Mathf.Abs(currentWorldPos.z - selectionStartWorld.z)
            );
            
            // Position and scale the selection box
            selectionBox.transform.position = center + Vector3.up * 0.05f;
            selectionBox.transform.localScale = size;
        }
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
                    // Show move markers
                    foreach (Minion minion in selectedMinions)
                    {
                        minion.ShowMoveMarker(navHit.position);
                    }

                    // Move units
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
        
        // Simple formation calculation
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

    // Visual debug
    void OnDrawGizmos()
    {
        if (isSelecting)
        {
            Gizmos.color = Color.blue;
            Gizmos.DrawWireCube(selectionBox.transform.position, selectionBox.transform.localScale);
        }
    }
}