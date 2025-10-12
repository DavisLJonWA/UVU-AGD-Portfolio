using UnityEngine;
using UnityEngine.Events;

public class CompareIntData : MonoBehaviour
{
    public enum ComparisonType { Equal, Greater, Less, GreaterOrEqual, LessOrEqual }
    
    [SerializeField] private IntData dataA;
    [SerializeField] private IntData dataB;
    [SerializeField] private ComparisonType comparisonType;
    [SerializeField] private UnityEvent onSuccess;
    [SerializeField] private GameAction onSuccessAction;
    
    public void Compare()
    {
        bool success = false;
        
        switch (comparisonType)
        {
            case ComparisonType.Equal: success = dataA.Value == dataB.Value; break;
            case ComparisonType.Greater: success = dataA.Value > dataB.Value; break;
            case ComparisonType.Less: success = dataA.Value < dataB.Value; break;
            case ComparisonType.GreaterOrEqual: success = dataA.Value >= dataB.Value; break;
            case ComparisonType.LessOrEqual: success = dataA.Value <= dataB.Value; break;
        }
        
        if (success)
        {
            onSuccess?.Invoke();
            onSuccessAction?.RaiseAction();
        }
    }
}