using UnityEngine;
using UnityEngine.AI;
using System.Collections;

public class Minion : MonoBehaviour
{
    [Header("Minion Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private GameObject moveMarkerPrefab;
    
    [Header("Spawn Settings")]
    [SerializeField] private ParticleSystem spawnParticles;
    [SerializeField] private AudioClip spawnSound;
    [SerializeField] private float spawnInvulnerabilityTime = 2f;
    
    [Header("Selection Visual")]
    [SerializeField] private GameObject selectionIndicator;
    
    // Component references
    private NavMeshAgent agent;
    private GameObject currentMoveMarker;
    private AudioSource audioSource;
    private Renderer[] minionRenderers;
    
    // State management
    private bool isSelected = false;
    private bool isSpawning = true;
    private bool isInvulnerable = false;
    private Coroutine hideMarkerCoroutine;
    private Coroutine invulnerabilityCoroutine;

    void Awake()
    {
        // Cache components
        minionRenderers = GetComponentsInChildren<Renderer>();
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.spatialBlend = 1f; // 3D sound
            audioSource.volume = 0.7f;
        }

        // Initialize NavMeshAgent
        agent = GetComponent<NavMeshAgent>();
        if (agent == null)
        {
            agent = gameObject.AddComponent<NavMeshAgent>();
        }
        
        ConfigureAgent();
    }

    void Start()
    {
        CreateMoveMarker();
        InitializeSelectionIndicator();
        
        // UIRTSSystem uses FindObjectsOfType caching, so no registration needed
        // It will automatically detect this minion in its cache updates
        Debug.Log($"{gameObject.name} minion spawned - will be detected by UIRTSSystem cache");
    }

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

    void ConfigureAgent()
    {
        if (agent == null) return;
        
        agent.speed = moveSpeed;
        agent.acceleration = 8f;
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
        }
    }

    void InitializeSelectionIndicator()
    {
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }
    }

    public void OnSpawned()
    {
        Debug.Log($"{gameObject.name} spawned successfully");
        
        // Play spawn effects
        if (spawnParticles != null)
        {
            spawnParticles.Play();
        }
        
        if (spawnSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(spawnSound);
        }
        
        // Start spawn sequence
        StartCoroutine(SpawnSequence());
    }

    IEnumerator SpawnSequence()
    {
        // Initial spawn state
        isSpawning = true;
        isInvulnerable = true;
        
        // Disable agent during spawn sequence
        if (agent != null)
        {
            agent.isStopped = true;
        }
        
        // Optional: Visual spawn effects
        if (spawnParticles != null)
        {
            yield return new WaitForSeconds(spawnParticles.main.duration * 0.5f);
        }
        
        // Enable agent after spawn sequence
        if (agent != null)
        {
            agent.isStopped = false;
        }
        
        isSpawning = false;
        
        // Start invulnerability period
        if (spawnInvulnerabilityTime > 0)
        {
            invulnerabilityCoroutine = StartCoroutine(InvulnerabilityPeriod());
        }
        
        Debug.Log($"{gameObject.name} spawn sequence completed");
    }

    IEnumerator InvulnerabilityPeriod()
    {
        isInvulnerable = true;
        
        // Visual feedback for invulnerability (optional)
        SetInvulnerabilityVisuals(true);
        
        yield return new WaitForSeconds(spawnInvulnerabilityTime);
        
        isInvulnerable = false;
        SetInvulnerabilityVisuals(false);
        
        Debug.Log($"{gameObject.name} invulnerability ended");
    }

    void SetInvulnerabilityVisuals(bool invulnerable)
    {
        // Optional: Add visual feedback for invulnerability state
        // This could be a outline, glow, or material change
        foreach (Renderer renderer in minionRenderers)
        {
            if (renderer != null)
            {
                // Example: Toggle an outline component or change material
                // You would need to implement this based on your visual setup
                if (invulnerable)
                {
                    // Make minion semi-transparent or add glow
                    Color currentColor = renderer.material.color;
                    renderer.material.color = new Color(currentColor.r, currentColor.g, currentColor.b, 0.7f);
                }
                else
                {
                    // Restore normal appearance
                    Color currentColor = renderer.material.color;
                    renderer.material.color = new Color(currentColor.r, currentColor.g, currentColor.b, 1f);
                }
            }
        }
    }

    public void MoveTo(Vector3 destination)
    {
        if (agent != null && agent.isActiveAndEnabled && !isSpawning)
        {
            // Use a coroutine for pathfinding to avoid frame spikes
            StartCoroutine(CalculateAndMove(destination));
        }
        else if (isSpawning)
        {
            Debug.Log($"{gameObject.name} is still spawning, cannot move yet");
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
        else
        {
            Debug.LogWarning($"{gameObject.name} cannot find valid path to {destination}");
        }
    }

    public void OnSelected()
    {
        if (isSelected) return;
        
        isSelected = true;
        
        // Cancel any pending hide operations
        if (hideMarkerCoroutine != null)
        {
            StopCoroutine(hideMarkerCoroutine);
            hideMarkerCoroutine = null;
        }
        
        // Show selection indicator
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(true);
        }
        
        // Show marker if we have an active path
        if (currentMoveMarker != null && agent.hasPath)
        {
            currentMoveMarker.SetActive(true);
        }
        
        Debug.Log($"{gameObject.name} selected");
    }

    public void OnDeselected()
    {
        if (!isSelected) return;
        
        isSelected = false;
        
        // Hide selection indicator
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }
        
        // Schedule marker hide if not selected
        if (currentMoveMarker != null && currentMoveMarker.activeInHierarchy)
        {
            hideMarkerCoroutine = StartCoroutine(HideMarkerAfterDelay(3f));
        }
        
        Debug.Log($"{gameObject.name} deselected");
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

    void OnDestroy()
    {
        // Clean up coroutines
        if (hideMarkerCoroutine != null)
        {
            StopCoroutine(hideMarkerCoroutine);
        }
        
        if (invulnerabilityCoroutine != null)
        {
            StopCoroutine(invulnerabilityCoroutine);
        }
        
        // Clean up move marker
        if (currentMoveMarker != null)
        {
            Destroy(currentMoveMarker);
        }
        
        Debug.Log($"{gameObject.name} minion destroyed");
    }

    void OnValidate()
    {
        // Update agent settings when values change in editor
        if (agent != null)
        {
            agent.speed = moveSpeed;
        }
    }

    // Public getters for optimized access
    public Renderer[] GetRenderers() => minionRenderers;
    public bool IsSelected() => isSelected;
    public bool IsMoving() => agent != null && agent.hasPath && agent.remainingDistance > agent.stoppingDistance;
    public bool IsSpawning() => isSpawning;
    public bool IsInvulnerable() => isInvulnerable;
    public NavMeshAgent GetAgent() => agent;

    // Health/Damage system placeholder (expand as needed)
    public void TakeDamage(float damage)
    {
        if (isInvulnerable)
        {
            Debug.Log($"{gameObject.name} is invulnerable, damage ignored");
            return;
        }
        
        // Implement health system here
        Debug.Log($"{gameObject.name} took {damage} damage");
    }

    [ContextMenu("Test Spawn Sequence")]
    void TestSpawnSequence()
    {
        OnSpawned();
    }

    [ContextMenu("Test Move Command")]
    void TestMoveCommand()
    {
        Vector3 testPosition = transform.position + new Vector3(5f, 0, 5f);
        MoveTo(testPosition);
    }

    [ContextMenu("Toggle Selection")]
    void ToggleSelection()
    {
        if (isSelected)
            OnDeselected();
        else
            OnSelected();
    }
}