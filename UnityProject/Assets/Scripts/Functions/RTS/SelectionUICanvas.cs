using UnityEngine;

public class SelectionUICanvas : MonoBehaviour
{
    [Header("UI Settings")]
    [SerializeField] private float uiDistance = 5f;
    [SerializeField] private float uiHeight = 2f;
    
    private Camera mainCamera;
    private Canvas canvas;

    void Start()
    {
        mainCamera = Camera.main;
        canvas = GetComponent<Canvas>();
        
        if (canvas != null)
        {
            // Force screen space camera mode
            canvas.renderMode = RenderMode.ScreenSpaceCamera;
            canvas.worldCamera = mainCamera;
            canvas.planeDistance = 1f; // Very close to camera
            
            Debug.Log("Selection UI Canvas initialized in Screen Space Camera mode");
        }
    }

    void Update()
    {
        // Keep UI properly positioned in screen space
        if (canvas.renderMode == RenderMode.WorldSpace)
        {
            PositionWorldCanvas();
        }
    }

    void PositionWorldCanvas()
    {
        if (mainCamera != null)
        {
            // Position canvas in front of camera
            transform.position = mainCamera.transform.position + mainCamera.transform.forward * uiDistance;
            transform.rotation = mainCamera.transform.rotation;
            
            // Optional: adjust height
            transform.position += Vector3.up * uiHeight;
        }
    }

    // Method to switch to overlay mode (most reliable)
    public void SwitchToOverlayMode()
    {
        if (canvas != null)
        {
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            Debug.Log("Switched to Screen Space Overlay mode");
        }
    }
}