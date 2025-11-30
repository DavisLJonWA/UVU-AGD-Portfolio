using UnityEngine;
using UnityEngine.AI;

public class MinionMovement : MonoBehaviour
{
    [Header("Movement Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private float stoppingDistance = 0.5f;

    private NavMeshAgent agent;
    private bool hasReachedDestination = false;

    public bool IsMoving => agent != null && agent.hasPath && agent.remainingDistance > stoppingDistance;
    public bool HasReachedDestination => hasReachedDestination;

    void Awake()
    {
        agent = GetComponent<NavMeshAgent>();
        if (agent == null)
            agent = gameObject.AddComponent<NavMeshAgent>();

        ConfigureAgent();
    }

    void ConfigureAgent()
    {
        agent.speed = moveSpeed;
        agent.stoppingDistance = stoppingDistance;
        agent.acceleration = 8f;
        agent.angularSpeed = 360f;
        agent.radius = 0.5f;
        agent.height = 2f;
    }

    public void MoveToPosition(Vector3 destination)
    {
        if (agent == null || !agent.isActiveAndEnabled) return;

        if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 2f, NavMesh.AllAreas))
        {
            agent.SetDestination(hit.position);
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

    void Update()
    {
        if (agent.hasPath && agent.remainingDistance <= agent.stoppingDistance && !hasReachedDestination)
        {
            hasReachedDestination = true;
        }
    }
}