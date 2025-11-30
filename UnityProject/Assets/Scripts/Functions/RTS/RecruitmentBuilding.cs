using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class RecruitmentBuilding : MonoBehaviour
{
    [Header("Recruitment Settings")]
    [SerializeField] private float recruitmentTime = 5f;
    [SerializeField] private int maxQueueSize = 5;
    [SerializeField] private GameObject minionPrefab;

    [Header("Spawn Settings")]
    [SerializeField] private Transform spawnPoint;
    [SerializeField] private float spawnRadius = 3f;

    [Header("Visual Feedback")]
    [SerializeField] private Renderer buildingRenderer;
    [SerializeField] private Material selectedMaterial;
    [SerializeField] private Material normalMaterial;
    [SerializeField] private ParticleSystem recruitmentParticles;

    private Queue<RecruitmentJob> recruitmentQueue = new Queue<RecruitmentJob>();
    private RecruitmentJob currentJob;
    private bool isRecruiting = false;
    private bool isSelected = false;

    public int QueueCount => recruitmentQueue.Count;
    public int MaxQueueSize => maxQueueSize;
    public bool IsRecruiting => isRecruiting;
    public float CurrentProgress => currentJob != null ? (Time.time - currentJob.startTime) / recruitmentTime : 0f;

    void Start()
    {
        UpdateVisuals();
    }

    void Update()
    {
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

        Debug.Log($"Queued recruitment job. Queue size: {recruitmentQueue.Count}");
    }

    void StartNextRecruitment()
    {
        if (recruitmentQueue.Count == 0) return;

        currentJob = recruitmentQueue.Dequeue();
        isRecruiting = true;

        if (recruitmentParticles != null)
        {
            recruitmentParticles.Play();
        }

        StartCoroutine(RecruitmentCoroutine(currentJob));
    }

    IEnumerator RecruitmentCoroutine(RecruitmentJob job)
    {
        float timer = 0f;

        while (timer < job.recruitmentTime)
        {
            timer += Time.deltaTime;
            yield return null;
        }

        SpawnMinion();
        CompleteRecruitment();
    }

    void SpawnMinion()
    {
        if (minionPrefab == null)
        {
            Debug.LogError("No minion prefab assigned to recruitment building!");
            return;
        }

        Vector3 spawnPosition = GetSpawnPosition();
        GameObject newMinion = Instantiate(minionPrefab, spawnPosition, Quaternion.identity);

        SetupMinionTeam(newMinion);
        InitializeMinion(newMinion);

        Debug.Log($"Minion spawned at {spawnPosition}");
    }

    Vector3 GetSpawnPosition()
    {
        if (spawnPoint != null)
        {
            return spawnPoint.position;
        }

        // Fallback to random position around building
        for (int i = 0; i < 10; i++)
        {
            Vector2 randomCircle = Random.insideUnitCircle.normalized * spawnRadius;
            Vector3 randomPos = transform.position + new Vector3(randomCircle.x, 0, randomCircle.y);

            if (UnityEngine.AI.NavMesh.SamplePosition(randomPos, out UnityEngine.AI.NavMeshHit hit, 2f, UnityEngine.AI.NavMesh.AllAreas))
            {
                return hit.position;
            }
        }

        return transform.position;
    }

    void SetupMinionTeam(GameObject minion)
    {
        Team buildingTeam = GetComponent<Team>();
        Team minionTeam = minion.GetComponent<Team>();

        if (buildingTeam != null && minionTeam != null)
        {
            minionTeam.SetTeam(buildingTeam.TeamAffiliation);
            minionTeam.SetTeamColor(buildingTeam.TeamColor);
        }
    }

    void InitializeMinion(GameObject minion)
    {
        Minion minionComponent = minion.GetComponent<Minion>();
        if (minionComponent != null)
        {
            // Minion is automatically initialized via its Start method
        }
    }

    void CompleteRecruitment()
    {
        isRecruiting = false;
        currentJob = null;

        if (recruitmentParticles != null)
        {
            recruitmentParticles.Stop();
        }

        Debug.Log("Recruitment completed!");
    }

    public void OnSelected()
    {
        isSelected = true;
        UpdateVisuals();
    }

    public void OnDeselected()
    {
        isSelected = false;
        UpdateVisuals();
    }

    void UpdateVisuals()
    {
        if (buildingRenderer != null)
        {
            buildingRenderer.material = isSelected ? selectedMaterial : normalMaterial;
        }
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.green;
        
        if (spawnPoint != null)
        {
            Gizmos.DrawWireSphere(spawnPoint.position, 0.5f);
            Gizmos.DrawLine(transform.position, spawnPoint.position);
        }
        else
        {
            Gizmos.DrawWireSphere(transform.position, spawnRadius);
        }
    }
}

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