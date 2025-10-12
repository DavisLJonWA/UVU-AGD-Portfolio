using UnityEngine;

public class SimpleWinCondition : MonoBehaviour
{
    [SerializeField] private IntData score;
    [SerializeField] private int requiredCoins = 10;
    [SerializeField] private GameAction onScoreChanged;
    [SerializeField] private GameAction onWin;
    
    private void Start()
    {
        Debug.Log($"SimpleWinCondition: Started. Required coins: {requiredCoins}");
        if (score == null) Debug.LogError("Score reference is null!");
        if (onScoreChanged == null) Debug.LogError("OnScoreChanged reference is null!");
        if (onWin == null) Debug.LogError("OnWin reference is null!");
    }
    
    private void OnEnable()
    {
        if (onScoreChanged != null)
        {
            onScoreChanged.RaiseNoArgs += CheckWin;
            Debug.Log("SimpleWinCondition: Registered to OnScoreChanged");
        }
    }
    
    private void OnDisable()
    {
        if (onScoreChanged != null)
            onScoreChanged.RaiseNoArgs -= CheckWin;
    }
    
    private void CheckWin()
    {
        Debug.Log($"SimpleWinCondition: Checking win - Score: {score.Value}, Required: {requiredCoins}");
        
        if (score.Value >= requiredCoins)
        {
            Debug.Log("SimpleWinCondition: WIN CONDITION MET! Calling onWin.RaiseAction()");
            onWin.RaiseAction();
        }
        else
        {
            Debug.Log($"SimpleWinCondition: Not enough coins yet. Need {requiredCoins - score.Value} more.");
        }
    }
}