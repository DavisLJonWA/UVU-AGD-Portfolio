using UnityEngine;

public class IsometricCameraController : MonoBehaviour
{
    [Header("Camera Settings")]
    [SerializeField] private float cameraDistance = 10f;
    [SerializeField] [Range(0, 360)] private float azimuthAngle = 45f;
    [SerializeField] [Range(0, 90)] private float altitudeAngle = 35f;
    
    [Header("Movement Settings")]
    [SerializeField] private float movementSpeed = 10f;
    [SerializeField] private float sprintMultiplier = 2f;
    
    [Header("Rotation Settings")]
    [SerializeField] private float rotationSpeed = 90f;
    [SerializeField] private KeyCode rotateLeftKey = KeyCode.Q;
    [SerializeField] private KeyCode rotateRightKey = KeyCode.E;
    
    [Header("Zoom Settings")]
    [SerializeField] private float zoomSpeed = 5f;
    [SerializeField] private float minZoomDistance = 3f;
    [SerializeField] private float maxZoomDistance = 20f;
    
    [Header("Optimization")]
    [SerializeField] private bool enableSmoothing = true;
    [SerializeField] private float smoothTime = 0.1f;
    
    // Cached values
    private Vector3 cameraOffset;
    private Vector3 targetPosition;
    private Vector3 velocity = Vector3.zero;
    private float targetAzimuthAngle;
    private float rotationVelocity;
    private bool needsOffsetRecalculation = false;
    private Camera cam;
    private Transform myTransform;
    
    

    void Start()
    {
        myTransform = transform;
        cam = GetComponent<Camera>();
        
        targetAzimuthAngle = azimuthAngle;
        CalculateCameraOffset();
        
        // Set initial position
        myTransform.position = targetPosition + cameraOffset;
        myTransform.LookAt(targetPosition);
    }

    void Update()
    {
        HandleInput();
        
        if (needsOffsetRecalculation)
        {
            CalculateCameraOffset();
            needsOffsetRecalculation = false;
        }
        
        UpdateCameraPosition();
    }

    void HandleInput()
    {
        HandleMovement();
        HandleRotation();
        HandleZoom();
    }

    void HandleMovement()
    {
        Vector3 input = new Vector3(
            Input.GetAxisRaw("Horizontal"),
            0,
            Input.GetAxisRaw("Vertical")
        );
        
        if (input.magnitude > 0)
        {
            float currentSpeed = movementSpeed * (Input.GetKey(KeyCode.LeftShift) ? sprintMultiplier : 1f);
            
            // Normalize only if needed to maintain diagonal speed
            if (input.magnitude > 1)
                input.Normalize();
            
            // Transform input based on current rotation
            Vector3 moveDirection = Quaternion.Euler(0, azimuthAngle, 0) * input;
            targetPosition += moveDirection * currentSpeed * Time.deltaTime;
        }
    }

    void HandleRotation()
    {
        bool rotationChanged = false;
        
        if (Input.GetKey(rotateLeftKey))
        {
            targetAzimuthAngle += rotationSpeed * Time.deltaTime;
            rotationChanged = true;
        }
        if (Input.GetKey(rotateRightKey))
        {
            targetAzimuthAngle -= rotationSpeed * Time.deltaTime;
            rotationChanged = true;
        }

        // Normalize angle
        targetAzimuthAngle = (targetAzimuthAngle % 360 + 360) % 360;

        if (rotationChanged)
        {
            if (enableSmoothing)
            {
                azimuthAngle = Mathf.SmoothDampAngle(azimuthAngle, targetAzimuthAngle, ref rotationVelocity, smoothTime);
            }
            else
            {
                azimuthAngle = targetAzimuthAngle;
            }
            needsOffsetRecalculation = true;
        }
    }

    void HandleZoom()
    {
        float scroll = Input.GetAxis("Mouse ScrollWheel");
        if (scroll != 0)
        {
            cameraDistance = Mathf.Clamp(cameraDistance - scroll * zoomSpeed, minZoomDistance, maxZoomDistance);
            needsOffsetRecalculation = true;
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

    void UpdateCameraPosition()
    {
        Vector3 desiredPosition = targetPosition + cameraOffset;
        
        if (enableSmoothing)
        {
            myTransform.position = Vector3.SmoothDamp(myTransform.position, desiredPosition, ref velocity, smoothTime);
        }
        else
        {
            myTransform.position = desiredPosition;
        }
        
        myTransform.LookAt(targetPosition);
    }

    // Public method to set target position (required by CameraCenterController)
    public void SetTargetPosition(Vector3 newTarget)
    {
        targetPosition = newTarget;
        needsOffsetRecalculation = true;
    }

    // Additional public methods for external control
    public void SetAzimuthAngle(float newAngle)
    {
        targetAzimuthAngle = newAngle;
        azimuthAngle = newAngle;
        needsOffsetRecalculation = true;
    }

    public void SetAltitudeAngle(float newAngle)
    {
        altitudeAngle = Mathf.Clamp(newAngle, 0, 90);
        needsOffsetRecalculation = true;
    }

    public void SetCameraDistance(float newDistance)
    {
        cameraDistance = Mathf.Clamp(newDistance, minZoomDistance, maxZoomDistance);
        needsOffsetRecalculation = true;
    }
    
    

    // Public getters for external access
    public Vector3 GetTargetPosition() => targetPosition;
    public float GetAzimuthAngle() => azimuthAngle;
    public float GetAltitudeAngle() => altitudeAngle;
    public float GetCameraDistance() => cameraDistance;
    
    void OnDestroy()
    {
        // Reset smooth damp velocities to prevent memory leaks
        velocity = Vector3.zero;
        rotationVelocity = 0f;
    }
    
    // Alternative: Reset in OnDisable as well for scene changes
    void OnDisable()
    {
        velocity = Vector3.zero;
        rotationVelocity = 0f;
    }
}
