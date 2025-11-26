using UnityEngine;
using UnityEngine.EventSystems;

public class BuildingSelectionHandler : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask buildingLayer = 1 << 8;
    [SerializeField] private TeamAffiliation playerTeam = TeamAffiliation.Team1;

    [Header("UI Reference")]
    [SerializeField] private RecruitmentUI recruitmentUI;

    private Camera mainCamera;
    private RecruitmentBuilding selectedBuilding;

    void Start()
    {
        mainCamera = Camera.main;
        
        // Ensure we have a UI reference
        if (recruitmentUI == null)
        {
            recruitmentUI = FindObjectOfType<RecruitmentUI>(true); // Include inactive objects
            if (recruitmentUI == null)
            {
                Debug.LogError("BuildingSelectionManager: No RecruitmentUI found in scene!");
                // Create a simple UI if none exists
                CreateFallbackUI();
            }
        }

        Debug.Log("Building Selection Manager initialized");
    }

    void Update()
    {
        HandleBuildingSelection();
    }

    void HandleBuildingSelection()
    {
        if (Input.GetMouseButtonDown(0))
        {
            // Skip if clicking on UI
            if (EventSystem.current.IsPointerOverGameObject())
            {
                Debug.Log("Clicked on UI, ignoring building selection");
                return;
            }

            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit;

            if (Physics.Raycast(ray, out hit, Mathf.Infinity, buildingLayer))
            {
                RecruitmentBuilding building = hit.collider.GetComponentInParent<RecruitmentBuilding>();
                if (building != null)
                {
                    // Team check
                    Team buildingTeam = building.GetComponent<Team>();
                    if (buildingTeam != null && buildingTeam.GetTeam() == playerTeam)
                    {
                        SelectBuilding(building);
                        return;
                    }
                }
            }

            // Clicked on empty space - deselect
            DeselectBuilding();
        }
    }

    void SelectBuilding(RecruitmentBuilding building)
    {
        // Deselect previous building
        if (selectedBuilding != null && selectedBuilding != building)
        {
            DeselectBuilding();
        }

        selectedBuilding = building;
        
        // Show UI
        if (recruitmentUI != null)
        {
            recruitmentUI.ShowUI(building);
            Debug.Log($"Building UI shown for: {building.gameObject.name}");
        }
        else
        {
            Debug.LogError("RecruitmentUI is null!");
        }

        Debug.Log($"Building selected: {building.gameObject.name}");
    }

    void DeselectBuilding()
    {
        if (selectedBuilding != null)
        {
            if (recruitmentUI != null)
            {
                recruitmentUI.HideUI();
            }
            selectedBuilding = null;
            Debug.Log("Building deselected");
        }
    }

    void CreateFallbackUI()
    {
        Debug.LogWarning("Creating fallback recruitment UI");
        // You can create a simple UI programmatically here if needed
    }

    [ContextMenu("Test Building Selection")]
    void TestSelectBuilding()
    {
        RecruitmentBuilding[] buildings = FindObjectsOfType<RecruitmentBuilding>();
        foreach (RecruitmentBuilding building in buildings)
        {
            Team team = building.GetComponent<Team>();
            if (team != null && team.GetTeam() == playerTeam)
            {
                SelectBuilding(building);
                break;
            }
        }
    }
}