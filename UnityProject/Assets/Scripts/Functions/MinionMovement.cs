// MinionMovement.cs (Fixed)
using UnityEngine;
using UnityEngine.AI;
using System.Collections;

public class MinionMovement : MonoBehaviour
{
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float acceleration = 8f; // Made this serialized
    [SerializeField] private float angularSpeed = 360f;
    [SerializeField] private GameObject moveMarkerPrefab;
    [SerializeField] private GameObject attackMarkerPrefab;
    [SerializeField] private float stoppingDistance = 0.5f;

    private NavMeshAgent agent;
    private GameObject currentMoveMarker;
    private GameObject currentAttackMarker;
    private Coroutine hideMarkerCoroutine;

    public bool IsMoving => agent != null && agent.hasPath && agent.remainingDistance > stoppingDistance;

    void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        if (agent == null)
        {
            agent = gameObject.AddComponent<NavMeshAgent>();
        }
        
        ConfigureAgent();
        CreateMarkers();
    }

    void ConfigureAgent()
    {
        if (agent == null) return;
        
        agent.speed = moveSpeed;
        agent.acceleration = acceleration; // Now uses serialized field
        agent.angularSpeed = angularSpeed; // Now uses serialized field
        agent.stoppingDistance = stoppingDistance;
        agent.radius = 0.5f;
        agent.height = 2f;
        agent.autoBraking = true;
        agent.obstacleAvoidanceType = ObstacleAvoidanceType.HighQualityObstacleAvoidance;
        agent.enabled = true;
    }

    void CreateMarkers()
    {
        if (moveMarkerPrefab != null)
        {
            currentMoveMarker = Instantiate(moveMarkerPrefab);
            currentMoveMarker.SetActive(false);
        }
        
        if (attackMarkerPrefab != null)
        {
            currentAttackMarker = Instantiate(attackMarkerPrefab);
            currentAttackMarker.SetActive(false);
        }
    }

    public void MoveTo(Vector3 destination)
    {
        if (agent == null || !agent.isActiveAndEnabled) return;

        // Clear any combat target when given move command
        UnitCombat combat = GetComponent<UnitCombat>();
        if (combat != null)
        {
            combat.ClearTarget();
        }

        if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 2f, NavMesh.AllAreas))
        {
            agent.SetDestination(hit.position);
            ShowMoveMarker(hit.position);
            Debug.Log($"{gameObject.name} moving to: {hit.position}");
        }
        else
        {
            Debug.LogWarning($"{gameObject.name} cannot find valid path to {destination}");
            agent.SetDestination(destination);
            ShowMoveMarker(destination);
        }
    }

    public void StopMoving()
    {
        if (agent != null && agent.hasPath)
        {
            agent.ResetPath();
        }
    }

    public void ShowMoveMarker(Vector3 position)
    {
        // Hide attack marker if showing
        if (currentAttackMarker != null && currentAttackMarker.activeInHierarchy)
        {
            currentAttackMarker.SetActive(false);
        }
        
        if (currentMoveMarker != null)
        {
            currentMoveMarker.transform.position = position + Vector3.up * 0.1f;
            currentMoveMarker.SetActive(true);
            
            if (hideMarkerCoroutine != null)
                StopCoroutine(hideMarkerCoroutine);
                
            hideMarkerCoroutine = StartCoroutine(HideMarkerAfterDelay(3f));
        }
    }
    
    public void ShowAttackMarker(Vector3 position)
    {
        // Hide move marker if showing
        if (currentMoveMarker != null && currentMoveMarker.activeInHierarchy)
        {
            currentMoveMarker.SetActive(false);
        }
        
        if (currentAttackMarker != null)
        {
            currentAttackMarker.transform.position = position + Vector3.up * 0.1f;
            currentAttackMarker.SetActive(true);
            
            if (hideMarkerCoroutine != null)
                StopCoroutine(hideMarkerCoroutine);
                
            hideMarkerCoroutine = StartCoroutine(HideMarkerAfterDelay(3f));
        }
    }

    private IEnumerator HideMarkerAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (currentMoveMarker != null)
        {
            currentMoveMarker.SetActive(false);
        }
        if (currentAttackMarker != null)
        {
            currentAttackMarker.SetActive(false);
        }
        hideMarkerCoroutine = null;
    }

    void Update()
    {
        // If we have a combat target and it's moving, update our destination
        UnitCombat combat = GetComponent<UnitCombat>();
        if (combat != null && combat.HasTarget())
        {
            Health target = combat.GetTarget();
            if (target != null && target.IsAlive())
            {
                // Only update path if target has moved significantly
                if (agent.hasPath && Vector3.Distance(agent.destination, target.transform.position) > 1f)
                {
                    agent.SetDestination(target.transform.position);
                }
            }
        }
    }

    void OnDestroy()
    {
        if (hideMarkerCoroutine != null)
            StopCoroutine(hideMarkerCoroutine);
            
        if (currentMoveMarker != null)
            Destroy(currentMoveMarker);
            
        if (currentAttackMarker != null)
            Destroy(currentAttackMarker);
    }
}