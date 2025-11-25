// EnhancedHealthBar.cs - Replace HealthBar with this
using UnityEngine;
using TMPro;

public class HealthBar : MonoBehaviour
{
    [Header("Health Bar Settings")]
    [SerializeField] private float heightAboveObject = 2.5f;
    [SerializeField] private Vector2 barSize = new Vector2(1.5f, 0.2f);
    [SerializeField] private bool showNumbers = true;
    [SerializeField] private float numberSize = 0.15f;
    [SerializeField] private bool useTeamColor = true;
    [SerializeField] private float zOffset = -0.5f; // Prevent z-fighting with selection
    
    [Header("Visual Settings")]
    [SerializeField] private Material backgroundMaterial;
    [SerializeField] private Material healthMaterial;
    [SerializeField] private Color defaultTeamColor = Color.green;
    
    // Components
    private Transform healthBarParent;
    private Transform healthFill;
    private TextMeshPro healthText;
    private MeshRenderer backgroundRenderer;
    private MeshRenderer healthRenderer;
    
    private Health healthComponent;
    private Team teamComponent;
    private Camera mainCamera;
    private float initialHealthFillScale;
    private Color teamColor;

    void Start()
    {
        healthComponent = GetComponentInParent<Health>();
        teamComponent = GetComponentInParent<Team>();
        mainCamera = Camera.main;

        if (healthComponent == null)
        {
            Debug.LogError("EnhancedHealthBar: No Health component found in parent!");
            return;
        }

        UpdateTeamColor();
        InitializeHealthBar();
        
        // Subscribe to events
        healthComponent.onHealthChanged.AddListener(UpdateHealthBar);
        healthComponent.onDeath.AddListener(OnDeath);

        UpdateHealthBar(healthComponent.GetHealth());
    }

    void InitializeHealthBar()
    {
        // Create health bar parent
        healthBarParent = new GameObject("HealthBar").transform;
        healthBarParent.SetParent(transform);
        healthBarParent.localPosition = Vector3.zero;

        // Create background
        GameObject backgroundObj = GameObject.CreatePrimitive(PrimitiveType.Quad);
        backgroundObj.name = "HealthBarBackground";
        backgroundObj.transform.SetParent(healthBarParent);
        backgroundObj.transform.localPosition = new Vector3(0, 0, zOffset);
        backgroundObj.transform.localRotation = Quaternion.identity;
        backgroundObj.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);
        
        backgroundRenderer = backgroundObj.GetComponent<MeshRenderer>();
        if (backgroundMaterial != null)
        {
            backgroundRenderer.material = backgroundMaterial;
        }
        else
        {
            Material bgMat = new Material(Shader.Find("Standard"));
            bgMat.color = new Color(0.2f, 0.2f, 0.2f, 0.8f);
            backgroundRenderer.material = bgMat;
        }
        Destroy(backgroundObj.GetComponent<Collider>());

        // Create health fill
        GameObject fillObj = GameObject.CreatePrimitive(PrimitiveType.Quad);
        fillObj.name = "HealthBarFill";
        fillObj.transform.SetParent(healthBarParent);
        fillObj.transform.localPosition = new Vector3(0, 0, zOffset - 0.01f); // In front of background
        fillObj.transform.localRotation = Quaternion.identity;
        fillObj.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);
        
        healthFill = fillObj.transform;
        healthRenderer = fillObj.GetComponent<MeshRenderer>();
        
        if (healthMaterial != null)
        {
            healthRenderer.material = healthMaterial;
        }
        
        UpdateHealthColor();
        Destroy(fillObj.GetComponent<Collider>());

        // Create text
        if (showNumbers)
        {
            CreateHealthText();
        }

        initialHealthFillScale = barSize.x;
    }

    void CreateHealthText()
    {
        GameObject textObj = new GameObject("HealthText");
        textObj.transform.SetParent(healthBarParent);
        textObj.transform.localPosition = new Vector3(0, 0, zOffset - 0.02f); // In front of everything
        textObj.transform.localRotation = Quaternion.identity;
        textObj.transform.localScale = Vector3.one * numberSize;

        healthText = textObj.AddComponent<TextMeshPro>();
        healthText.alignment = TextAlignmentOptions.Center;
        healthText.fontSize = 4;
        healthText.color = Color.white;
        healthText.text = "100/100";
        
        // Enhanced visibility
        healthText.outlineWidth = 0.4f;
        healthText.outlineColor = Color.black;
        healthText.fontStyle = FontStyles.Bold;
        
        // Ensure text renders on top
        healthText.sortingOrder = 100;
    }

    void Update()
    {
        // Billboard effect - always face camera
        if (mainCamera != null && healthBarParent != null)
        {
            healthBarParent.rotation = mainCamera.transform.rotation;
            healthBarParent.position = transform.position + Vector3.up * heightAboveObject;
        }
    }

    void UpdateHealthBar(float currentHealth)
    {
        if (healthFill == null) return;

        float healthPercentage = currentHealth / healthComponent.GetMaxHealth();
        
        // Update fill scale
        Vector3 newScale = healthFill.localScale;
        newScale.x = initialHealthFillScale * healthPercentage;
        healthFill.localScale = newScale;

        // Update text
        if (healthText != null)
        {
            healthText.text = $"{Mathf.CeilToInt(currentHealth)}/{Mathf.CeilToInt(healthComponent.GetMaxHealth())}";
        }

        // Update color
        UpdateHealthColor(healthPercentage);
    }

    void UpdateTeamColor()
    {
        if (teamComponent != null)
        {
            teamColor = teamComponent.GetTeamColor();
            Debug.Log($"[HEALTHBAR] {gameObject.name} using team color: {teamColor}");
        }
        else
        {
            teamColor = defaultTeamColor;
            Debug.Log($"[HEALTHBAR] {gameObject.name} using default color");
        }
    }

    void UpdateHealthColor(float healthPercentage = 1f)
    {
        if (healthRenderer == null) return;

        if (useTeamColor)
        {
            // Use team color with health-based brightness
            Color finalColor = teamColor;
            if (healthPercentage < 0.3f)
            {
                finalColor = Color.Lerp(teamColor * 0.5f, teamColor, healthPercentage * 3f);
            }
            healthRenderer.material.color = finalColor;
        }
        else
        {
            // Health-based color transition
            if (healthPercentage > 0.5f)
            {
                float t = (healthPercentage - 0.5f) * 2f;
                healthRenderer.material.color = Color.Lerp(Color.yellow, Color.green, t);
            }
            else
            {
                float t = healthPercentage * 2f;
                healthRenderer.material.color = Color.Lerp(Color.red, Color.yellow, t);
            }
        }
    }

    void OnDeath()
    {
        if (healthBarParent != null)
        {
            healthBarParent.gameObject.SetActive(false);
        }
    }

    void OnDestroy()
    {
        if (healthComponent != null)
        {
            healthComponent.onHealthChanged.RemoveListener(UpdateHealthBar);
            healthComponent.onDeath.RemoveListener(OnDeath);
        }
    }

    [ContextMenu("Debug Health Bar")]
    void DebugHealthBar()
    {
        Debug.Log($"=== HEALTH BAR DEBUG: {gameObject.name} ===");
        Debug.Log($"Team: {(teamComponent != null ? teamComponent.GetTeam().ToString() : "None")}");
        Debug.Log($"Team Color: {teamColor}");
        Debug.Log($"Health: {healthComponent.GetHealth()}/{healthComponent.GetMaxHealth()}");
        Debug.Log($"HealthBar Parent: {healthBarParent != null}");
        Debug.Log($"HealthBar Active: {healthBarParent.gameObject.activeInHierarchy}");
        Debug.Log("=== END DEBUG ===");
    }
}