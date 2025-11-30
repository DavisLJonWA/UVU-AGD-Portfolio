using UnityEngine;
using System.Collections;

public class CombatSystem : MonoBehaviour
{
    [Header("Combat Stats")]
    [SerializeField] private float attackDamage = 10f;
    [SerializeField] private float attackSpeed = 1f;
    [SerializeField] private float attackRange = 2f;
    [SerializeField] private float armor = 0f;

    [Header("Visual Feedback")]
    [SerializeField] private GameObject attackEffect;
    [SerializeField] private Color enemyHighlightColor = Color.red;
    [SerializeField] private float highlightDuration = 0.5f;

    private Health health;
    private Team team;
    private MinionMovement movement;
    private Health currentTarget;
    private bool isAttacking = false;
    private Coroutine attackCoroutine;
    private Coroutine highlightCoroutine;

    public Health CurrentTarget => currentTarget;
    public bool HasTarget => currentTarget != null && currentTarget.IsAlive;
    public bool IsAttacking => isAttacking;
    public float AttackRange => attackRange;
    public float Armor => armor;

    void Awake()
    {
        health = GetComponent<Health>();
        team = GetComponent<Team>();
        movement = GetComponent<MinionMovement>();
    }

    public void AttackTarget(Health target)
    {
        if (target == null || !target.IsAlive || target.GetComponent<Team>()?.TeamAffiliation == team.TeamAffiliation)
            return;

        StopCombat();
        currentTarget = target;
        
        HighlightTarget();
        StartAttackRoutine();
    }

    public void StopCombat()
    {
        currentTarget = null;
        isAttacking = false;
        
        if (attackCoroutine != null)
        {
            StopCoroutine(attackCoroutine);
            attackCoroutine = null;
        }
    }

    void StartAttackRoutine()
    {
        if (attackCoroutine != null)
            StopCoroutine(attackCoroutine);

        attackCoroutine = StartCoroutine(AttackRoutine());
    }

    IEnumerator AttackRoutine()
    {
        isAttacking = true;

        while (HasTarget && health.IsAlive)
        {
            float distance = Vector3.Distance(transform.position, currentTarget.transform.position);
            
            if (distance <= attackRange)
            {
                movement.StopMoving();
                FaceTarget();
                PerformAttack();
                yield return new WaitForSeconds(1f / attackSpeed);
            }
            else
            {
                movement.MoveToPosition(currentTarget.transform.position);
                yield return new WaitForSeconds(0.1f);
            }
        }

        isAttacking = false;
        currentTarget = null;
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

    void PerformAttack()
    {
        if (!HasTarget) return;

        if (attackEffect != null)
        {
            Instantiate(attackEffect, currentTarget.transform.position, Quaternion.identity);
        }

        float finalDamage = attackDamage - currentTarget.CombatSystem.Armor;
        currentTarget.TakeDamage(Mathf.Max(1f, finalDamage), gameObject);
    }

    void HighlightTarget()
    {
        if (highlightCoroutine != null)
            StopCoroutine(highlightCoroutine);

        highlightCoroutine = StartCoroutine(HighlightRoutine());
    }

    IEnumerator HighlightRoutine()
    {
        Renderer targetRenderer = currentTarget.GetComponent<Renderer>();
        if (targetRenderer == null) yield break;

        Material originalMaterial = targetRenderer.material;
        Color originalColor = originalMaterial.color;
        
        targetRenderer.material.color = enemyHighlightColor;
        yield return new WaitForSeconds(highlightDuration);
        
        if (targetRenderer != null)
            targetRenderer.material.color = originalColor;
    }

    void OnDestroy()
    {
        StopCombat();
        if (highlightCoroutine != null)
            StopCoroutine(highlightCoroutine);
    }
}