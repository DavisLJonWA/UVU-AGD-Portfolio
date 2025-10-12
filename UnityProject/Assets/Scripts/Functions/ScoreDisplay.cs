using TMPro;
using UnityEngine;

public class ScoreDisplay : MonoBehaviour
{
    [SerializeField] private IntData score;
    [SerializeField] private GameAction onScoreChanged;
    [SerializeField] private TextMeshProUGUI scoreText;
    [SerializeField] private string format = "Coins: {0}";
    
    private void OnEnable()
    {
        if (onScoreChanged != null)
            onScoreChanged.RaiseNoArgs += UpdateDisplay;
        
        UpdateDisplay(); // Initial update
    }
    
    private void OnDisable()
    {
        if (onScoreChanged != null)
            onScoreChanged.RaiseNoArgs -= UpdateDisplay;
    }
    
    private void UpdateDisplay()
    {
        if (scoreText != null && score != null)
        {
            scoreText.text = string.Format(format, score.Value);
        }
    }
}