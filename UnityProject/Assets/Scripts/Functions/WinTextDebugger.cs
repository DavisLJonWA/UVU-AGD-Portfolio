using UnityEngine;

public class WinTextDebugger : MonoBehaviour
{
    [SerializeField] private GameAction onWin;
    [SerializeField] private GameObject winText;
    
    private void Start()
    {
        Debug.Log($"WinTextDebugger: Started. WinText active state: {winText.activeInHierarchy}");
        if (winText == null) Debug.LogError("WinTextDebugger: winText reference is null!");
        if (onWin == null) Debug.LogError("WinTextDebugger: onWin reference is null!");
    }
    
    private void OnEnable()
    {
        if (onWin != null)
        {
            onWin.RaiseNoArgs += OnWinTriggered;
            Debug.Log("WinTextDebugger: Registered to OnWin");
        }
    }
    
    private void OnDisable()
    {
        if (onWin != null)
            onWin.RaiseNoArgs -= OnWinTriggered;
    }
    
    private void OnWinTriggered()
    {
        Debug.Log("WinTextDebugger: OnWin received! Attempting to activate WinText...");
        
        if (winText != null)
        {
            Debug.Log($"WinTextDebugger: Before activation - winText.activeSelf: {winText.activeSelf}");
            winText.SetActive(true);
            Debug.Log($"WinTextDebugger: After activation - winText.activeSelf: {winText.activeSelf}");
        }
        else
        {
            Debug.LogError("WinTextDebugger: winText is null!");
        }
    }
}