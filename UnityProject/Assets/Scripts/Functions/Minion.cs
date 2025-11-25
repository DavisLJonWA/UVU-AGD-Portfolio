// Minion.cs (Updated with ShowMoveMarker and ShowAttackMarker)
using UnityEngine;
using System.Collections;

public class Minion : MonoBehaviour
{
    [Header("Minion Components")]
    [SerializeField] private GameObject selectionIndicator;
    
    [Header("Spawn Settings")]
    [SerializeField] private ParticleSystem spawnParticles;
    [SerializeField] private AudioClip spawnSound;
    [SerializeField] private float spawnInvulnerabilityTime = 2f;

    // Component references
    private MinionMovement movement;
    private Health health;
    private UnitCombat combat;
    private Team team;
    private AudioSource audioSource;
    private Renderer[] minionRenderers;

    // State management
    private bool isSelected = false;
    private bool isSpawning = true;
    private bool isInvulnerable = false;
    private Coroutine invulnerabilityCoroutine;

    void Awake()
    {
        movement = GetComponent<MinionMovement>();
        health = GetComponent<Health>();
        combat = GetComponent<UnitCombat>();
        team = GetComponent<Team>();
        audioSource = GetComponent<AudioSource>();
        minionRenderers = GetComponentsInChildren<Renderer>();

        if (audioSource == null)
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.spatialBlend = 1f;
        }
    }

    void Start()
    {
        InitializeSelectionIndicator();
    }

    void InitializeSelectionIndicator()
    {
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }
    }

    public void OnSpawned()
    {
        Debug.Log($"{gameObject.name} spawned successfully for team {team.GetTeam()}");
        
        if (spawnParticles != null)
        {
            spawnParticles.Play();
        }
        
        if (spawnSound != null && audioSource != null)
        {
            audioSource.PlayOneShot(spawnSound);
        }
        
        StartCoroutine(SpawnSequence());
    }

    IEnumerator SpawnSequence()
    {
        isSpawning = true;
        isInvulnerable = true;
        
        // Make invulnerable during spawn
        if (health != null)
        {
            health.enabled = false;
        }

        if (spawnParticles != null)
        {
            yield return new WaitForSeconds(spawnParticles.main.duration * 0.5f);
        }

        // Enable health and components after spawn
        if (health != null)
        {
            health.enabled = true;
        }
        
        isSpawning = false;

        if (spawnInvulnerabilityTime > 0)
        {
            invulnerabilityCoroutine = StartCoroutine(InvulnerabilityPeriod());
        }
    }

    IEnumerator InvulnerabilityPeriod()
    {
        isInvulnerable = true;
        SetInvulnerabilityVisuals(true);
        
        yield return new WaitForSeconds(spawnInvulnerabilityTime);
        
        isInvulnerable = false;
        SetInvulnerabilityVisuals(false);
    }

    void SetInvulnerabilityVisuals(bool invulnerable)
    {
        foreach (Renderer renderer in minionRenderers)
        {
            if (renderer != null)
            {
                Color currentColor = renderer.material.color;
                renderer.material.color = new Color(currentColor.r, currentColor.g, currentColor.b, 
                    invulnerable ? 0.7f : 1f);
            }
        }
    }

    public void OnSelected()
    {
        if (isSelected) return;
        
        isSelected = true;
        
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(true);
        }
        
        Debug.Log($"{gameObject.name} selected");
    }

    public void OnDeselected()
    {
        if (!isSelected) return;
        
        isSelected = false;
        
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }
        
        Debug.Log($"{gameObject.name} deselected");
    }

    // Forward these calls to MinionMovement
    public void ShowMoveMarker(Vector3 position)
    {
        if (movement != null)
        {
            movement.ShowMoveMarker(position);
        }
    }
    
    public void ShowAttackMarker(Vector3 position)
    {
        if (movement != null)
        {
            movement.ShowAttackMarker(position);
        }
    }

    // Public getters
    public bool IsSelected() => isSelected;
    public bool IsSpawning() => isSpawning;
    public bool IsInvulnerable() => isInvulnerable;
    public Team GetTeam() => team;
    public Health GetHealth() => health;

    [ContextMenu("Test Spawn Sequence")]
    void TestSpawnSequence()
    {
        OnSpawned();
    }
}