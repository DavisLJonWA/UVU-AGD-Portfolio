using UnityEngine;

public class DirectWinTest : MonoBehaviour
{
    [SerializeField] private GameAction onWin;
    
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.W)) // Press W to force win
        {
            Debug.Log("Forcing win via keyboard...");
            onWin.RaiseAction();
        }
    }
}