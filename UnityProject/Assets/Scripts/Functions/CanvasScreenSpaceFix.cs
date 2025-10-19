using UnityEngine;

public class CanvasScreenSpaceFix : MonoBehaviour
{
    [Header("Canvas Fix Settings")]
    [SerializeField] private bool fixOnStart = true;
    [SerializeField] private Vector2 screenOffset = Vector2.zero;
    
    private Canvas canvas;
    private RectTransform rectTransform;
    private Camera mainCamera;

    void Start()
    {
        canvas = GetComponent<Canvas>();
        rectTransform = GetComponent<RectTransform>();
        mainCamera = Camera.main;

        if (canvas == null)
        {
            Debug.LogError("CanvasScreenSpaceFix requires a Canvas component!");
            return;
        }

        if (fixOnStart)
        {
            FixCanvasPosition();
        }
    }

    void Update()
    {
        // Optional: Keep canvas fixed in screen space
        if (canvas.renderMode == RenderMode.WorldSpace)
        {
            KeepCanvasInView();
        }
    }

    void FixCanvasPosition()
    {
        if (canvas.renderMode == RenderMode.WorldSpace)
        {
            // Convert to Screen Space - Overlay (recommended for UI elements like selection boxes)
            canvas.renderMode = RenderMode.ScreenSpaceOverlay;
            Debug.Log("Converted canvas to Screen Space - Overlay");
        }
        
        // Ensure canvas is properly positioned
        if (rectTransform != null)
        {
            rectTransform.anchoredPosition = screenOffset;
        }
    }

    void KeepCanvasInView()
    {
        // Only needed if using World Space render mode
        if (mainCamera != null)
        {
            // Position canvas in front of camera but keep it screen-aligned
            transform.position = mainCamera.transform.position + mainCamera.transform.forward * 5f;
            transform.rotation = mainCamera.transform.rotation;
        }
    }

    // Public method to manually fix position
    public void ManualFixPosition()
    {
        FixCanvasPosition();
    }
}