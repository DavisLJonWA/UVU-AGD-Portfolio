using UnityEngine;
using UnityEngine.UI;
using TMPro;

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
        // Hide UI initially
        recruitmentPanel.SetActive(false);
        
        // Setup button listener
        recruitButton.onClick.AddListener(OnRecruitButtonClicked);
        
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
        currentBuilding = building;
        isUIVisible = true;
        recruitmentPanel.SetActive(true);
        
        // Subscribe to building events
        if (currentBuilding != null)
        {
            currentBuilding.onQueueUpdated.AddListener(OnQueueUpdated);
            currentBuilding.onRecruitmentProgress.AddListener(OnRecruitmentProgress);
        }
        
        UpdateUI();
        Debug.Log("Recruitment UI shown");
    }

    public void HideUI()
    {
        isUIVisible = false;
        recruitmentPanel.SetActive(false);
        
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
        if (currentBuilding == null) return;
        
        // Update queue count
        int queueCount = currentBuilding.GetQueueCount();
        int maxQueue = currentBuilding.GetMaxQueueSize();
        queueCountText.text = $"{queueCount}/{maxQueue}";
        
        // Update queue status
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
        
        // Update button state
        UpdateButtonState();
    }

    void UpdateButtonState()
    {
        if (currentBuilding == null) return;
        
        bool canRecruit = currentBuilding.GetQueueCount() < currentBuilding.GetMaxQueueSize();
        recruitButton.interactable = canRecruit;
        
        // Visual feedback
        recruitButton.image.color = canRecruit ? activeColor : inactiveColor;
    }

    void OnRecruitButtonClicked()
    {
        if (currentBuilding != null)
        {
            currentBuilding.QueueRecruitment();
            UpdateUI();
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

    [ContextMenu("Test UI Show")]
    void TestUIShow()
    {
        RecruitmentBuilding testBuilding = FindObjectOfType<RecruitmentBuilding>();
        if (testBuilding != null)
        {
            ShowUI(testBuilding);
        }
    }

    [ContextMenu("Test UI Hide")]
    void TestUIHide()
    {
        HideUI();
    }
}