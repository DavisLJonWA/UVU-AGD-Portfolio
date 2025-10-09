using UnityEngine;

[CreateAssetMenu(fileName = "IntData", menuName = "Scriptable Objects/IntData")]
public class IntDatas : ScriptableObject
{
    public int value;
    
    public void Add(int amount)
    {
        value += amount;
    }
    
    public void SetValue(int newValue)
    {
        value = newValue;
    }
}