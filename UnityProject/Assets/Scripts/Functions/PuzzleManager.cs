using UnityEngine;
using UnityEngine.Events;

public class PuzzleManager : MonoBehaviour
{
    [Header("Puzzle Configuration")]
    [SerializeField] private IntData puzzleValue;
    [SerializeField] private GameAction onSwitchPressed;
    [SerializeField] private GameAction onPuzzleComplete;
    
    [Header("Puzzle Requirements")]
    [SerializeField] private int requiredMinValue = 3;
    [SerializeField] private int requiredMaxValue = 3;
    [SerializeField] private bool resetOnComplete = false;
    [SerializeField] private bool canExceedMax = false;
    
    [Header("Puzzle Events")]
    public UnityEvent onPuzzleSolved;
    public UnityEvent onPuzzleFailed;
    public UnityEvent onValueChanged;
    
    [Header("Debug Settings")]
    [SerializeField] private bool enableDebugMessages = true;
    
    private bool isPuzzleComplete = false;

    void Start()
    {
        if (enableDebugMessages) Debug.Log($"[PuzzleManager] Starting puzzle manager on {gameObject.name}");
        
        // Subscribe to switch pressed events
        if (onSwitchPressed != null)
        {
            onSwitchPressed.RaiseNoArgs += OnSwitchPressed;
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Registered to OnSwitchPressed: {onSwitchPressed.name}");
        }
        else
        {
            if (enableDebugMessages) Debug.LogWarning("[PuzzleManager] No OnSwitchPressed GameAction assigned!");
        }
        
        // Subscribe to value changes
        if (puzzleValue != null)
        {
            puzzleValue.onValueChanged.AddListener(OnPuzzleValueChanged);
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Registered to puzzle value changes: {puzzleValue.name}");
        }
        else
        {
            if (enableDebugMessages) Debug.LogWarning("[PuzzleManager] No PuzzleValue IntData assigned!");
        }
        
        // Initialize puzzle value
        if (puzzleValue != null)
        {
            puzzleValue.SetValue(0);
        }
        
        if (enableDebugMessages) Debug.Log($"[PuzzleManager] Puzzle started! Need {requiredMinValue}-{requiredMaxValue} switches.");
    }

    void OnDestroy()
    {
        // Unsubscribe from events
        if (onSwitchPressed != null)
        {
            onSwitchPressed.RaiseNoArgs -= OnSwitchPressed;
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Unregistered from OnSwitchPressed: {onSwitchPressed.name}");
        }
        
        if (puzzleValue != null)
        {
            puzzleValue.onValueChanged.RemoveListener(OnPuzzleValueChanged);
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Unregistered from puzzle value changes: {puzzleValue.name}");
        }
    }

    void OnSwitchPressed()
    {
        if (enableDebugMessages) Debug.Log($"[PuzzleManager] OnSwitchPressed raised! Current complete state: {isPuzzleComplete}");
        
        if (isPuzzleComplete && !resetOnComplete) 
        {
            if (enableDebugMessages) Debug.Log("[PuzzleManager] Puzzle already complete and reset disabled - ignoring switch press");
            return;
        }
        
        // Increment puzzle value
        if (puzzleValue != null)
        {
            if (!canExceedMax && puzzleValue.Value >= requiredMaxValue)
            {
                // Already at max and can't exceed
                if (enableDebugMessages) Debug.Log($"[PuzzleManager] Max value ({requiredMaxValue}) reached - triggering failure");
                onPuzzleFailed?.Invoke();
                return;
            }
            
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Incrementing puzzle value from {puzzleValue.Value} to {puzzleValue.Value + 1}");
            puzzleValue.IncrementValue();
        }
        else
        {
            if (enableDebugMessages) Debug.LogWarning("[PuzzleManager] Switch pressed but no PuzzleValue assigned!");
        }
    }

    void OnPuzzleValueChanged()
    {
        if (enableDebugMessages) Debug.Log($"[PuzzleManager] Puzzle value changed to: {puzzleValue?.Value}");
        
        // Invoke value changed event
        onValueChanged?.Invoke();
        
        // Check if puzzle is solved
        CheckPuzzleCompletion();
    }

    void CheckPuzzleCompletion()
    {
        if (puzzleValue == null) return;
        
        bool wasComplete = isPuzzleComplete;
        isPuzzleComplete = (puzzleValue.Value >= requiredMinValue && puzzleValue.Value <= requiredMaxValue);
        
        if (enableDebugMessages) 
        {
            Debug.Log($"[PuzzleManager] Checking completion - Value: {puzzleValue.Value}, Min: {requiredMinValue}, Max: {requiredMaxValue}, Complete: {isPuzzleComplete}, Was Complete: {wasComplete}");
        }
        
        if (isPuzzleComplete && !wasComplete)
        {
            PuzzleSolved();
        }
        else if (!isPuzzleComplete && wasComplete)
        {
            PuzzleUnsolved();
        }
    }

    void PuzzleSolved()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] 🎉 PUZZLE SOLVED! 🎉");
        
        // Raise puzzle complete event
        if (onPuzzleComplete != null)
        {
            if (enableDebugMessages) Debug.Log($"[PuzzleManager] Raising OnPuzzleComplete: {onPuzzleComplete.name}");
            onPuzzleComplete.RaiseNoArgs?.Invoke();
        }
        else
        {
            if (enableDebugMessages) Debug.LogWarning("[PuzzleManager] Puzzle solved but no OnPuzzleComplete GameAction assigned!");
        }
        
        // Invoke UnityEvent
        onPuzzleSolved?.Invoke();
        
        // Reset if configured
        if (resetOnComplete)
        {
            if (enableDebugMessages) Debug.Log("[PuzzleManager] Reset on complete enabled - will reset in 2 seconds");
            Invoke("ResetPuzzle", 2f); // Reset after 2 seconds
        }
    }

    void PuzzleUnsolved()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] Puzzle no longer complete.");
        onPuzzleFailed?.Invoke();
    }

    public void ResetPuzzle()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] Resetting puzzle");
        
        if (puzzleValue != null)
        {
            puzzleValue.SetValue(0);
        }
        isPuzzleComplete = false;
        onValueChanged?.Invoke();
    }

    // Public method to check value range (for external calls)
    public bool CheckValueRange(int min, int max)
    {
        if (puzzleValue == null) return false;
        bool inRange = puzzleValue.Value >= min && puzzleValue.Value <= max;
        
        if (enableDebugMessages) Debug.Log($"[PuzzleManager] CheckValueRange({min}, {max}) - Value: {puzzleValue.Value}, In Range: {inRange}");
        
        return inRange;
    }

    // Method to manually trigger switch press (for testing)
    [ContextMenu("Simulate Switch Press")]
    public void SimulateSwitchPress()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] Simulating switch press via context menu");
        OnSwitchPressed();
    }

    // Method to manually check puzzle state
    [ContextMenu("Check Puzzle State")]
    public void DebugCheckPuzzleState()
    {
        if (enableDebugMessages)
        {
            Debug.Log($"[PuzzleManager] === PUZZLE STATE DEBUG ===");
            Debug.Log($"[PuzzleManager] Puzzle Value: {puzzleValue?.Value ?? -1}");
            Debug.Log($"[PuzzleManager] Required Range: {requiredMinValue}-{requiredMaxValue}");
            Debug.Log($"[PuzzleManager] Is Complete: {isPuzzleComplete}");
            Debug.Log($"[PuzzleManager] Reset On Complete: {resetOnComplete}");
            Debug.Log($"[PuzzleManager] Can Exceed Max: {canExceedMax}");
            Debug.Log($"[PuzzleManager] OnSwitchPressed Assigned: {onSwitchPressed != null}");
            Debug.Log($"[PuzzleManager] OnPuzzleComplete Assigned: {onPuzzleComplete != null}");
            Debug.Log($"[PuzzleManager] PuzzleValue Assigned: {puzzleValue != null}");
            Debug.Log($"[PuzzleManager] === END DEBUG ===");
        }
    }

    // For debugging in inspector
    [ContextMenu("Test Puzzle Complete")]
    void TestPuzzleComplete()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] Testing puzzle complete via context menu");
        PuzzleSolved();
    }
    
    [ContextMenu("Reset Puzzle")]
    void ResetPuzzleMenu()
    {
        if (enableDebugMessages) Debug.Log("[PuzzleManager] Resetting puzzle via context menu");
        ResetPuzzle();
    }

    // Toggle debug messages at runtime
    [ContextMenu("Toggle Debug Messages")]
    void ToggleDebugMessages()
    {
        enableDebugMessages = !enableDebugMessages;
        Debug.Log($"[PuzzleManager] Debug messages {(enableDebugMessages ? "ENABLED" : "DISABLED")}");
    }
}