using UnityEngine;
using UnityEngine.AI;
using System.Collections;

public class Minion : MonoBehaviour
{
    [Header("Minion Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private GameObject moveMarkerPrefab;
    
    // Cached components
    private NavMeshAgent agent;
    private GameObject currentMoveMarker;
    private bool isSelected = false;
    private Renderer[] minionRenderers;
    private Coroutine hideMarkerCoroutine;

    void Start()
    {
        InitializeComponents();
        CreateMoveMarker();
    }

    void InitializeComponents()
    {
        // Cache renderers once
        minionRenderers = GetComponentsInChildren<Renderer>();
        
        // Initialize NavMeshAgent
        agent = GetComponent<NavMeshAgent>();
        if (agent == null)
        {
            agent = gameObject.AddComponent<NavMeshAgent>();
        }
        
        ConfigureAgent();
    }

    void ConfigureAgent()
    {
        if (agent == null) return;
        
        agent.speed = moveSpeed;
        agent.acceleration = 1000f;
        agent.angularSpeed = 360f;
        agent.stoppingDistance = 0.5f;
        agent.radius = 0.5f;
        agent.height = 2f;
        agent.autoBraking = true;
        
        // Optimize agent performance
        agent.obstacleAvoidanceType = ObstacleAvoidanceType.LowQualityObstacleAvoidance;
    }

    void CreateMoveMarker()
    {
        if (moveMarkerPrefab != null)
        {
            currentMoveMarker = Instantiate(moveMarkerPrefab);
            currentMoveMarker.SetActive(false);
            
            // Optimize: Don't update transform every frame if not visible
            if (currentMoveMarker.GetComponent<UpdateOptimizer>() == null)
            {
                currentMoveMarker.AddComponent<UpdateOptimizer>();
            }
        }
    }

    void OnValidate()
    {
        // Update agent settings when values change in editor
        if (agent != null)
        {
            agent.speed = moveSpeed;
        }
    }

    public void MoveTo(Vector3 destination)
    {
        if (agent != null && agent.isActiveAndEnabled)
        {
            // Use a coroutine for pathfinding to avoid frame spikes
            StartCoroutine(CalculateAndMove(destination));
        }
    }

    private System.Collections.IEnumerator CalculateAndMove(Vector3 destination)
    {
        // Yield to allow other operations in the same frame
        yield return null;
        
        if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 2f, NavMesh.AllAreas))
        {
            agent.SetDestination(hit.position);
            ShowMoveMarker(hit.position);
        }
    }

    public void OnSelected()
    {
        isSelected = true;
        
        // Cancel any pending hide operations
        if (hideMarkerCoroutine != null)
        {
            StopCoroutine(hideMarkerCoroutine);
        }
        
        // Show marker if we have an active path
        if (currentMoveMarker != null && agent.hasPath)
        {
            currentMoveMarker.SetActive(true);
        }
    }

    public void OnDeselected()
    {
        isSelected = false;
        
        // Schedule marker hide if not selected
        if (currentMoveMarker != null && currentMoveMarker.activeInHierarchy)
        {
            hideMarkerCoroutine = StartCoroutine(HideMarkerAfterDelay(3f));
        }
    }

    public void ShowMoveMarker(Vector3 position)
    {
        if (currentMoveMarker != null)
        {
            currentMoveMarker.transform.position = position + Vector3.up * 0.1f;
            currentMoveMarker.SetActive(true);
            
            if (!isSelected)
            {
                hideMarkerCoroutine = StartCoroutine(HideMarkerAfterDelay(3f));
            }
        }
    }

    private IEnumerator HideMarkerAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (currentMoveMarker != null && !isSelected)
        {
            currentMoveMarker.SetActive(false);
        }
        hideMarkerCoroutine = null;
    }

    // Optimized update - only check path when needed
    void Update()
    {
        // Only update marker position if it's visible and we're selected
        if (isSelected && currentMoveMarker != null && currentMoveMarker.activeInHierarchy)
        {
            if (agent.hasPath && agent.remainingDistance > agent.stoppingDistance)
            {
                currentMoveMarker.transform.position = agent.destination + Vector3.up * 0.1f;
            }
        }
    }

    void OnDestroy()
    {
        // Clean up
        if (currentMoveMarker != null)
        {
            Destroy(currentMoveMarker);
        }
        
        if (hideMarkerCoroutine != null)
        {
            StopCoroutine(hideMarkerCoroutine);
        }
    }

    // Getters
    public bool IsSelected() => isSelected;
    public bool IsMoving() => agent != null && agent.hasPath && agent.remainingDistance > agent.stoppingDistance;
    public Renderer[] GetRenderers() => minionRenderers;
}

// Helper component to optimize GameObject updates
public class UpdateOptimizer : MonoBehaviour
{
    [SerializeField] private float updateInterval = 0.1f;
    private float lastUpdateTime;
    
    void Update()
    {
        if (Time.time - lastUpdateTime > updateInterval)
        {
            // Custom update logic here if needed
            lastUpdateTime = Time.time;
        }
    }
}