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
           audioSource.spatialBlend = 1f;
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
      
       Debug.Log($"{gameObject.name} minion spawned - NavMeshAgent: {agent != null}, Enabled: {agent.enabled}, OnNavMesh: {agent.isOnNavMesh}");
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
       agent.obstacleAvoidanceType = ObstacleAvoidanceType.HighQualityObstacleAvoidance;
       
       // Ensure agent is enabled
       agent.enabled = true;
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
       foreach (Renderer renderer in minionRenderers)
       {
           if (renderer != null)
           {
               if (invulnerable)
               {
                   Color currentColor = renderer.material.color;
                   renderer.material.color = new Color(currentColor.r, currentColor.g, currentColor.b, 0.7f);
               }
               else
               {
                   Color currentColor = renderer.material.color;
                   renderer.material.color = new Color(currentColor.r, currentColor.g, currentColor.b, 1f);
               }
           }
       }
   }

   public void MoveTo(Vector3 destination)
   {
       if (agent == null)
       {
           Debug.LogError($"{gameObject.name}: NavMeshAgent is null!");
           return;
       }

       if (!agent.isOnNavMesh)
       {
           Debug.LogError($"{gameObject.name}: Agent is not on NavMesh! Attempting to warp...");
           if (NavMesh.SamplePosition(transform.position, out NavMeshHit hit, 2f, NavMesh.AllAreas))
           {
               agent.Warp(hit.position);
           }
           else
           {
               Debug.LogError($"{gameObject.name}: Cannot warp to NavMesh!");
               return;
           }
       }

       if (!agent.isActiveAndEnabled)
       {
           Debug.LogWarning($"{gameObject.name}: NavMeshAgent is not active and enabled");
           agent.enabled = true;
       }

       if (isSpawning)
       {
           Debug.Log($"{gameObject.name} is still spawning, cannot move yet");
           return;
       }

       // Calculate path first to check if it's valid
       NavMeshPath path = new NavMeshPath();
       if (agent.CalculatePath(destination, path))
       {
           if (path.status == NavMeshPathStatus.PathComplete)
           {
               agent.SetPath(path);
               ShowMoveMarker(destination);
               Debug.Log($"{gameObject.name} moving to: {destination} - Path complete");
           }
           else
           {
               Debug.LogWarning($"{gameObject.name}: Path status: {path.status}. Trying fallback...");
               
               // Fallback: Try to find nearest valid point
               if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 5f, NavMesh.AllAreas))
               {
                   agent.SetDestination(hit.position);
                   ShowMoveMarker(hit.position);
                   Debug.Log($"{gameObject.name} moving to nearest valid point: {hit.position}");
               }
               else
               {
                   Debug.LogError($"{gameObject.name}: Cannot find valid path to {destination}");
               }
           }
       }
       else
       {
           Debug.LogError($"{gameObject.name}: Cannot calculate path to {destination}");
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

       // Debug agent state
       if (agent.hasPath && agent.pathStatus != NavMeshPathStatus.PathComplete)
       {
           Debug.Log($"{gameObject.name} path status: {agent.pathStatus}, remaining distance: {agent.remainingDistance}");
       }
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

   [ContextMenu("Test Agent Configuration")]
   void TestAgentConfiguration()
   {
       Debug.Log($"=== AGENT DEBUG INFO ===");
       Debug.Log($"Agent: {agent != null}");
       if (agent != null)
       {
           Debug.Log($"Enabled: {agent.enabled}");
           Debug.Log($"IsOnNavMesh: {agent.isOnNavMesh}");
           Debug.Log($"HasPath: {agent.hasPath}");
           Debug.Log($"PathStatus: {agent.pathStatus}");
           Debug.Log($"RemainingDistance: {agent.remainingDistance}");
           Debug.Log($"Destination: {agent.destination}");
           Debug.Log($"Position: {transform.position}");
       }
       Debug.Log($"=== END DEBUG INFO ===");
   }
}