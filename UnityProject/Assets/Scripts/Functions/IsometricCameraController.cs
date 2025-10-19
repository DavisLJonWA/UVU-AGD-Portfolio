using UnityEngine;

public class IsometricCameraController : MonoBehaviour
{
    [Header("Camera Position")]
    [SerializeField] private float cameraDistance = 10f;
    [SerializeField] [Range(0, 360)] private float azimuthAngle = 45f;
    [SerializeField] [Range(0, 90)] private float altitudeAngle = 35f;
    
    [Header("Zoom Settings")]
    [SerializeField] private float zoomSpeed = 5f;
    [SerializeField] private float minZoomDistance = 3f;
    [SerializeField] private float maxZoomDistance = 20f;
    
    [Header("Movement Settings")]
    [SerializeField] private float movementSpeed = 10f;
    [SerializeField] private float sprintMultiplier = 2f;
    
    [Header("Smoothing")]
    [SerializeField] private bool smoothMovement = true;
    [SerializeField] private float smoothTime = 0.1f;

    private Vector3 cameraOffset;
    private Vector3 targetPosition;
    private Vector3 velocity = Vector3.zero;
    private CameraCenterController centerController;

    void Start()
    {
        centerController = GetComponent<CameraCenterController>();
        
        CalculateCameraOffset();
        
        // Initialize target position
        if (centerController != null)
        {
            targetPosition = centerController.GetWorldCenter();
        }
        else
        {
            targetPosition = Vector3.zero;
        }
        
        // Set initial camera position directly
        transform.position = targetPosition + cameraOffset;
        transform.LookAt(targetPosition);
    }

    void Update()
    {
        HandleInput();
        HandleZoom();
        MoveCamera();
        UpdateCameraRotation();
    }

    void HandleInput()
    {
        Vector3 input = Vector3.zero;
        
        if (Input.GetKey(KeyCode.W)) input.z += 1;
        if (Input.GetKey(KeyCode.S)) input.z -= 1;
        if (Input.GetKey(KeyCode.A)) input.x -= 1;
        if (Input.GetKey(KeyCode.D)) input.x += 1;
        
        if (input == Vector3.zero) return;
        
        if (input.magnitude > 1)
            input.Normalize();
        
        float currentSpeed = movementSpeed;
        if (Input.GetKey(KeyCode.LeftShift))
            currentSpeed *= sprintMultiplier;
        
        Vector3 moveDirection = input;
        targetPosition += moveDirection * currentSpeed * Time.deltaTime;
        
        // Update center controller if it exists
        if (centerController != null)
        {
            centerController.SetCenterPosition(targetPosition);
        }
    }

    void HandleZoom()
    {
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        if (scroll != 0)
        {
            cameraDistance -= scroll * zoomSpeed;
            cameraDistance = Mathf.Clamp(cameraDistance, minZoomDistance, maxZoomDistance);
            CalculateCameraOffset();
        }
    }

    void MoveCamera()
    {
        Vector3 desiredPosition = targetPosition + cameraOffset;
        
        if (smoothMovement)
        {
            transform.position = Vector3.SmoothDamp(transform.position, desiredPosition, ref velocity, smoothTime);
        }
        else
        {
            transform.position = desiredPosition;
        }
    }

    void CalculateCameraOffset()
    {
        float horizontalDistance = cameraDistance * Mathf.Cos(altitudeAngle * Mathf.Deg2Rad);
        float verticalDistance = cameraDistance * Mathf.Sin(altitudeAngle * Mathf.Deg2Rad);
        
        Vector3 offset = new Vector3(0, verticalDistance, -horizontalDistance);
        Quaternion azimuthRotation = Quaternion.Euler(0, azimuthAngle, 0);
        cameraOffset = azimuthRotation * offset;
    }

    void UpdateCameraRotation()
    {
        transform.LookAt(targetPosition);
    }

    // Public method to set target position (for CameraCenterController)
    public void SetTargetPosition(Vector3 newTarget)
    {
        targetPosition = newTarget;
    }

    // Public methods to update camera settings
    public void UpdateCameraDistance(float newDistance)
    {
        cameraDistance = Mathf.Clamp(newDistance, minZoomDistance, maxZoomDistance);
        CalculateCameraOffset();
    }

    public void UpdateAzimuthAngle(float newAzimuth)
    {
        azimuthAngle = newAzimuth;
        CalculateCameraOffset();
    }

    public void UpdateAltitudeAngle(float newAltitude)
    {
        altitudeAngle = Mathf.Clamp(newAltitude, 0, 90);
        CalculateCameraOffset();
    }

    void OnValidate()
    {
        cameraDistance = Mathf.Clamp(cameraDistance, minZoomDistance, maxZoomDistance);
        CalculateCameraOffset();
        if (Application.isPlaying)
        {
            UpdateCameraRotation();
        }
    }
}