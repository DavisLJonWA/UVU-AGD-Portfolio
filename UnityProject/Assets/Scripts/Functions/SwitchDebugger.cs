using UnityEngine;

public class SwitchDebugger : MonoBehaviour
{
    [Header("Debug Settings")]
    [SerializeField] private bool logSwitchStates = true;
    
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.P))
        {
            DebugAllSwitchStates();
        }
    }

    [ContextMenu("Debug All Switches")]
    public void DebugAllSwitchStates()
    {
        PuzzleSwitch[] allSwitches = FindObjectsOfType<PuzzleSwitch>();
        Debug.Log($"=== SWITCH DEBUG - Found {allSwitches.Length} switches ===");
        
        foreach (PuzzleSwitch puzzleSwitch in allSwitches)
        {
            if (puzzleSwitch != null)
            {
                Renderer renderer = puzzleSwitch.GetComponent<Renderer>();
                bool hasRenderer = renderer != null;
                bool hasMaterial = hasRenderer && renderer.material != null;
                Color materialColor = hasMaterial ? renderer.material.color : Color.white;
                
                Debug.Log($"Switch: {puzzleSwitch.gameObject.name} | " +
                          $"Pressed: {puzzleSwitch.IsPressed()} | " +
                          $"Has Renderer: {hasRenderer} | " +
                          $"Has Material: {hasMaterial} | " +
                          $"Material Color: {materialColor}");
            }
        }
        Debug.Log("=== END SWITCH DEBUG ===");
    }
}