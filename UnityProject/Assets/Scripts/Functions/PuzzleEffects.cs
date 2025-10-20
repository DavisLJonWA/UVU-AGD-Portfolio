using UnityEngine;
using UnityEngine.UI;

public class PuzzleEffects : MonoBehaviour
{
    [Header("Visual Effects")]
    [SerializeField] private ParticleSystem successParticles;
    [SerializeField] private ParticleSystem switchParticles;
    
    [Header("Audio Effects")]
    [SerializeField] private AudioClip successSound;
    [SerializeField] private AudioClip progressSound;
    
    [Header("Game Objects")]
    [SerializeField] private GameObject gateObject;
    [SerializeField] private GameObject rewardSpawnPoint;
    [SerializeField] private GameObject rewardPrefab;
    
    [Header("UI Elements")]
    [SerializeField] private Text puzzleText;
    [SerializeField] private GameObject completeUI;
    
    [Header("Puzzle Reference")]
    [SerializeField] private IntData puzzleValue;
    
    private AudioSource audioSource;

    void Start()
    {
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
        }
        
        // Hide complete UI initially
        if (completeUI != null)
            completeUI.SetActive(false);
            
        // Subscribe to value changes if puzzleValue is assigned
        if (puzzleValue != null)
        {
            puzzleValue.onValueChanged.AddListener(OnValueChanged);
            UpdatePuzzleText();
        }
    }

    void OnDestroy()
    {
        if (puzzleValue != null)
        {
            puzzleValue.onValueChanged.RemoveListener(OnValueChanged);
        }
    }

    // Called when puzzle is solved
    public void OnPuzzleComplete()
    {
        Debug.Log("Playing puzzle complete effects!");
        
        // Particles
        if (successParticles != null)
            successParticles.Play();
            
        // Sound
        if (successSound != null)
            audioSource.PlayOneShot(successSound);
            
        // Open gate
        if (gateObject != null)
            gateObject.SetActive(false);
            
        // Spawn reward
        if (rewardPrefab != null && rewardSpawnPoint != null)
            Instantiate(rewardPrefab, rewardSpawnPoint.transform.position, Quaternion.identity);
            
        // Show UI
        if (completeUI != null)
            completeUI.SetActive(true);
            
        // Update text
        UpdatePuzzleText("Puzzle Complete!");
    }

    // Called when switch is pressed
    public void OnSwitchPressed()
    {
        if (switchParticles != null)
            switchParticles.Play();
            
        if (progressSound != null)
            audioSource.PlayOneShot(progressSound, 0.5f);
    }

    // Called when puzzle value changes
    public void OnValueChanged()
    {
        UpdatePuzzleText();
    }

    void UpdatePuzzleText(string customText = null)
    {
        if (puzzleText != null)
        {
            if (!string.IsNullOrEmpty(customText))
            {
                puzzleText.text = customText;
            }
            else if (puzzleValue != null)
            {
                puzzleText.text = $"Switches: {puzzleValue.Value}";
            }
        }
    }

    // Reset effects
    public void ResetEffects()
    {
        if (gateObject != null)
            gateObject.SetActive(true);
            
        if (completeUI != null)
            completeUI.SetActive(false);
            
        UpdatePuzzleText();
    }
}