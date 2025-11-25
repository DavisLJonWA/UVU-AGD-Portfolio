using UnityEngine;
using UnityEngine.EventSystems; // Add this namespace

public class BuildingSelectionHandler : MonoBehaviour
{
   [Header("Selection Settings")]
   [SerializeField] private LayerMask buildingLayer = 1 << 8;
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
           // Check if we're clicking on UI - if so, don't process building selection
           if (EventSystem.current.IsPointerOverGameObject())
           {
               return;
           }

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

   // ... rest of your code
}