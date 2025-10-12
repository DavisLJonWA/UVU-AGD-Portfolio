using UnityEngine;

public class ScoreSystem : MonoBehaviour
{
    [SerializeField] private IntData score;
    [SerializeField] private GameAction onCollectCoin;
    [SerializeField] private GameAction onScoreChanged;
    
    private void OnEnable()
    {
        onCollectCoin.RaiseNoArgs += AddScore;
    }
    
    private void OnDisable()
    {
        onCollectCoin.RaiseNoArgs -= AddScore;
    }
    
    private void AddScore()
    {
        score.UpdateValue(1);
        onScoreChanged?.RaiseAction();
    }
}