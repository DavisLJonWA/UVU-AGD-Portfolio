using UnityEngine;
using UnityEngine.Events;

public class Health : MonoBehaviour
{
    [Header("Health Settings")]
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private float currentHealth;
    [SerializeField] private bool destroyOnDeath = true;
    [SerializeField] private GameObject deathEffect;

    [Header("Events")]
    public UnityEvent onDamageTaken;
    public UnityEvent onHealed;
    public UnityEvent onDeath;
    public UnityEvent<float> onHealthChanged; // Current health as parameter

    private Team teamComponent;

    public float GetHealth() => currentHealth;
    public float GetMaxHealth() => maxHealth;
    public float GetHealthPercentage() => currentHealth / maxHealth;
    public bool IsAlive() => currentHealth > 0;

    void Start()
    {
        currentHealth = maxHealth;
        teamComponent = GetComponent<Team>();
        
        onHealthChanged?.Invoke(currentHealth);
    }

    public void TakeDamage(float damage, GameObject damageSource = null)
    {
        if (!IsAlive()) return;

        // Check if damage source is an enemy (optional team-based damage)
        if (damageSource != null)
        {
            Team sourceTeam = damageSource.GetComponent<Team>();
            if (sourceTeam != null && teamComponent != null)
            {
                if (!Team.AreEnemies(sourceTeam, teamComponent))
                {
                    // Friendly fire disabled or same team - no damage
                    return;
                }
            }
        }

        currentHealth = Mathf.Max(0, currentHealth - damage);
        
        onDamageTaken?.Invoke();
        onHealthChanged?.Invoke(currentHealth);

        Debug.Log($"{gameObject.name} took {damage} damage. Health: {currentHealth}/{maxHealth}");

        if (currentHealth <= 0)
        {
            Die(damageSource);
        }
    }

    public void Heal(float healAmount)
    {
        if (!IsAlive()) return;

        currentHealth = Mathf.Min(maxHealth, currentHealth + healAmount);
        
        onHealed?.Invoke();
        onHealthChanged?.Invoke(currentHealth);

        Debug.Log($"{gameObject.name} healed {healAmount}. Health: {currentHealth}/{maxHealth}");
    }

    public void SetHealth(float newHealth)
    {
        currentHealth = Mathf.Clamp(newHealth, 0, maxHealth);
        onHealthChanged?.Invoke(currentHealth);

        if (currentHealth <= 0)
        {
            Die();
        }
    }

    private void Die(GameObject killer = null)
    {
        Debug.Log($"{gameObject.name} died!");

        // Play death effect
        if (deathEffect != null)
        {
            Instantiate(deathEffect, transform.position, transform.rotation);
        }

        onDeath?.Invoke();

        // Notify killer if it exists and has appropriate component
        if (killer != null)
        {
            // FIX: Use NewCombatSystem instead of UnitCombat
            UnitCombat killerCombat = killer.GetComponent<UnitCombat>();
            if (killerCombat != null)
            {
                // Add the OnKilledUnit method to NewCombatSystem if it doesn't exist
                killerCombat.OnKilledUnit(gameObject);
            }
        }

        // Handle destruction
        if (destroyOnDeath)
        {
            Destroy(gameObject);
        }
        else
        {
            // Disable components instead of destroying
            MonoBehaviour[] components = GetComponents<MonoBehaviour>();
            foreach (MonoBehaviour component in components)
            {
                if (component != this && component.enabled)
                {
                    component.enabled = false;
                }
            }

            Collider collider = GetComponent<Collider>();
            if (collider != null) collider.enabled = false;

            Renderer renderer = GetComponent<Renderer>();
            if (renderer != null) renderer.enabled = false;
        }
    }

    [ContextMenu("Test Take Damage")]
    void TestTakeDamage()
    {
        TakeDamage(10);
    }

    [ContextMenu("Test Heal")]
    void TestHeal()
    {
        Heal(10);
    }

    [ContextMenu("Kill")]
    void TestKill()
    {
        TakeDamage(maxHealth);
    }
}