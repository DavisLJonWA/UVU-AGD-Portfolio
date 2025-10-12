using UnityEngine;

public class CoinCollector : MonoBehaviour
{
    [SerializeField] private GameAction onCollectCoin;
    private bool isCollected = false;
    
    private void OnTriggerEnter(Collider other)
    {
        if (!isCollected && other.CompareTag("Player"))
        {
            isCollected = true;
            CollectCoin();
        }
    }
    
    private void CollectCoin()
    {
        Debug.Log($"Coin collected! Giving 1 point. Position: {transform.position}");
        
        // Raise the collection event ONCE
        onCollectCoin?.RaiseAction();
        
        // Destroy the coin
        Destroy(gameObject);
    }
}