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
    
    [Header("Rotation Settings")]
    [SerializeField] private float rotationSpeed = 90f; // Degrees per second
    [SerializeField] private KeyCode rotateLeftKey = KeyCode.Q;
    [SerializeField] private KeyCode rotateRightKey = KeyCode.E;
    
    [Header("Movement Settings")]
    [SerializeField] private float movementSpeed = 10f;
    [SerializeField] private float sprintMultiplier = 2f;
    
    [Header("Smoothing")]
    [SerializeField] private bool smoothMovement = true;
    [SerializeField] private float smoothTime = 0.1f;
    [SerializeField] private bool smoothRotation = true;
    [SerializeField] private float rotationSmoothTime = 0.2f;

    private Vector3 cameraOffset;
    private Vector3 targetPosition;
    private Vector3 velocity = Vector3.zero;
    private CameraCenterController centerController;
    private float targetAzimuthAngle;
    private float rotationVelocity;
    private bool rotationChanged = false;

    void Start()
    {
        centerController = GetComponent<CameraCenterController>();
        targetAzimuthAngle = azimuthAngle;
        
        CalculateCameraOffset();
        
        if (centerController != null)
        {
            targetPosition = centerController.GetWorldCenter();
        }
        else
        {
            targetPosition = Vector3.zero;
        }
        
        transform.position = targetPosition + cameraOffset;
        transform.LookAt(targetPosition);
    }

    void Update()
    {
        HandleInput();
        HandleZoom();
        HandleRotation();
        
        // Always recalculate offset if rotation changed
        if (rotationChanged)
        {
            CalculateCameraOffset();
            rotationChanged = false;
        }
        
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
        
        // Transform input based on current camera rotation
        Vector3 moveDirection = TransformInputByCameraRotation(input);
        targetPosition += moveDirection * currentSpeed * Time.deltaTime;
        
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

    void HandleRotation()
    {
        bool rotationInput = false;
        
        // Handle keyboard rotation
        if (Input.GetKey(rotateLeftKey))
        {
            targetAzimuthAngle += rotationSpeed * Time.deltaTime;
            rotationInput = true;
        }
        if (Input.GetKey(rotateRightKey))
        {
            targetAzimuthAngle -= rotationSpeed * Time.deltaTime;
            rotationInput = true;
        }

        // Keep angle between 0-360
        if (targetAzimuthAngle > 360f) targetAzimuthAngle -= 360f;
        if (targetAzimuthAngle < 0f) targetAzimuthAngle += 360f;

        // Apply rotation smoothing
        float previousAzimuth = azimuthAngle;
        if (smoothRotation)
        {
            azimuthAngle = Mathf.SmoothDampAngle(azimuthAngle, targetAzimuthAngle, ref rotationVelocity, rotationSmoothTime);
        }
        else
        {
            azimuthAngle = targetAzimuthAngle;
        }

        // Check if rotation actually changed
        if (Mathf.Abs(Mathf.DeltaAngle(previousAzimuth, azimuthAngle)) > 0.01f || rotationInput)
        {
            rotationChanged = true;
        }
    }

    Vector3 TransformInputByCameraRotation(Vector3 input)
    {
        // Create rotation based on current azimuth angle for consistent movement
        Quaternion rotation = Quaternion.Euler(0, azimuthAngle, 0);
        return rotation * input;
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
        
        Debug.Log($"Camera offset recalculated. Azimuth: {azimuthAngle}, Offset: {cameraOffset}");
    }

    void UpdateCameraRotation()
    {
        transform.LookAt(targetPosition);
    }

    // Public method to set target position
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
        targetAzimuthAngle = newAzimuth;
        azimuthAngle = newAzimuth;
        CalculateCameraOffset();
    }

    public void UpdateAltitudeAngle(float newAltitude)
    {
        altitudeAngle = Mathf.Clamp(newAltitude, 0, 90);
        CalculateCameraOffset();
    }

    // Public method to rotate camera by specific amount
    public void RotateCamera(float degrees)
    {
        targetAzimuthAngle += degrees;
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

    // Debug method to check camera state
    [ContextMenu("Debug Camera State")]
    void DebugCameraState()
    {
        Debug.Log($"Camera State - Position: {transform.position}, Rotation: {transform.rotation.eulerAngles}");
        Debug.Log($"Target Position: {targetPosition}, Camera Offset: {cameraOffset}");
        Debug.Log($"Azimuth: {azimuthAngle}, Target Azimuth: {targetAzimuthAngle}");
        Debug.Log($"Distance: {cameraDistance}, Altitude: {altitudeAngle}");
    }
}