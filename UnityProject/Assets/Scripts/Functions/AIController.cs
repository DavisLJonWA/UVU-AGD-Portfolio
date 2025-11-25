using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class AIController : MonoBehaviour
{
    [Header("AI Settings")]
    [SerializeField] private TeamAffiliation controlledTeam = TeamAffiliation.Team2;
    [SerializeField] private bool startActive = false;
    [SerializeField] private KeyCode activationKey = KeyCode.F8;
    
    [Header("Spawn Settings")]
    [SerializeField] private float minionSpawnInterval = 10f;
    [SerializeField] private int maxMinions = 15;
    [SerializeField] private float buildingCheckInterval = 5f;
    
    [Header("Attack Settings")]
    [SerializeField] private float attackCheckInterval = 8f;
    [SerializeField] private float attackChance = 0.7f;
    [SerializeField] private int minAttackForce = 3;

    private List<RecruitmentBuilding> aiBuildings = new List<RecruitmentBuilding>();
    private List<Minion> aiMinions = new List<Minion>();
    private List<Health> enemyTargets = new List<Health>();
    
    private bool isActive = false;
    private Coroutine spawnCoroutine;
    private Coroutine attackCoroutine;
    private Coroutine buildingCheckCoroutine;

    void Start()
    {
        isActive = startActive;
        
        if (isActive)
        {
            ActivateAI();
        }
        else
        {
            DeactivateAI();
        }
        
        Debug.Log($"AI Controller for {controlledTeam} initialized. Press {activationKey} to toggle.");
    }

    void Update()
    {
        if (Input.GetKeyDown(activationKey))
        {
            ToggleAI();
        }
    }

    void ToggleAI()
    {
        isActive = !isActive;
        
        if (isActive)
        {
            ActivateAI();
        }
        else
        {
            DeactivateAI();
        }
        
        Debug.Log($"AI for {controlledTeam} is now {(isActive ? "ACTIVE" : "INACTIVE")}");
    }

    void ActivateAI()
    {
        // Find all buildings and minions for this team
        FindAIBuildings();
        FindAIMinions();
        FindEnemyTargets();
        
        // Start AI routines
        spawnCoroutine = StartCoroutine(SpawnRoutine());
        attackCoroutine = StartCoroutine(AttackRoutine());
        buildingCheckCoroutine = StartCoroutine(BuildingCheckRoutine());
        
        Debug.Log($"AI activated for {controlledTeam}. Buildings: {aiBuildings.Count}, Minions: {aiMinions.Count}");
    }

    void DeactivateAI()
    {
        // Stop all coroutines
        if (spawnCoroutine != null) StopCoroutine(spawnCoroutine);
        if (attackCoroutine != null) StopCoroutine(attackCoroutine);
        if (buildingCheckCoroutine != null) StopCoroutine(buildingCheckCoroutine);
        
        Debug.Log($"AI deactivated for {controlledTeam}");
    }

    IEnumerator SpawnRoutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(minionSpawnInterval);
            
            if (aiMinions.Count < maxMinions && aiBuildings.Count > 0)
            {
                // Try to spawn from each building
                foreach (RecruitmentBuilding building in aiBuildings)
                {
                    if (building.GetQueueCount() < building.GetMaxQueueSize())
                    {
                        building.QueueRecruitment();
                        Debug.Log($"AI queued recruitment at {building.gameObject.name}");
                        break; // Only queue one per cycle to spread out production
                    }
                }
            }
        }
    }

    IEnumerator AttackRoutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(attackCheckInterval);
            
            // Only attack if we have enough minions and there's a chance
            if (aiMinions.Count >= minAttackForce && Random.value < attackChance)
            {
                LaunchAttack();
            }
        }
    }

    IEnumerator BuildingCheckRoutine()
    {
        while (true)
        {
            yield return new WaitForSeconds(buildingCheckInterval);
            
            // Update our lists
            FindAIBuildings();
            FindAIMinions();
            FindEnemyTargets();
        }
    }

    void LaunchAttack()
    {
        if (enemyTargets.Count == 0)
        {
            Debug.Log("AI has no enemy targets to attack");
            return;
        }

        // Choose a random enemy target
        Health target = enemyTargets[Random.Range(0, enemyTargets.Count)];
        if (target == null || !target.IsAlive()) return;

        // Select minions for the attack (at least minAttackForce, up to half of our forces)
        int attackForce = Mathf.Min(aiMinions.Count, Mathf.Max(minAttackForce, aiMinions.Count / 2));
        List<Minion> attackers = new List<Minion>();

        for (int i = 0; i < attackForce && i < aiMinions.Count; i++)
        {
            if (aiMinions[i] != null && aiMinions[i].GetHealth().IsAlive())
            {
                attackers.Add(aiMinions[i]);
            }
        }

        // Command the attackers
        foreach (Minion minion in attackers)
        {
            UnitCombat combat = minion.GetComponent<UnitCombat>();
            if (combat != null)
            {
                combat.SetTarget(target);
            }
        }

        Debug.Log($"AI launched attack with {attackers.Count} minions on {target.gameObject.name}");
    }

    void FindAIBuildings()
    {
        aiBuildings.Clear();
        RecruitmentBuilding[] allBuildings = FindObjectsOfType<RecruitmentBuilding>();
        
        foreach (RecruitmentBuilding building in allBuildings)
        {
            Team team = building.GetComponent<Team>();
            if (team != null && team.GetTeam() == controlledTeam)
            {
                aiBuildings.Add(building);
            }
        }
    }

    void FindAIMinions()
    {
        aiMinions.Clear();
        Minion[] allMinions = FindObjectsOfType<Minion>();
        
        foreach (Minion minion in allMinions)
        {
            Team team = minion.GetComponent<Team>();
            if (team != null && team.GetTeam() == controlledTeam && minion.GetHealth().IsAlive())
            {
                aiMinions.Add(minion);
            }
        }
    }

    void FindEnemyTargets()
    {
        enemyTargets.Clear();
        
        // Find enemy minions
        Minion[] allMinions = FindObjectsOfType<Minion>();
        foreach (Minion minion in allMinions)
        {
            Team team = minion.GetComponent<Team>();
            if (team != null && team.GetTeam() != controlledTeam && team.GetTeam() != TeamAffiliation.Neutral && minion.GetHealth().IsAlive())
            {
                enemyTargets.Add(minion.GetComponent<Health>());
            }
        }
        
        // Find enemy buildings
        RecruitmentBuilding[] allBuildings = FindObjectsOfType<RecruitmentBuilding>();
        foreach (RecruitmentBuilding building in allBuildings)
        {
            Team team = building.GetComponent<Team>();
            if (team != null && team.GetTeam() != controlledTeam && team.GetTeam() != TeamAffiliation.Neutral)
            {
                enemyTargets.Add(building.GetComponent<Health>());
            }
        }
        
        Debug.Log($"AI found {enemyTargets.Count} enemy targets");
    }

    // Public methods for external control
    public void SetActive(bool active)
    {
        if (active != isActive)
        {
            ToggleAI();
        }
    }

    public bool IsActive()
    {
        return isActive;
    }

    public TeamAffiliation GetControlledTeam()
    {
        return controlledTeam;
    }

    [ContextMenu("Force Attack")]
    public void ForceAttack()
    {
        LaunchAttack();
    }

    [ContextMenu("Force Spawn")]
    public void ForceSpawn()
    {
        foreach (RecruitmentBuilding building in aiBuildings)
        {
            if (building.GetQueueCount() < building.GetMaxQueueSize())
            {
                building.QueueRecruitment();
                break;
            }
        }
    }

    [ContextMenu("Update AI State")]
    public void UpdateAIState()
    {
        FindAIBuildings();
        FindAIMinions();
        FindEnemyTargets();
        Debug.Log($"AI State - Buildings: {aiBuildings.Count}, Minions: {aiMinions.Count}, Enemy Targets: {enemyTargets.Count}");
    }
}