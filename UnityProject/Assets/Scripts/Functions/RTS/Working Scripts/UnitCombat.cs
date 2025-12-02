using UnityEngine;
using TMPro;
using System.Collections.Generic;

public enum Team
{
    Player,
    Team2,
    Team3,
    Team4
}

public class UnitCombat : MonoBehaviour
{
    [Header("Combat Settings")]
    [SerializeField] private Team team = Team.Player;
    [SerializeField] private float attackDamage = 10f;
    [SerializeField] private float attackSpeed = 1f; // Attacks per second
    [SerializeField] private float attackRange = 3f;
    [SerializeField] private float maxHealth = 100f;
    
    [Header("Visualization Settings")]
    [SerializeField] private bool showAttackRange = false;
    [SerializeField] private bool showHitBox = false;
    [SerializeField] private GameObject healthBarPrefab;
    [SerializeField] private GameObject hitBoxVisualPrefab;
    [SerializeField] private GameObject attackRangeVisualPrefab;
    
    [Header("Debug Info")]
    [SerializeField] private float currentHealth;
    [SerializeField] private UnitCombat currentTarget;
    [SerializeField] private float attackCooldown = 0f;
    
    // Components
    private HealthBar healthBar;
    private GameObject hitBoxVisual;
    private GameObject attackRangeVisual;
    private SphereCollider hitSphereCollider;
    
    void Start()
    {
        InitializeCombat();
    }
    
    void InitializeCombat()
    {
        currentHealth = maxHealth;
        
        // Create health bar
        if (healthBarPrefab != null)
        {
            GameObject healthBarObj = Instantiate(healthBarPrefab, transform);
            healthBar = healthBarObj.GetComponent<HealthBar>();
            if (healthBar != null)
            {
                healthBar.SetMaxHealth(maxHealth);
            }
        }
        
        // Setup hit box
        SetupHitBox();
        
        // Setup attack range visual
        SetupAttackRangeVisual();
        
        // Add sphere collider for attack detection
        hitSphereCollider = gameObject.AddComponent<SphereCollider>();
        hitSphereCollider.radius = 0.5f; // Default hit box radius
        hitSphereCollider.isTrigger = true;
    }
    
    void SetupHitBox()
    {
        if (hitBoxVisualPrefab != null && showHitBox)
        {
            hitBoxVisual = Instantiate(hitBoxVisualPrefab, transform);
            hitBoxVisual.transform.localScale = Vector3.one * 1f; // Adjust as needed
        }
    }
    
    void SetupAttackRangeVisual()
    {
        if (attackRangeVisualPrefab != null && showAttackRange)
        {
            attackRangeVisual = Instantiate(attackRangeVisualPrefab, transform);
            attackRangeVisual.transform.localScale = Vector3.one * attackRange * 2f;
        }
    }
    
    void Update()
    {
        UpdateCombat();
        UpdateVisuals();
    }
    
    void UpdateCombat()
    {
        if (attackCooldown > 0)
        {
            attackCooldown -= Time.deltaTime;
        }
        
        // Find and attack target
        if (currentTarget == null || !IsTargetInRange(currentTarget))
        {
            FindNearestEnemy();
        }
        
        if (currentTarget != null && attackCooldown <= 0)
        {
            AttackTarget(currentTarget);
            attackCooldown = 1f / attackSpeed;
        }
    }
    
    void UpdateVisuals()
    {
        // Update health bar
        if (healthBar != null)
        {
            healthBar.SetHealth(currentHealth);
        }
        
        // Toggle attack range visual
        if (attackRangeVisual != null)
        {
            attackRangeVisual.SetActive(showAttackRange);
        }
        
        // Toggle hit box visual
        if (hitBoxVisual != null)
        {
            hitBoxVisual.SetActive(showHitBox);
        }
    }
    
    void FindNearestEnemy()
    {
        float closestDistance = Mathf.Infinity;
        UnitCombat closestEnemy = null;
        
        UnitCombat[] allUnits = FindObjectsOfType<UnitCombat>();
        
        foreach (UnitCombat unit in allUnits)
        {
            if (unit.team != this.team && unit.currentHealth > 0)
            {
                float distance = Vector3.Distance(transform.position, unit.transform.position);
                if (distance < closestDistance && distance <= attackRange)
                {
                    closestDistance = distance;
                    closestEnemy = unit;
                }
            }
        }
        
        currentTarget = closestEnemy;
    }
    
    bool IsTargetInRange(UnitCombat target)
    {
        if (target == null) return false;
        float distance = Vector3.Distance(transform.position, target.transform.position);
        return distance <= attackRange;
    }
    
    void AttackTarget(UnitCombat target)
    {
        if (target != null && target.currentHealth > 0)
        {
            target.TakeDamage(attackDamage);
            Debug.Log($"{name} attacked {target.name} for {attackDamage} damage");
        }
    }
    
    public void TakeDamage(float damage)
    {
        currentHealth -= damage;
        
        if (currentHealth <= 0)
        {
            Die();
        }
    }
    
    void Die()
    {
        Debug.Log($"{name} died");
        
        // Destroy health bar
        if (healthBar != null)
        {
            Destroy(healthBar.gameObject);
        }
        
        // Destroy visuals
        if (hitBoxVisual != null)
        {
            Destroy(hitBoxVisual);
        }
        
        if (attackRangeVisual != null)
        {
            Destroy(attackRangeVisual);
        }
        
        // Destroy the unit
        Destroy(gameObject, 0.1f);
    }
    
    // Public methods for UI and AI
    public Team GetTeam() => team;
    public float GetHealth() => currentHealth;
    public float GetMaxHealth() => maxHealth;
    public float GetAttackRange() => attackRange;
    public bool IsAlive() => currentHealth > 0;
    
    // Toggle methods for debug
    public void ToggleAttackRange(bool show)
    {
        showAttackRange = show;
    }
    
    public void ToggleHitBox(bool show)
    {
        showHitBox = show;
    }
    
    // Draw attack range in editor
    void OnDrawGizmosSelected()
    {
        if (showAttackRange)
        {
            Gizmos.color = Color.red;
            Gizmos.DrawWireSphere(transform.position, attackRange);
        }
        
        if (showHitBox)
        {
            Gizmos.color = Color.yellow;
            Gizmos.DrawWireSphere(transform.position, 0.5f);
        }
    }
}