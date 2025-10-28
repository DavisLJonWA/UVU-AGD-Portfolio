using UnityEngine;

public class PuzzleSwitch : MonoBehaviour
{
    [Header("Switch Settings")]
    [SerializeField] private GameAction onSwitchPressed;
    [SerializeField] private bool canBePressedMultipleTimes = false;
    [SerializeField] private bool isPressed = false;
    
    [Header("Visual Feedback")]
    [SerializeField] private Renderer switchRenderer;
    [SerializeField] private Color unpressedColor = Color.red;
    [SerializeField] private Color pressedColor = Color.green;
    [SerializeField] private bool autoFindRenderer = true;
    
    [Header("Audio")]
    [SerializeField] private AudioClip pressSound;
    [SerializeField] private AudioClip releaseSound;
    
    private AudioSource audioSource;
    private Material switchMaterial;
    private bool visualsInitialized = false;

    void Start()
    {
        InitializeSwitch();
    }

    void InitializeSwitch()
    {
        // Get or add AudioSource
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.spatialBlend = 1f;
            audioSource.volume = 0.7f;
        }

        // Find the renderer if not assigned
        if (switchRenderer == null && autoFindRenderer)
        {
            switchRenderer = GetComponent<Renderer>();
            if (switchRenderer == null)
            {
                switchRenderer = GetComponentInChildren<Renderer>();
            }
        }

        // Initialize visuals
        InitializeVisuals();
    }

    void InitializeVisuals()
    {
        if (switchRenderer != null)
        {
            // Get the material (create instance if needed)
            switchMaterial = switchRenderer.material;
            
            // Set initial color
            switchMaterial.color = unpressedColor;
            
            visualsInitialized = true;
            Debug.Log($"Switch {gameObject.name} visuals initialized with renderer: {switchRenderer.gameObject.name}");
        }
        else
        {
            Debug.LogWarning($"Switch {gameObject.name} has no Renderer component! Visual feedback will not work.");
            visualsInitialized = false;
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
        
        // Raise the switch pressed event
        if (onSwitchPressed != null)
        {
            onSwitchPressed.RaiseNoArgs?.Invoke();
            Debug.Log($"Switch {gameObject.name} pressed! Raising event.");
        }
        
        // Update visuals
        UpdateVisuals();
        
        // Audio feedback
        if (pressSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(pressSound);
        }
    }

    public void ReleaseSwitch()
    {
        if (!isPressed) return;
        
        isPressed = false;
        
        // Update visuals
        UpdateVisuals();
        
        // Audio feedback
        if (releaseSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(releaseSound);
        }
    }

    void UpdateVisuals()
    {
        if (!visualsInitialized || switchMaterial == null) return;
        
        switchMaterial.color = isPressed ? pressedColor : unpressedColor;
        Debug.Log($"Switch {gameObject.name} color updated to: {(isPressed ? pressedColor : unpressedColor)}");
    }

    // Public method to reset switch
    public void ResetSwitch()
    {
        isPressed = false;
        UpdateVisuals();
    }

    // Debug and testing methods
    [ContextMenu("Force Press Switch")]
    public void ForcePressSwitch()
    {
        PressSwitch();
    }

    [ContextMenu("Force Release Switch")]
    public void ForceReleaseSwitch()
    {
        ReleaseSwitch();
    }

    [ContextMenu("Toggle Switch")]
    public void ToggleSwitch()
    {
        if (isPressed)
            ReleaseSwitch();
        else
            PressSwitch();
    }

    [ContextMenu("Find Renderer")]
    public void FindRenderer()
    {
        switchRenderer = GetComponent<Renderer>();
        if (switchRenderer == null)
        {
            switchRenderer = GetComponentInChildren<Renderer>();
        }
        
        if (switchRenderer != null)
        {
            Debug.Log($"Found renderer: {switchRenderer.gameObject.name}");
            InitializeVisuals();
        }
        else
        {
            Debug.LogError($"No renderer found on {gameObject.name} or its children!");
        }
    }

    // Getters
    public bool IsPressed()
    {
        return isPressed;
    }

    public Renderer GetSwitchRenderer()
    {
        return switchRenderer;
    }
}