// NewCombatSystem.cs - Replace UnitCombat with this
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
    [SerializeField] private LayerMask enemyLayerMask = -1; // All layers by default
    [SerializeField] private bool canAttackBuildings = true;
    [SerializeField] private bool autoAcquireTargets = true;

    [Header("Visual Feedback")]
    [SerializeField] private GameObject attackEffect;
    [SerializeField] private AudioClip attackSound;
    [SerializeField] private Material enemyHighlightMaterial;
    [SerializeField] private Color enemyHighlightColor = Color.red;

    // Components
    private Health myHealth;
    private Team myTeam;
    private MinionMovement movement;
    private AudioSource audioSource;
    
    // Combat state
    private Health currentTarget;
    private bool isAttacking = false;
    private Coroutine attackCoroutine;
    
    // Highlighting
    private Dictionary<Renderer, Material[]> originalTargetMaterials = new Dictionary<Renderer, Material[]>();
    
    // Debug
    private bool debugCombat = true;

    public Health GetTarget() => currentTarget;
    public bool HasTarget() => currentTarget != null && currentTarget.IsAlive();
    public float GetAttackRange() => attackRange;

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

        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} initialized - Team: {myTeam.GetTeam()}");
    }

    void Update()
    {
        if (!myHealth.IsAlive()) return;

        if (autoAcquireTargets && !HasTarget())
        {
            FindAndSetTarget();
        }

        if (HasTarget())
        {
            HandleCombatState();
        }
    }

    void HandleCombatState()
    {
        // Check target validity
        if (!currentTarget.IsAlive())
        {
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} target died");
            ClearTarget();
            return;
        }

        float distanceToTarget = Vector3.Distance(transform.position, currentTarget.transform.position);
        
        if (distanceToTarget > attackRange)
        {
            // Move toward target
            if (movement != null)
            {
                movement.MoveTo(currentTarget.transform.position);
            }
            
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} moving to target - Distance: {distanceToTarget}");
        }
        else
        {
            // In range - stop moving and attack
            if (movement != null)
            {
                movement.StopMoving();
            }
            
            FaceTarget();
            
            if (!isAttacking)
            {
                attackCoroutine = StartCoroutine(AttackRoutine());
            }
            
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} in attack range - Attacking");
        }
    }

    public void SetTarget(Health newTarget)
    {
        if (newTarget == null)
        {
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} cannot set null target");
            return;
        }

        if (!newTarget.IsAlive())
        {
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} cannot set dead target: {newTarget.gameObject.name}");
            return;
        }

        // Check if target is enemy
        Team targetTeam = newTarget.GetComponent<Team>();
        if (targetTeam == null)
        {
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} target has no Team component: {newTarget.gameObject.name}");
            return;
        }

        if (!Team.AreEnemies(myTeam, targetTeam))
        {
            if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} cannot attack {newTarget.gameObject.name} - not enemy team");
            return;
        }

        // Clear previous target
        ClearTarget();

        // Set new target
        currentTarget = newTarget;
        HighlightTarget(currentTarget.gameObject);

        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} acquired target: {currentTarget.gameObject.name} (Team: {targetTeam.GetTeam()})");

        // Stop any current attack
        if (attackCoroutine != null)
        {
            StopCoroutine(attackCoroutine);
            isAttacking = false;
        }
    }

    void FindAndSetTarget()
    {
        Collider[] potentialTargets = Physics.OverlapSphere(transform.position, visionRange, enemyLayerMask);
        
        Health bestTarget = null;
        float closestDistance = Mathf.Infinity;

        foreach (Collider collider in potentialTargets)
        {
            Health potentialTarget = collider.GetComponent<Health>();
            if (potentialTarget == null || !potentialTarget.IsAlive()) continue;

            Team targetTeam = potentialTarget.GetComponent<Team>();
            if (targetTeam == null || !Team.AreEnemies(myTeam, targetTeam)) continue;

            // Check if it's a building and we can attack buildings
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
            // Skip health bar renderers
            if (renderer.gameObject.name.Contains("HealthBar")) continue;

            Material[] originalMats = new Material[renderer.materials.Length];
            for (int i = 0; i < renderer.materials.Length; i++)
            {
                originalMats[i] = renderer.materials[i];
            }
            
            originalTargetMaterials[renderer] = originalMats;

            // Apply highlight
            Material[] highlightMats = new Material[renderer.materials.Length];
            for (int i = 0; i < highlightMats.Length; i++)
            {
                if (enemyHighlightMaterial != null)
                {
                    highlightMats[i] = enemyHighlightMaterial;
                }
                else
                {
                    // Create temporary highlight material
                    Material highlightMat = new Material(Shader.Find("Standard"));
                    highlightMat.color = enemyHighlightColor;
                    highlightMats[i] = highlightMat;
                }
            }
            
            renderer.materials = highlightMats;
        }

        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} highlighted target: {target.name}");
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
        if (currentTarget == null) return;
        
        Vector3 direction = (currentTarget.transform.position - transform.position).normalized;
        direction.y = 0;
        if (direction != Vector3.zero)
        {
            transform.rotation = Quaternion.LookRotation(direction);
        }
    }

    IEnumerator AttackRoutine()
    {
        isAttacking = true;
        
        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} started attack routine");

        while (HasTarget() && !IsTargetOutOfRange())
        {
            PerformAttack();
            yield return new WaitForSeconds(1f / attackSpeed);
        }

        isAttacking = false;
        
        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} ended attack routine");
    }

    void PerformAttack()
    {
        if (!HasTarget()) return;

        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} attacking {currentTarget.gameObject.name} for {attackDamage} damage");

        // Visual effects
        if (attackEffect != null)
        {
            Instantiate(attackEffect, currentTarget.transform.position, Quaternion.identity);
        }

        // Sound effects
        if (attackSound != null)
        {
            audioSource.PlayOneShot(attackSound);
        }

        // Apply damage
        currentTarget.TakeDamage(attackDamage, gameObject);
    }

    bool IsTargetOutOfRange()
    {
        if (currentTarget == null) return true;
        float distance = Vector3.Distance(transform.position, currentTarget.transform.position);
        return distance > attackRange;
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
        
        if (debugCombat) Debug.Log($"[COMBAT] {gameObject.name} cleared target");
    }

    void OnDestroy()
    {
        ClearTarget();
    }

    [ContextMenu("Debug Combat Status")]
    void DebugCombatStatus()
    {
        Debug.Log($"=== COMBAT DEBUG: {gameObject.name} ===");
        Debug.Log($"Alive: {myHealth.IsAlive()}");
        Debug.Log($"Has Target: {HasTarget()}");
        Debug.Log($"Target: {(currentTarget != null ? currentTarget.gameObject.name : "None")}");
        Debug.Log($"Is Attacking: {isAttacking}");
        Debug.Log($"Attack Range: {attackRange}");
        Debug.Log($"Team: {myTeam.GetTeam()}");
        
        if (currentTarget != null)
        {
            Team targetTeam = currentTarget.GetComponent<Team>();
            Debug.Log($"Target Team: {(targetTeam != null ? targetTeam.GetTeam().ToString() : "No Team")}");
            Debug.Log($"Distance: {Vector3.Distance(transform.position, currentTarget.transform.position)}");
            Debug.Log($"In Range: {!IsTargetOutOfRange()}");
        }
        
        Debug.Log($"=== END COMBAT DEBUG ===");
    }

    void OnDrawGizmosSelected()
    {
        // Attack range
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(transform.position, attackRange);
        
        // Vision range
        Gizmos.color = Color.yellow;
        Gizmos.DrawWireSphere(transform.position, visionRange);
        
        // Line to target
        if (currentTarget != null)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawLine(transform.position, currentTarget.transform.position);
        }
    }
}