using UnityEngine;

public class PuzzleSwitch : MonoBehaviour
{
    [Header("Switch Settings")]
    [SerializeField] private GameAction onSwitchPressed;
    [SerializeField] private bool canBePressedMultipleTimes = false;
    [SerializeField] private bool isPressed = false;
    
    [Header("Visual Feedback")]
    [SerializeField] private Renderer switchRenderer;
    [SerializeField] private Material unpressedMaterial;
    [SerializeField] private Material pressedMaterial;
    [SerializeField] private Light switchLight;
    [SerializeField] private Color unpressedColor = Color.red;
    [SerializeField] private Color pressedColor = Color.green;
    
    [Header("Audio")]
    [SerializeField] private AudioClip pressSound;
    [SerializeField] private AudioClip releaseSound;
    
    private AudioSource audioSource;

    void Start()
    {
        // Get or add AudioSource
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.spatialBlend = 1f; // 3D sound
            audioSource.volume = 0.7f;
        }
        
        InitializeVisuals();
    }

    void InitializeVisuals()
    {
        // Set initial visual state
        if (switchRenderer != null && unpressedMaterial != null)
        {
            switchRenderer.material = unpressedMaterial;
        }
        
        if (switchLight != null)
        {
            switchLight.color = unpressedColor;
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") || other.CompareTag("Minion"))
        {
            PressSwitch();
        }
    }

    void OnTriggerExit(Collider other)
    {
        if (!canBePressedMultipleTimes) return;
        
        if (other.CompareTag("Player") || other.CompareTag("Minion"))
        {
            ReleaseSwitch();
        }
    }

    public void PressSwitch()
    {
        if (isPressed && !canBePressedMultipleTimes) return;
        
        isPressed = true;
        
        // Raise the switch pressed event using your GameAction system
        if (onSwitchPressed != null)
        {
            onSwitchPressed.RaiseNoArgs?.Invoke();
        }
        
        // Visual feedback
        UpdateVisuals();
        
        // Audio feedback
        if (pressSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(pressSound);
        }
        
        Debug.Log($"Switch {gameObject.name} pressed!");
    }

    public void ReleaseSwitch()
    {
        if (!isPressed) return;
        
        isPressed = false;
        
        // Visual feedback
        UpdateVisuals();
        
        // Audio feedback
        if (releaseSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(releaseSound);
        }
    }

    void UpdateVisuals()
    {
        // Update material
        if (switchRenderer != null)
        {
            switchRenderer.material = isPressed ? pressedMaterial : unpressedMaterial;
        }
        
        // Update light
        if (switchLight != null)
        {
            switchLight.color = isPressed ? pressedColor : unpressedColor;
            switchLight.intensity = isPressed ? 2f : 1f;
        }
    }

    // Public method to reset switch
    public void ResetSwitch()
    {
        isPressed = false;
        UpdateVisuals();
    }
}