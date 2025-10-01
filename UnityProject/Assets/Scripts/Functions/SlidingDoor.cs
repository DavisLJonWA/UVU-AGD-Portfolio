using UnityEngine;

public class SlidingDoor : MonoBehaviour
{
    [Header("Door Movement Settings")]
    [SerializeField] private float slideDistance = 3f;
    [SerializeField] private float slideSpeed = 2f;
    
    [Header("Debug")]
    [SerializeField] private bool isOpen = false;
    
    private Vector3 closedPosition;
    private Vector3 openPosition;
    private Coroutine moveCoroutine;

    void Start()
    {
        // Store the initial position as closed position
        closedPosition = transform.position;
        CalculateOpenPosition();
    }

    void CalculateOpenPosition()
    {
        openPosition = closedPosition + Vector3.down * slideDistance;
    }

    public void ToggleDoor()
    {
        if (isOpen)
        {
            CloseDoor();
        }
        else
        {
            OpenDoor();
        }
    }

    public void OpenDoor()
    {
        if (moveCoroutine != null)
            StopCoroutine(moveCoroutine);
        
        moveCoroutine = StartCoroutine(MoveDoor(openPosition));
        isOpen = true;
    }

    public void CloseDoor()
    {
        if (moveCoroutine != null)
            StopCoroutine(moveCoroutine);
        
        moveCoroutine = StartCoroutine(MoveDoor(closedPosition));
        isOpen = false;
    }

    private System.Collections.IEnumerator MoveDoor(Vector3 targetPosition)
    {
        while (Vector3.Distance(transform.position, targetPosition) > 0.01f)
        {
            transform.position = Vector3.MoveTowards(transform.position, targetPosition, slideSpeed * Time.deltaTime);
            yield return null;
        }
        
        // Ensure exact position at the end
        transform.position = targetPosition;
        moveCoroutine = null;
    }

    // Reset position when exiting play mode
    #if UNITY_EDITOR
    void Reset()
    {
        // Only reset in editor when not playing
        if (!Application.isPlaying)
        {
            UnityEditor.Undo.RecordObject(transform, "Reset Door Position");
            transform.position = closedPosition;
        }
    }
    #endif

    // For debugging in the inspector
    void OnValidate()
    {
        // Update open position when values change in inspector
        if (Application.isPlaying && closedPosition != Vector3.zero)
        {
            CalculateOpenPosition();
        }
    }
}