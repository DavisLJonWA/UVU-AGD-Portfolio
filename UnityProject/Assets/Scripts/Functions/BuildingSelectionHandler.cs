using UnityEngine;

public class BuildingSelectionHandler : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask buildingLayer = 1 << 8; // Create a "Building" layer
    [SerializeField] private GameAction onBuildingSelected;
    [SerializeField] private GameAction onBuildingDeselected;
    
    private Camera mainCamera;
    private RecruitmentBuilding selectedBuilding;

    void Start()
    {
        mainCamera = Camera.main;
    }

    void Update()
    {
        HandleBuildingSelection();
    }

    void HandleBuildingSelection()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;
            
            if (Physics.Raycast(ray, out hit, Mathf.Infinity, buildingLayer))
            {
                RecruitmentBuilding building = hit.collider.GetComponent<RecruitmentBuilding>();
                if (building != null)
                {
                    // Deselect previous building
                    if (selectedBuilding != null && selectedBuilding != building)
                    {
                        onBuildingDeselected?.RaiseNoArgs();
                    }
                    
                    // Select new building
                    selectedBuilding = building;
                    onBuildingSelected?.RaiseNoArgs();
                    
                    Debug.Log($"Building selected: {building.gameObject.name}");
                }
            }
            else
            {
                // Clicked on empty space - deselect building
                if (selectedBuilding != null)
                {
                    selectedBuilding = null;
                    onBuildingDeselected?.RaiseNoArgs();
                    Debug.Log("Building deselected");
                }
            }
        }
    }

    [ContextMenu("Force Deselect Building")]
    public void ForceDeselectBuilding()
    {
        if (selectedBuilding != null)
        {
            selectedBuilding = null;
            onBuildingDeselected?.RaiseNoArgs();
        }
    }
}