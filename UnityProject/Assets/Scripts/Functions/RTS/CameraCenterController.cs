using UnityEngine;

public class CameraCenterController : MonoBehaviour
{
    [Header("Camera Center Settings")]
    [SerializeField] private Transform centerPoint;
    [SerializeField] private bool autoCreateCenter = true;
    [SerializeField] private string centerObjectName = "CameraCenter";
    [SerializeField] private Vector3 defaultCenterPosition = Vector3.zero;
    
    private IsometricCameraController cameraController;
    private Vector3 worldCenter;

    void Start()
    {
        cameraController = GetComponent<IsometricCameraController>();
        
        // Find or create center point based on settings
        InitializeCenterPoint();
        
        // Initialize camera position
        InitializeCameraPosition();
    }

    void InitializeCenterPoint()
    {
        // If center point is not assigned, try to find it or create it
        if (centerPoint == null)
        {
            // Try to find existing center point by name
            GameObject existingCenter = GameObject.Find(centerObjectName);
            if (existingCenter != null)
            {
                centerPoint = existingCenter.transform;
                Debug.Log($"Found existing center point: {centerPoint.name}");
            }
            else if (autoCreateCenter)
            {
                // Create new center point
                GameObject centerObj = new GameObject(centerObjectName);
                centerPoint = centerObj.transform;
                centerPoint.position = defaultCenterPosition;
                Debug.Log($"Created new center point: {centerPoint.name} at {defaultCenterPosition}");
            }
            else
            {
                Debug.LogWarning("No center point assigned and auto-create is disabled. Using default position.");
                worldCenter = defaultCenterPosition;
                return;
            }
        }
        
        worldCenter = centerPoint.position;
        Debug.Log($"Camera center initialized at: {worldCenter}");
    }

    void InitializeCameraPosition()
    {
        worldCenter = centerPoint != null ? centerPoint.position : defaultCenterPosition;
        
        // Set camera to look at center point
        if (cameraController != null)
        {
            cameraController.SetTargetPosition(worldCenter);
        }
        else
        {
            Debug.LogWarning("No IsometricCameraController found on camera!");
        }
    }

    void Update()
    {
        // Keep the center point updated if we have one
        if (centerPoint != null)
        {
            worldCenter = centerPoint.position;
        }
    }

    // Public methods to control the center
    public void SetCenterPoint(Transform newCenter)
    {
        centerPoint = newCenter;
        if (centerPoint != null)
        {
            worldCenter = centerPoint.position;
            if (cameraController != null)
            {
                cameraController.SetTargetPosition(worldCenter);
            }
        }
    }

    public void SetCenterPosition(Vector3 newPosition)
    {
        if (centerPoint == null)
        {
            if (autoCreateCenter)
            {
                GameObject centerObj = new GameObject(centerObjectName);
                centerPoint = centerObj.transform;
            }
            else
            {
                Debug.LogWarning("Cannot set center position - no center point assigned and auto-create is disabled.");
                return;
            }
        }
        
        centerPoint.position = newPosition;
        worldCenter = newPosition;
        
        if (cameraController != null)
        {
            cameraController.SetTargetPosition(worldCenter);
        }
    }

    public Vector3 GetWorldCenter()
    {
        return worldCenter;
    }

    public Transform GetCenterTransform()
    {
        return centerPoint;
    }

    // Method to find and assign center point by name
    public bool FindAndAssignCenterPoint(string pointName)
    {
        GameObject foundPoint = GameObject.Find(pointName);
        if (foundPoint != null)
        {
            centerPoint = foundPoint.transform;
            worldCenter = centerPoint.position;
            return true;
        }
        return false;
    }

    // Method to create a new center point at specific position
    public Transform CreateCenterPoint(Vector3 position, string name = null)
    {
        string pointName = name ?? centerObjectName;
        GameObject centerObj = new GameObject(pointName);
        centerObj.transform.position = position;
        centerPoint = centerObj.transform;
        worldCenter = position;
        
        return centerPoint;
    }
}