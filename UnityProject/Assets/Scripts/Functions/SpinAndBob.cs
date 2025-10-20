using UnityEngine;

public class SimpleSpinBob : MonoBehaviour
{
    [Header("Settings")]
    public float spinSpeed = 90f;
    public float bobSpeed = 2f;
    public float bobHeight = 1f;
    public bool enabled = true;
    
    private Vector3 startPos;
    private Transform myTransform;

    void Start()
    {
        myTransform = transform;
        startPos = myTransform.position;
    }

    void Update()
    {
        if (!enabled) return;
        
        // Spin (very lightweight)
        myTransform.Rotate(0, spinSpeed * Time.deltaTime, 0, Space.World);
        
        // Bob (lightweight calculation)
        float newY = startPos.y + Mathf.Sin(Time.time * bobSpeed) * bobHeight;
        myTransform.position = new Vector3(startPos.x, newY, startPos.z);
    }

    public void SetEnabled(bool state)
    {
        enabled = state;
    }
}