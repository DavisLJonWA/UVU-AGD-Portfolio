using UnityEngine;
using UnityEngine.Events;

public class Health : MonoBehaviour
{
    [Header("Health Settings")]
    [SerializeField] private float maxHealth = 100f;
    [SerializeField] private bool destroyOnDeath = true;
    [SerializeField] private GameObject deathEffect;

    [Header("Events")]
    public UnityEvent onDamageTaken;
    public UnityEvent onHealed;
    public UnityEvent onDeath;
    public UnityEvent<float> onHealthChanged;

    private float currentHealth;
    private CombatSystem combatSystem;

    public float CurrentHealth => currentHealth;
    public float MaxHealth => maxHealth;
    public float HealthPercentage => currentHealth / maxHealth;
    public bool IsAlive => currentHealth > 0;
    public CombatSystem CombatSystem => combatSystem;

    void Awake()
    {
        combatSystem = GetComponent<CombatSystem>();
        currentHealth = maxHealth;
    }

    public void TakeDamage(float damage, GameObject damageSource = null)
    {
        if (!IsAlive) return;

        currentHealth = Mathf.Max(0, currentHealth - damage);
        onDamageTaken?.Invoke();
        onHealthChanged?.Invoke(currentHealth);

        if (currentHealth <= 0)
        {
            Die(damageSource);
        }
    }

    public void Heal(float healAmount)
    {
        if (!IsAlive) return;

        currentHealth = Mathf.Min(maxHealth, currentHealth + healAmount);
        onHealed?.Invoke();
        onHealthChanged?.Invoke(currentHealth);
    }

    void Die(GameObject killer = null)
    {
        onDeath?.Invoke();

        if (deathEffect != null)
        {
            Instantiate(deathEffect, transform.position, Quaternion.identity);
        }

        CombatSystem combat = GetComponent<CombatSystem>();
        if (combat != null)
            combat.StopCombat();

        if (destroyOnDeath)
        {
            Destroy(gameObject);
        }
        else
        {
            gameObject.SetActive(false);
        }
    }
}