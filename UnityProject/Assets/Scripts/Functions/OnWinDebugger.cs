using UnityEngine;

public class OnWinDebugger : MonoBehaviour
{
    [SerializeField] private GameAction onWin;
    
    private void Start()
    {
        Debug.Log("OnWinDebugger: Started");
    }
    
    private void OnEnable()
    {
        if (onWin != null)
        {
            onWin.RaiseNoArgs += OnWinTriggered;
            Debug.Log("OnWinDebugger: Registered to OnWin");
        }
        else
        {
            Debug.LogError("OnWinDebugger: OnWin reference is null!");
        }
    }
    
    private void OnDisable()
    {
        if (onWin != null)
            onWin.RaiseNoArgs -= OnWinTriggered;
    }
    
    private void OnWinTriggered()
    {
        Debug.Log("🎉 ONWIN GAMEACTION WAS SUCCESSFULLY TRIGGERED!");
    }
}