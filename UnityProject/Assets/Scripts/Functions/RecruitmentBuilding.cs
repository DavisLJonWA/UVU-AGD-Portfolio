using UnityEngine;
using UnityEngine.Events;
using System.Collections;
using System.Collections.Generic;

public class RecruitmentBuilding : MonoBehaviour
{
   [Header("Recruitment Settings")]
   [SerializeField] private float recruitmentTime = 15f;
   [SerializeField] private int maxQueueSize = 30;
   [SerializeField] private GameObject minionPrefab;
   
   [Header("Spawn Point Settings")]
   [SerializeField] private SpawnMethod spawnMethod = SpawnMethod.Transform;
   [SerializeField] private Transform spawnPoint; // Specific spawn point
   [SerializeField] private Vector3 spawnOffset = new Vector3(0, 0, 3f); // Offset from building
   [SerializeField] private float spawnRadius = 3f; // For random spawn method
   
   [Header("UI Events")]
   [SerializeField] private GameAction onBuildingSelected;
   [SerializeField] private GameAction onBuildingDeselected;
  
   [Header("Visual Feedback")]
   [SerializeField] private Renderer buildingRenderer;
   [SerializeField] private Material selectedMaterial;
   [SerializeField] private Material normalMaterial;
   [SerializeField] private ParticleSystem recruitmentParticles;
   [SerializeField] private GameObject spawnPointVisual; // Visual indicator of spawn point
  
   // Recruitment state
   private Queue<RecruitmentJob> recruitmentQueue = new Queue<RecruitmentJob>();
   private RecruitmentJob currentJob;
   private bool isRecruiting = false;
   private bool isSelected = false;
  
   // UI Reference
   private RecruitmentUI recruitmentUI;
  
   // Events
   public UnityEvent<int> onQueueUpdated;
   public UnityEvent<float> onRecruitmentProgress;
   public UnityEvent onRecruitmentStarted;
   public UnityEvent onRecruitmentCompleted;
   
   public enum SpawnMethod
   {
       Transform,      // Use specific transform
       Offset,         // Use offset from building
       RandomRadius    // Random point within radius (original method)
   }

   void Start()
   {
       // Find UI in scene
       recruitmentUI = FindObjectOfType<RecruitmentUI>();
      
       // Subscribe to selection events
       if (onBuildingSelected != null)
       {
           onBuildingSelected.RaiseNoArgs += OnBuildingSelected;
       }
      
       if (onBuildingDeselected != null)
       {
           onBuildingDeselected.RaiseNoArgs += OnBuildingDeselected;
       }
      
       // Initialize spawn point visual
       UpdateSpawnPointVisual();
      
       // Initialize visual state
       UpdateVisuals();
   }

   void OnDestroy()
   {
       // Unsubscribe from events
       if (onBuildingSelected != null)
       {
           onBuildingSelected.RaiseNoArgs -= OnBuildingSelected;
       }
      
       if (onBuildingDeselected != null)
       {
           onBuildingDeselected.RaiseNoArgs -= OnBuildingDeselected;
       }
      
       // Stop all coroutines
       StopAllCoroutines();
   }

   void Update()
   {
       // Handle recruitment process
       if (!isRecruiting && recruitmentQueue.Count > 0)
       {
           StartNextRecruitment();
       }
   }

   public void QueueRecruitment()
   {
       if (recruitmentQueue.Count >= maxQueueSize)
       {
           Debug.Log("Recruitment queue is full!");
           return;
       }
      
       RecruitmentJob newJob = new RecruitmentJob(recruitmentTime);
       recruitmentQueue.Enqueue(newJob);
      
       onQueueUpdated?.Invoke(recruitmentQueue.Count);
      
       Debug.Log($"Queued recruitment job. Queue size: {recruitmentQueue.Count}");
   }

   void StartNextRecruitment()
   {
       if (recruitmentQueue.Count == 0) return;
      
       currentJob = recruitmentQueue.Dequeue();
       isRecruiting = true;
      
       onQueueUpdated?.Invoke(recruitmentQueue.Count);
       onRecruitmentStarted?.Invoke();
      
       StartCoroutine(RecruitmentCoroutine(currentJob));
   }

   IEnumerator RecruitmentCoroutine(RecruitmentJob job)
   {
       float timer = 0f;
      
       // Start visual effects
       if (recruitmentParticles != null)
       {
           recruitmentParticles.Play();
       }
      
       while (timer < job.recruitmentTime)
       {
           timer += Time.deltaTime;
           float progress = timer / job.recruitmentTime;
          
           onRecruitmentProgress?.Invoke(progress);
          
           yield return null;
       }
      
       // Spawn minion
       SpawnMinion();
      
       // Complete recruitment
       isRecruiting = false;
       currentJob = null;
       onRecruitmentCompleted?.Invoke();
      
       Debug.Log("Recruitment completed! Minion spawned.");
   }

   void SpawnMinion()
   {
       if (minionPrefab == null)
       {
           Debug.LogError("No minion prefab assigned to recruitment building!");
           return;
       }
      
       // Find spawn position based on selected method
       Vector3 spawnPosition = GetSpawnPosition();
      
       // Instantiate minion
       GameObject newMinion = Instantiate(minionPrefab, spawnPosition, Quaternion.identity);
      
       // Initialize minion
       Minion minionComponent = newMinion.GetComponent<Minion>();
       if (minionComponent != null)
       {
           minionComponent.OnSpawned();
       }
      
       Debug.Log($"Minion spawned at {spawnPosition} using {spawnMethod} method");
   }

   Vector3 GetSpawnPosition()
   {
       Vector3 buildingPosition = transform.position;
       Vector3 spawnPos = buildingPosition;

       switch (spawnMethod)
       {
           case SpawnMethod.Transform:
               if (spawnPoint != null)
               {
                   spawnPos = spawnPoint.position;
               }
               else
               {
                   Debug.LogWarning("Spawn point transform not assigned, using building position");
                   spawnPos = buildingPosition;
               }
               break;
               
           case SpawnMethod.Offset:
               spawnPos = buildingPosition + spawnOffset;
               break;
               
           case SpawnMethod.RandomRadius:
               // Original random radius method
               for (int i = 0; i < 10; i++)
               {
                   Vector2 randomCircle = Random.insideUnitCircle.normalized * spawnRadius;
                   Vector3 randomPos = buildingPosition + new Vector3(randomCircle.x, 0, randomCircle.y);
                  
                   if (UnityEngine.AI.NavMesh.SamplePosition(randomPos, out UnityEngine.AI.NavMeshHit hit, 2f, UnityEngine.AI.NavMesh.AllAreas))
                   {
                       return hit.position;
                   }
               }
               Debug.LogWarning("Could not find valid spawn position, using building position");
               return buildingPosition;
       }

       // For Transform and Offset methods, verify the position is on NavMesh
       if (spawnMethod != SpawnMethod.RandomRadius)
       {
           if (UnityEngine.AI.NavMesh.SamplePosition(spawnPos, out UnityEngine.AI.NavMeshHit hit, 2f, UnityEngine.AI.NavMesh.AllAreas))
           {
               return hit.position;
           }
           else
           {
               Debug.LogWarning($"Spawn position {spawnPos} is not on NavMesh, finding nearest valid position");
               if (UnityEngine.AI.NavMesh.SamplePosition(spawnPos, out hit, 5f, UnityEngine.AI.NavMesh.AllAreas))
               {
                   return hit.position;
               }
           }
       }

       return spawnPos;
   }
   
   void UpdateSpawnPointVisual()
   {
       if (spawnPointVisual != null)
       {
           // Show/hide visual based on spawn method
           bool shouldShow = spawnMethod == SpawnMethod.Transform && spawnPoint != null;
           spawnPointVisual.SetActive(shouldShow);
           
           if (shouldShow && spawnPoint != null)
           {
               spawnPointVisual.transform.position = spawnPoint.position;
           }
       }
   }

   void OnBuildingSelected()
   {
       isSelected = true;
       UpdateVisuals();
      
       // Show recruitment UI
       if (recruitmentUI != null)
       {
           recruitmentUI.ShowUI(this);
       }
      
       Debug.Log("Building selected");
   }

   void OnBuildingDeselected()
   {
       isSelected = false;
       UpdateVisuals();
      
       // Hide recruitment UI
       if (recruitmentUI != null)
       {
           recruitmentUI.HideUI();
       }
      
       Debug.Log("Building deselected");
   }

   void UpdateVisuals()
   {
       if (buildingRenderer != null)
       {
           buildingRenderer.material = isSelected ? selectedMaterial : normalMaterial;
       }
   }
   
   // Public methods to configure spawn points at runtime
   public void SetSpawnPoint(Transform newSpawnPoint)
   {
       spawnPoint = newSpawnPoint;
       spawnMethod = SpawnMethod.Transform;
       UpdateSpawnPointVisual();
   }
   
   public void SetSpawnOffset(Vector3 newOffset)
   {
       spawnOffset = newOffset;
       spawnMethod = SpawnMethod.Offset;
       UpdateSpawnPointVisual();
   }
   
   public void SetSpawnRadius(float newRadius)
   {
       spawnRadius = newRadius;
       spawnMethod = SpawnMethod.RandomRadius;
       UpdateSpawnPointVisual();
   }

   // Public getters for UI
   public int GetQueueCount() => recruitmentQueue.Count;
   public int GetMaxQueueSize() => maxQueueSize;
   public bool IsRecruiting() => isRecruiting;
   public float GetCurrentProgress() => currentJob != null ? (Time.time - currentJob.startTime) / currentJob.recruitmentTime : 0f;

   [ContextMenu("Test Recruitment")]
   void TestRecruitment()
   {
       QueueRecruitment();
   }

   [ContextMenu("Test Multiple Recruitments")]
   void TestMultipleRecruitments()
   {
       for (int i = 0; i < 3; i++)
       {
           QueueRecruitment();
       }
   }
   
   [ContextMenu("Debug Spawn Position")]
   void DebugSpawnPosition()
   {
       Vector3 spawnPos = GetSpawnPosition();
       Debug.Log($"Spawn position: {spawnPos}, Method: {spawnMethod}");
       
       // Visual debug in scene view
       Debug.DrawLine(transform.position, spawnPos, Color.green, 3f);
       Debug.DrawRay(spawnPos, Vector3.up * 2f, Color.red, 3f);
   }

   void OnDrawGizmosSelected()
   {
       // Draw spawn point gizmos in scene view
       Gizmos.color = Color.green;
       
       switch (spawnMethod)
       {
           case SpawnMethod.Transform:
               if (spawnPoint != null)
               {
                   Gizmos.DrawWireSphere(spawnPoint.position, 0.5f);
                   Gizmos.DrawLine(transform.position, spawnPoint.position);
               }
               break;
               
           case SpawnMethod.Offset:
               Vector3 offsetPos = transform.position + spawnOffset;
               Gizmos.DrawWireSphere(offsetPos, 0.5f);
               Gizmos.DrawLine(transform.position, offsetPos);
               break;
               
           case SpawnMethod.RandomRadius:
               Gizmos.DrawWireSphere(transform.position, spawnRadius);
               break;
       }
   }
}

// Helper class for recruitment jobs
[System.Serializable]
public class RecruitmentJob
{
   public float recruitmentTime;
   public float startTime;
  
   public RecruitmentJob(float time)
   {
       recruitmentTime = time;
       startTime = Time.time;
   }
}