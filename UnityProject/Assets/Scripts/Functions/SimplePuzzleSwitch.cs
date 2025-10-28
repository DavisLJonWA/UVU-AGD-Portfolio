using UnityEngine;

public class SimplePuzzleSwitch : MonoBehaviour
{
    [Header("Switch Settings")]
    [SerializeField] private GameAction onSwitchPressed;
    [SerializeField] private bool canBePressedMultipleTimes = true;
    
    [Header("Visual Feedback")]
    [SerializeField] private Renderer switchRenderer;
    [SerializeField] private Color unpressedColor = Color.red;
    [SerializeField] private Color pressedColor = Color.green;
    
    private bool isPressed = false;
    private Material switchMaterial;

    void Start()
    {
        // Get or create material
        if (switchRenderer != null)
        {
            switchMaterial = switchRenderer.material;
            switchMaterial.color = unpressedColor;
        }
    }

    void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") || other.CompareTag("Minion"))
        {
            if (!isPressed || canBePressedMultipleTimes)
            {
                ToggleSwitch();
            }
        }
    }

    void ToggleSwitch()
    {
        isPressed = !isPressed;
        
        // Update visual
        if (switchMaterial != null)
        {
            switchMaterial.color = isPressed ? pressedColor : unpressedColor;
        }
        
        // Raise event only when pressed (not when released)
        if (isPressed && onSwitchPressed != null)
        {
            onSwitchPressed.RaiseNoArgs?.Invoke();
        }
        
        Debug.Log($"Switch {name} toggled to: {(isPressed ? "PRESSED" : "UNPRESSED")}");
    }

    [ContextMenu("Test Switch")]
    void TestSwitch()
    {
        ToggleSwitch();
    }
}