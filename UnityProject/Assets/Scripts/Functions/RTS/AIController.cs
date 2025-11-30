using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AIController : MonoBehaviour
{
    [Header("AI Settings")]
    [SerializeField] private TeamAffiliation controlledTeam = TeamAffiliation.Team2;
    [SerializeField] private float minionSpawnInterval = 10f;
    [SerializeField] private int maxMinions = 15;
    [SerializeField] private float attackCheckInterval = 8f;

    private List<RecruitmentBuilding> aiBuildings = new List<RecruitmentBuilding>();
    private List<Minion> aiMinions = new List<Minion>();
    private Coroutine spawnCoroutine;
    private Coroutine attackCoroutine;

    public TeamAffiliation ControlledTeam => controlledTeam;

    void Start()
    {
        FindAIBuildings();
        StartAIRoutines();
    }

    void StartAIRoutines()
    {
        if (spawnCoroutine != null) StopCoroutine(spawnCoroutine);
        if (attackCoroutine != null) StopCoroutine(attackCoroutine);

        spawnCoroutine = StartCoroutine(SpawnRoutine());
        attackCoroutine = StartCoroutine(AttackRoutine());
    }

    IEnumerator SpawnRoutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(minionSpawnInterval);
            
            if (aiMinions.Count < maxMinions && aiBuildings.Count > 0)
            {
                foreach (RecruitmentBuilding building in aiBuildings)
                {
                    // FIXED: Use properties instead of methods
                    if (building.QueueCount < building.MaxQueueSize)
                    {
                        building.QueueRecruitment();
                        break;
                    }
                }
            }
            
            UpdateMinionList();
        }
    }

    IEnumerator AttackRoutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(attackCheckInterval);
            
            if (aiMinions.Count >= 3)
            {
                LaunchAttack();
            }
        }
    }

    void LaunchAttack()
    {
        List<Health> enemyTargets = FindEnemyTargets();
        if (enemyTargets.Count == 0) return;

        Health target = enemyTargets[Random.Range(0, enemyTargets.Count)];
        if (target == null || !target.IsAlive) return;

        int attackForce = Mathf.Min(aiMinions.Count, 5);
        for (int i = 0; i < attackForce && i < aiMinions.Count; i++)
        {
            if (aiMinions[i] != null && aiMinions[i].Health.IsAlive)
            {
                aiMinions[i].IssueAttackCommand(target);
            }
        }
    }

    void UpdateMinionList()
    {
        aiMinions.Clear();
        Minion[] allMinions = FindObjectsOfType<Minion>();
        foreach (Minion minion in allMinions)
        {
            if (minion.Team.TeamAffiliation == controlledTeam && minion.Health.IsAlive)
            {
                aiMinions.Add(minion);
            }
        }
    }

    void FindAIBuildings()
    {
        aiBuildings.Clear();
        RecruitmentBuilding[] allBuildings = FindObjectsOfType<RecruitmentBuilding>();
        foreach (RecruitmentBuilding building in allBuildings)
        {
            Team buildingTeam = building.GetComponent<Team>();
            if (buildingTeam != null && buildingTeam.TeamAffiliation == controlledTeam)
            {
                aiBuildings.Add(building);
            }
        }
    }

    List<Health> FindEnemyTargets()
    {
        List<Health> enemyTargets = new List<Health>();
        Minion[] allMinions = FindObjectsOfType<Minion>();
        RecruitmentBuilding[] allBuildings = FindObjectsOfType<RecruitmentBuilding>();

        foreach (Minion minion in allMinions)
        {
            if (minion.Team.TeamAffiliation != controlledTeam && minion.Health.IsAlive)
            {
                enemyTargets.Add(minion.Health);
            }
        }

        foreach (RecruitmentBuilding building in allBuildings)
        {
            Team buildingTeam = building.GetComponent<Team>();
            if (buildingTeam != null && buildingTeam.TeamAffiliation != controlledTeam)
            {
                Health buildingHealth = building.GetComponent<Health>();
                if (buildingHealth != null && buildingHealth.IsAlive)
                {
                    enemyTargets.Add(buildingHealth);
                }
            }
        }

        return enemyTargets;
    }

    void OnDestroy()
    {
        if (spawnCoroutine != null) StopCoroutine(spawnCoroutine);
        if (attackCoroutine != null) StopCoroutine(attackCoroutine);
    }

    void OnEnable()
    {
        if (spawnCoroutine == null && attackCoroutine == null)
        {
            StartAIRoutines();
        }
    }

    void OnDisable()
    {
        if (spawnCoroutine != null) StopCoroutine(spawnCoroutine);
        if (attackCoroutine != null) StopCoroutine(attackCoroutine);
    }
}