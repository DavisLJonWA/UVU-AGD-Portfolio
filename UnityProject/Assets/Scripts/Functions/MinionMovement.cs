using UnityEngine;
using UnityEngine.AI;
using System.Collections;

public class MinionMovement : MonoBehaviour
{
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float acceleration = 8f;
    [SerializeField] private float angularSpeed = 360f;
    [SerializeField] private GameObject moveMarkerPrefab;
    [SerializeField] private GameObject attackMarkerPrefab;
    [SerializeField] private float stoppingDistance = 0.5f;

    private NavMeshAgent agent;
    private GameObject currentMoveMarker;
    private GameObject currentAttackMarker;
    private Coroutine hideMarkerCoroutine;
    private Vector3 lastDestination;
    private bool hasReachedDestination = false;

    public bool IsMoving => agent != null && agent.hasPath && agent.remainingDistance > stoppingDistance;
    public bool HasReachedDestination => hasReachedDestination;

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
        agent.acceleration = acceleration;
        agent.angularSpeed = angularSpeed;
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

        UnitCombat combat = GetComponent<UnitCombat>();
        if (combat != null)
        {
            combat.SetMovementOverride(true);
            combat.ClearTarget();
        }

        if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 2f, NavMesh.AllAreas))
        {
            agent.SetDestination(hit.position);
            lastDestination = hit.position;
            hasReachedDestination = false;
            ShowMoveMarker(hit.position);
        }
        else
        {
            agent.SetDestination(destination);
            lastDestination = destination;
            hasReachedDestination = false;
            ShowMoveMarker(destination);
        }
    }

    public void MoveToAttackTarget(Vector3 targetPosition)
    {
        if (agent == null || !agent.isActiveAndEnabled) return;

        // For attack movements, don't set movement override - allow combat to continue
        if (NavMesh.SamplePosition(targetPosition, out NavMeshHit hit, 2f, NavMesh.AllAreas))
        {
            agent.SetDestination(hit.position);
            lastDestination = hit.position;
            hasReachedDestination = false;
        }
        else
        {
            agent.SetDestination(targetPosition);
            lastDestination = targetPosition;
            hasReachedDestination = false;
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
        if (agent.hasPath && agent.remainingDistance <= agent.stoppingDistance && !hasReachedDestination)
        {
            hasReachedDestination = true;

            UnitCombat combat = GetComponent<UnitCombat>();
            if (combat != null)
            {
                combat.SetMovementOverride(false);
            }
        }

        UnitCombat combatCheck = GetComponent<UnitCombat>();
        if (combatCheck != null && combatCheck.HasTarget())
        {
            Health target = combatCheck.GetTarget();
            if (target != null && target.IsAlive())
            {
                // For buildings, recalculate path to closest point
                Vector3 targetPosition = target.transform.position;
                if (target.GetComponent<RecruitmentBuilding>() != null)
                {
                    Collider buildingCollider = target.GetComponent<Collider>();
                    if (buildingCollider != null)
                    {
                        targetPosition = buildingCollider.ClosestPoint(transform.position);
                    }
                }

                if (agent.hasPath && Vector3.Distance(agent.destination, targetPosition) > 1f &&
                    !combatCheck.IsInAttackRange())
                {
                    agent.SetDestination(targetPosition);
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