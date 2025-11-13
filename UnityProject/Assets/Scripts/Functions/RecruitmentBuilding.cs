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
    [SerializeField] private float spawnRadius = 3f;
    
    [Header("UI Events")]
    [SerializeField] private GameAction onBuildingSelected;
    [SerializeField] private GameAction onBuildingDeselected;
    
    [Header("Visual Feedback")]
    [SerializeField] private Renderer buildingRenderer;
    [SerializeField] private Material selectedMaterial;
    [SerializeField] private Material normalMaterial;
    [SerializeField] private ParticleSystem recruitmentParticles;
    
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
        
        // Find spawn position around building
        Vector3 spawnPosition = FindSpawnPosition();
        
        // Instantiate minion
        GameObject newMinion = Instantiate(minionPrefab, spawnPosition, Quaternion.identity);
        
        // Initialize minion
        Minion minionComponent = newMinion.GetComponent<Minion>();
        if (minionComponent != null)
        {
            minionComponent.OnSpawned();
        }
        
        Debug.Log($"Minion spawned at {spawnPosition}");
    }

    Vector3 FindSpawnPosition()
    {
        Vector3 buildingPosition = transform.position;
        
        // Try to find a valid spawn position around the building
        for (int i = 0; i < 10; i++) // Try up to 10 times
        {
            Vector2 randomCircle = Random.insideUnitCircle.normalized * spawnRadius;
            Vector3 spawnPos = buildingPosition + new Vector3(randomCircle.x, 0, randomCircle.y);
            
            // Check if position is on NavMesh
            if (UnityEngine.AI.NavMesh.SamplePosition(spawnPos, out UnityEngine.AI.NavMeshHit hit, 2f, UnityEngine.AI.NavMesh.AllAreas))
            {
                return hit.position;
            }
        }
        
        // Fallback: spawn directly at building position
        Debug.LogWarning("Could not find valid spawn position, using building position");
        return buildingPosition;
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