using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems; // Add this

public class RecruitmentUI : MonoBehaviour
{
   [Header("UI References")]
   [SerializeField] private Canvas recruitmentCanvas;
   [SerializeField] private GameObject recruitmentPanel;
   [SerializeField] private Button recruitButton;
   [SerializeField] private TextMeshProUGUI queueCountText;
   [SerializeField] private TextMeshProUGUI queueStatusText;
   [SerializeField] private Slider progressSlider;
   [SerializeField] private Image progressFill;
  
   [Header("Visual Settings")]
   [SerializeField] private Color activeColor = Color.green;
   [SerializeField] private Color inactiveColor = Color.gray;
  
   private RecruitmentBuilding currentBuilding;
   private bool isUIVisible = false;

   void Start()
   {
       // Ensure the panel is hidden initially
       if (recruitmentPanel != null)
       {
           recruitmentPanel.SetActive(false);
       }
       else
       {
           Debug.LogError("RecruitmentUI: recruitmentPanel is not assigned!");
       }
      
       // Setup button listener with null check
       if (recruitButton != null)
       {
           recruitButton.onClick.AddListener(OnRecruitButtonClicked);
           Debug.Log("Recruit button listener added");
       }
       else
       {
           Debug.LogError("RecruitmentUI: recruitButton is not assigned!");
       }
      
       // Set initial colors
       UpdateButtonState();
   }

   void Update()
   {
       if (isUIVisible && currentBuilding != null)
       {
           UpdateUI();
       }
   }

   public void ShowUI(RecruitmentBuilding building)
   {
       if (building == null)
       {
           Debug.LogError("RecruitmentUI: Cannot show UI for null building");
           return;
       }

       currentBuilding = building;
       isUIVisible = true;
       
       if (recruitmentPanel != null)
       {
           recruitmentPanel.SetActive(true);
       }

       // Subscribe to building events
       if (currentBuilding != null)
       {
           currentBuilding.onQueueUpdated.AddListener(OnQueueUpdated);
           currentBuilding.onRecruitmentProgress.AddListener(OnRecruitmentProgress);
       }
      
       UpdateUI();
       Debug.Log($"Recruitment UI shown for {building.gameObject.name}");
   }

   public void HideUI()
   {
       isUIVisible = false;
       
       if (recruitmentPanel != null)
       {
           recruitmentPanel.SetActive(false);
       }

       // Unsubscribe from events
       if (currentBuilding != null)
       {
           currentBuilding.onQueueUpdated.RemoveListener(OnQueueUpdated);
           currentBuilding.onRecruitmentProgress.RemoveListener(OnRecruitmentProgress);
       }
      
       currentBuilding = null;
       Debug.Log("Recruitment UI hidden");
   }

   void UpdateUI()
   {
       if (currentBuilding == null) 
       {
           Debug.LogWarning("RecruitmentUI: Cannot update UI - no current building");
           return;
       }
      
       // Update queue count
       int queueCount = currentBuilding.GetQueueCount();
       int maxQueue = currentBuilding.GetMaxQueueSize();
       
       if (queueCountText != null)
       {
           queueCountText.text = $"{queueCount}/{maxQueue}";
       }

       // Update queue status
       if (queueStatusText != null)
       {
           if (currentBuilding.IsRecruiting())
           {
               queueStatusText.text = "RECRUITING...";
               queueStatusText.color = Color.yellow;
           }
           else if (queueCount > 0)
           {
               queueStatusText.text = "QUEUED";
               queueStatusText.color = Color.white;
           }
           else
           {
               queueStatusText.text = "READY";
               queueStatusText.color = Color.green;
           }
       }
      
       // Update button state
       UpdateButtonState();
   }

   void UpdateButtonState()
   {
       if (currentBuilding == null || recruitButton == null) return;
      
       bool canRecruit = currentBuilding.GetQueueCount() < currentBuilding.GetMaxQueueSize();
       recruitButton.interactable = canRecruit;
      
       // Visual feedback
       if (recruitButton.image != null)
       {
           recruitButton.image.color = canRecruit ? activeColor : inactiveColor;
       }
   }

   void OnRecruitButtonClicked()
   {
       Debug.Log("Recruit button clicked!");
       
       if (currentBuilding != null)
       {
           currentBuilding.QueueRecruitment();
           UpdateUI();
           Debug.Log("Recruitment queued successfully");
       }
       else
       {
           Debug.LogError("RecruitmentUI: Cannot queue recruitment - no current building!");
       }
   }

   void OnQueueUpdated(int queueSize)
   {
       UpdateUI();
   }

   void OnRecruitmentProgress(float progress)
   {
       if (progressSlider != null)
       {
           progressSlider.value = progress;
       }
      
       // Optional: Change color based on progress
       if (progressFill != null)
       {
           progressFill.color = Color.Lerp(Color.red, Color.green, progress);
       }
   }

   void OnDestroy()
   {
       // Cleanup
       if (recruitButton != null)
       {
           recruitButton.onClick.RemoveListener(OnRecruitButtonClicked);
       }
      
       if (currentBuilding != null)
       {
           currentBuilding.onQueueUpdated.RemoveListener(OnQueueUpdated);
           currentBuilding.onRecruitmentProgress.RemoveListener(OnRecruitmentProgress);
       }
   }
   

   
   [ContextMenu("Test Show UI")]
   public void TestShowUI()
   {
       RecruitmentBuilding testBuilding = FindObjectOfType<RecruitmentBuilding>();
       if (testBuilding != null)
       {
           ShowUI(testBuilding);
       }
       else
       {
           Debug.LogError("No RecruitmentBuilding found in scene!");
       }
   }
}