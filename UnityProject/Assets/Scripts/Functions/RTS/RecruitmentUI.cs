using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class RecruitmentUI : MonoBehaviour
{
    [Header("UI References")]
    [SerializeField] private GameObject recruitmentPanel;
    [SerializeField] private Button recruitButton;
    [SerializeField] private TextMeshProUGUI queueCountText;
    [SerializeField] private TextMeshProUGUI queueStatusText;
    [SerializeField] private Slider progressSlider;

    [Header("Visual Settings")]
    [SerializeField] private Color activeColor = Color.green;
    [SerializeField] private Color inactiveColor = Color.gray;

    private RecruitmentBuilding currentBuilding;
    private bool isUIVisible = false;

    void Start()
    {
        if (recruitmentPanel != null)
        {
            recruitmentPanel.SetActive(false);
        }

        if (recruitButton != null)
        {
            recruitButton.onClick.AddListener(OnRecruitButtonClicked);
        }
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
        if (building == null) return;

        currentBuilding = building;
        currentBuilding.OnSelected();
        isUIVisible = true;

        if (recruitmentPanel != null)
        {
            recruitmentPanel.SetActive(true);
        }

        UpdateUI();
    }

    public void HideUI()
    {
        isUIVisible = false;

        if (currentBuilding != null)
        {
            currentBuilding.OnDeselected();
            currentBuilding = null;
        }

        if (recruitmentPanel != null)
        {
            recruitmentPanel.SetActive(false);
        }
    }

    void UpdateUI()
    {
        if (currentBuilding == null) return;

        // Update queue count
        if (queueCountText != null)
        {
            queueCountText.text = $"{currentBuilding.QueueCount}/{currentBuilding.MaxQueueSize}";
        }

        // Update queue status
        if (queueStatusText != null)
        {
            if (currentBuilding.IsRecruiting)
            {
                queueStatusText.text = "RECRUITING...";
                queueStatusText.color = Color.yellow;
            }
            else if (currentBuilding.QueueCount > 0)
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

        // Update progress
        if (progressSlider != null)
        {
            progressSlider.value = currentBuilding.CurrentProgress;
        }

        // Update button state
        UpdateButtonState();
    }

    void UpdateButtonState()
    {
        if (recruitButton == null || currentBuilding == null) return;

        bool canRecruit = currentBuilding.QueueCount < currentBuilding.MaxQueueSize;
        recruitButton.interactable = canRecruit;

        if (recruitButton.image != null)
        {
            recruitButton.image.color = canRecruit ? activeColor : inactiveColor;
        }
    }

    void OnRecruitButtonClicked()
    {
        if (currentBuilding != null)
        {
            currentBuilding.QueueRecruitment();
            UpdateUI();
        }
    }

    void OnDestroy()
    {
        if (recruitButton != null)
        {
            recruitButton.onClick.RemoveListener(OnRecruitButtonClicked);
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
    }
}