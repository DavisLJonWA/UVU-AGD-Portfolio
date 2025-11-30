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

        if (recruitmentUI == null)
        {
            recruitmentUI = FindObjectOfType<RecruitmentUI>();
            if (recruitmentUI == null)
            {
                Debug.LogError("BuildingSelectionHandler: No RecruitmentUI found in scene!");
            }
        }
    }

    void Update()
    {
        HandleBuildingSelection();
    }

    void HandleBuildingSelection()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (EventSystem.current.IsPointerOverGameObject())
                return;

            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, buildingLayer))
            {
                RecruitmentBuilding building = hit.collider.GetComponent<RecruitmentBuilding>();
                if (building != null && IsFriendlyBuilding(building))
                {
                    SelectBuilding(building);
                    return;
                }
            }

            DeselectBuilding();
        }
    }

    bool IsFriendlyBuilding(RecruitmentBuilding building)
    {
        Team buildingTeam = building.GetComponent<Team>();
        return buildingTeam != null && buildingTeam.TeamAffiliation == playerTeam;
    }

    void SelectBuilding(RecruitmentBuilding building)
    {
        if (selectedBuilding == building) return;

        DeselectBuilding();
        
        selectedBuilding = building;
        recruitmentUI.ShowUI(building);
        
        Debug.Log($"Building selected: {building.gameObject.name}");
    }

    void DeselectBuilding()
    {
        if (selectedBuilding != null)
        {
            recruitmentUI.HideUI();
            selectedBuilding = null;
        }
    }

    [ContextMenu("Test Select Building")]
    void TestSelectBuilding()
    {
        RecruitmentBuilding[] buildings = FindObjectsOfType<RecruitmentBuilding>();
        foreach (RecruitmentBuilding building in buildings)
        {
            if (IsFriendlyBuilding(building))
            {
                SelectBuilding(building);
                break;
            }
        }
    }

    [ContextMenu("Force Deselect Building")]
    public void ForceDeselectBuilding()
    {
        DeselectBuilding();
    }
}