using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class UnitCombat : MonoBehaviour
{
    [Header("Combat Settings")]
    [SerializeField] private float attackDamage = 10f;
    [SerializeField] private float attackSpeed = 1f;
    [SerializeField] private float attackRange = 2f;
    [SerializeField] private float visionRange = 8f;

    [Header("Target Settings")]
    [SerializeField] private LayerMask enemyLayerMask = 1 << 7 | 1 << 9;
    [SerializeField] private bool canAttackBuildings = true;
    [SerializeField] private bool autoAcquireTargets = true;
    [SerializeField] private float autoAttackDelay = 2f;

    [Header("Visual Feedback")]
    [SerializeField] private GameObject attackEffect;
    [SerializeField] private AudioClip attackSound;
    [SerializeField] private Material enemyHighlightMaterial;

    private Health myHealth;
    private Team myTeam;
    private MinionMovement movement;
    private AudioSource audioSource;

    private Health currentTarget;
    private bool isAttacking = false;
    private Coroutine attackCoroutine;
    private Coroutine autoAttackCoroutine;
    private bool isInAttackRange = false;
    private bool movementOverride = false;

    private Dictionary<Renderer, Material[]> originalTargetMaterials = new Dictionary<Renderer, Material[]>();

    public Health GetTarget() => currentTarget;
    public bool HasTarget() => currentTarget != null && currentTarget.IsAlive();
    public float GetAttackRange() => attackRange;
    public bool IsAttacking() => isAttacking;
    public bool IsMovementOverride() => movementOverride;
    public bool IsInAttackRange() => isInAttackRange;

    void Awake()
    {
        myHealth = GetComponent<Health>();
        myTeam = GetComponent<Team>();
        movement = GetComponent<MinionMovement>();
        audioSource = GetComponent<AudioSource>();
        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.spatialBlend = 1f;
        }
    }

    void Update()
    {
        if (!myHealth.IsAlive() || movementOverride)
        {
            if (movementOverride && isAttacking)
            {
                if (attackCoroutine != null)
                {
                    StopCoroutine(attackCoroutine);
                    isAttacking = false;
                }
            }
            return;
        }

        if (autoAcquireTargets && !HasTarget())
        {
            if (autoAttackCoroutine == null)
            {
                autoAttackCoroutine = StartCoroutine(DelayedAutoAcquire());
            }
        }

        if (HasTarget() && !movementOverride)
        {
            HandleCombatState();
        }
    }

    IEnumerator DelayedAutoAcquire()
    {
        yield return new WaitForSeconds(autoAttackDelay);

        if (!HasTarget() && !movementOverride)
        {
            FindAndSetTarget();
        }

        autoAttackCoroutine = null;
    }

    void HandleCombatState()
    {
        if (!HasTarget() || movementOverride)
        {
            ClearTarget();
            return;
        }

        // Calculate distance to target - for buildings, use the closest point on their collider
        float distanceToTarget;
        if (currentTarget.GetComponent<RecruitmentBuilding>() != null)
        {
            // For buildings, check distance to the closest point on the building's collider
            Collider buildingCollider = currentTarget.GetComponent<Collider>();
            if (buildingCollider != null)
            {
                Vector3 closestPoint = buildingCollider.ClosestPoint(transform.position);
                distanceToTarget = Vector3.Distance(transform.position, closestPoint);
            }
            else
            {
                distanceToTarget = Vector3.Distance(transform.position, currentTarget.transform.position);
            }
        }
        else
        {
            // For minions, use center position
            distanceToTarget = Vector3.Distance(transform.position, currentTarget.transform.position);
        }
        
        isInAttackRange = distanceToTarget <= attackRange;

        if (!isInAttackRange && !movementOverride)
        {
            if (movement != null)
            {
                // For buildings, move to the closest point on the navmesh near the building
                if (currentTarget.GetComponent<RecruitmentBuilding>() != null)
                {
                    Vector3 targetPosition = currentTarget.transform.position;
                    Collider buildingCollider = currentTarget.GetComponent<Collider>();
                    if (buildingCollider != null)
                    {
                        // Get a point on the navmesh near the building
                        Vector3 closestPoint = buildingCollider.ClosestPoint(transform.position);
                        targetPosition = closestPoint;
                    }
                    movement.MoveToAttackTarget(targetPosition);
                }
                else
                {
                    movement.MoveToAttackTarget(currentTarget.transform.position);
                }
            }

            if (isAttacking)
            {
                if (attackCoroutine != null)
                {
                    StopCoroutine(attackCoroutine);
                    isAttacking = false;
                }
            }
        }
        else if (!movementOverride)
        {
            if (movement != null)
            {
                movement.StopMoving();
            }

            FaceTarget();

            if (!isAttacking)
            {
                attackCoroutine = StartCoroutine(AttackRoutine());
            }
        }
    }

    public void ForceAttackTarget(Health target)
    {
        if (target == null || !target.IsAlive()) return;

        Team targetTeam = target.GetComponent<Team>();
        if (targetTeam == null || !Team.AreEnemies(myTeam, targetTeam)) return;

        // Check if it's a building and we can attack buildings
        if (target.GetComponent<RecruitmentBuilding>() != null && !canAttackBuildings) return;

        SetMovementOverride(false);
        ClearTarget();
        
        currentTarget = target;
        HighlightTarget(currentTarget.gameObject);

        if (attackCoroutine != null)
        {
            StopCoroutine(attackCoroutine);
            isAttacking = false;
        }

        isInAttackRange = false;
    }

    public void SetTarget(Health newTarget)
    {
        if (newTarget == null || movementOverride || !newTarget.IsAlive()) return;

        Team targetTeam = newTarget.GetComponent<Team>();
        if (targetTeam == null || !Team.AreEnemies(myTeam, targetTeam)) return;

        // Check if it's a building and we can attack buildings
        if (newTarget.GetComponent<RecruitmentBuilding>() != null && !canAttackBuildings) return;

        ClearTarget();
        currentTarget = newTarget;
        HighlightTarget(currentTarget.gameObject);

        if (attackCoroutine != null)
        {
            StopCoroutine(attackCoroutine);
            isAttacking = false;
        }

        isInAttackRange = false;
    }

    public void SetMovementOverride(bool overrideCombat)
    {
        movementOverride = overrideCombat;

        if (movementOverride)
        {
            ClearTarget();
            if (autoAttackCoroutine != null)
            {
                StopCoroutine(autoAttackCoroutine);
                autoAttackCoroutine = null;
            }
        }
    }

    void FindAndSetTarget()
    {
        if (movementOverride) return;

        Collider[] potentialTargets = Physics.OverlapSphere(transform.position, visionRange, enemyLayerMask);

        Health bestTarget = null;
        float closestDistance = Mathf.Infinity;

        foreach (Collider collider in potentialTargets)
        {
            Health potentialTarget = collider.GetComponent<Health>();
            if (potentialTarget == null || !potentialTarget.IsAlive()) continue;

            Team targetTeam = potentialTarget.GetComponent<Team>();
            if (targetTeam == null || !Team.AreEnemies(myTeam, targetTeam)) continue;

            if (potentialTarget.GetComponent<RecruitmentBuilding>() != null && !canAttackBuildings) continue;

            float distance = Vector3.Distance(transform.position, potentialTarget.transform.position);
            if (distance < closestDistance)
            {
                closestDistance = distance;
                bestTarget = potentialTarget;
            }
        }

        if (bestTarget != null)
        {
            SetTarget(bestTarget);
        }
    }

    void HighlightTarget(GameObject target)
    {
        ClearTargetHighlight();

        Renderer[] targetRenderers = target.GetComponentsInChildren<Renderer>();
        foreach (Renderer renderer in targetRenderers)
        {
            if (renderer.gameObject.name.Contains("HealthBar")) continue;

            Material[] originalMats = new Material[renderer.materials.Length];
            for (int i = 0; i < renderer.materials.Length; i++)
            {
                originalMats[i] = renderer.materials[i];
            }

            originalTargetMaterials[renderer] = originalMats;

            if (enemyHighlightMaterial != null)
            {
                Material[] highlightMats = new Material[renderer.materials.Length];
                for (int i = 0; i < highlightMats.Length; i++)
                {
                    highlightMats[i] = enemyHighlightMaterial;
                }
                renderer.materials = highlightMats;
            }
        }
    }

    void ClearTargetHighlight()
    {
        foreach (var kvp in originalTargetMaterials)
        {
            if (kvp.Key != null)
            {
                kvp.Key.materials = kvp.Value;
            }
        }
        originalTargetMaterials.Clear();
    }

    void FaceTarget()
    {
        if (currentTarget == null || movementOverride) return;

        Vector3 direction;
        
        // For buildings, face towards the closest point on the building
        if (currentTarget.GetComponent<RecruitmentBuilding>() != null)
        {
            Collider buildingCollider = currentTarget.GetComponent<Collider>();
            if (buildingCollider != null)
            {
                Vector3 closestPoint = buildingCollider.ClosestPoint(transform.position);
                direction = (closestPoint - transform.position).normalized;
            }
            else
            {
                direction = (currentTarget.transform.position - transform.position).normalized;
            }
        }
        else
        {
            direction = (currentTarget.transform.position - transform.position).normalized;
        }
        
        direction.y = 0;
        if (direction != Vector3.zero)
        {
            transform.rotation = Quaternion.LookRotation(direction);
        }
    }

    IEnumerator AttackRoutine()
    {
        isAttacking = true;

        while (HasTarget() && isInAttackRange && !movementOverride && myHealth.IsAlive())
        {
            if (currentTarget.IsAlive())
            {
                PerformAttack();
                yield return new WaitForSeconds(1f / attackSpeed);
            }
            else
            {
                ClearTarget();
                break;
            }
        }

        isAttacking = false;
    }

    void PerformAttack()
    {
        if (!HasTarget() || movementOverride) return;

        if (attackEffect != null)
        {
            Instantiate(attackEffect, currentTarget.transform.position, Quaternion.identity);
        }

        if (attackSound != null)
        {
            audioSource.PlayOneShot(attackSound);
        }

        currentTarget.TakeDamage(attackDamage, gameObject);
    }

    public void ClearTarget()
    {
        ClearTargetHighlight();

        if (attackCoroutine != null)
        {
            StopCoroutine(attackCoroutine);
            isAttacking = false;
        }

        currentTarget = null;
        isInAttackRange = false;
    }

    public void OnKilledUnit(GameObject killedUnit)
    {
        ClearTarget();
    }

    void OnDestroy()
    {
        ClearTarget();
    }

    void OnDrawGizmosSelected()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);

        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, visionRange);

        if (currentTarget != null)
        {
            Gizmos.color = movementOverride ? Color.blue : Color.red;
            
            // For buildings, draw line to closest point on building
            if (currentTarget.GetComponent<RecruitmentBuilding>() != null)
            {
                Collider buildingCollider = currentTarget.GetComponent<Collider>();
                if (buildingCollider != null)
                {
                    Vector3 closestPoint = buildingCollider.ClosestPoint(transform.position);
                    Gizmos.DrawLine(transform.position, closestPoint);
                }
                else
                {
                    Gizmos.DrawLine(transform.position, currentTarget.transform.position);
                }
            }
            else
            {
                Gizmos.DrawLine(transform.position, currentTarget.transform.position);
            }
        }
    }
}