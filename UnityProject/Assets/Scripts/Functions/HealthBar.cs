using UnityEngine;
using TMPro;

public class HealthBar : MonoBehaviour
{
    [Header("Health Bar Settings")]
    [SerializeField] private float heightAboveObject = 2.5f;
    [SerializeField] private Vector2 barSize = new Vector2(1.5f, 0.2f);
    [SerializeField] private bool showNumbers = true;

    [Header("Colors")]
    [SerializeField] private Color backgroundColor = new Color(0.2f, 0.2f, 0.2f, 0.8f);
    [SerializeField] private Color fullHealthColor = Color.green;
    [SerializeField] private Color lowHealthColor = Color.red;
    [SerializeField] private bool useTeamColor = true;

    // Components
    private GameObject healthBarParent;
    private GameObject healthBackground;
    private GameObject healthFill;
    private TextMeshPro healthText;

    private Health healthComponent;
    private Team teamComponent;
    private Camera mainCamera;
    private float initialHealthFillScale;

    void Start()
    {
        // Check if health bar already exists
        if (transform.Find("HealthBar") != null)
        {
            Debug.LogWarning($"HealthBar already exists on {gameObject.name}, destroying duplicate.");
            Destroy(this);
            return;
        }

        // Find components
        healthComponent = GetComponent<Health>();
        if (healthComponent == null) healthComponent = GetComponentInParent<Health>();
        if (healthComponent == null)
        {
            Debug.LogError($"RobustHealthBar: No Health component found on {gameObject.name}");
            enabled = false;
            return;
        }
        teamComponent = GetComponent<Team>();
        if (teamComponent == null) teamComponent = GetComponentInParent<Team>();
        mainCamera = Camera.main;

        CreateHealthBar();
        
        // Subscribe to events
        healthComponent.onHealthChanged.AddListener(UpdateHealthBar);
        healthComponent.onDeath.AddListener(OnDeath);

        UpdateHealthBar(healthComponent.GetHealth());
    }

    void CreateHealthBar()
    {
        // Create parent object
        healthBarParent = new GameObject("HealthBar");
        healthBarParent.transform.SetParent(transform);
        healthBarParent.transform.localPosition = Vector3.zero;

        // Create background
        healthBackground = GameObject.CreatePrimitive(PrimitiveType.Quad);
        healthBackground.name = "HealthBackground";
        healthBackground.transform.SetParent(healthBarParent.transform);
        healthBackground.transform.localPosition = Vector3.zero;
        healthBackground.transform.localRotation = Quaternion.identity;
        healthBackground.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);

        Renderer bgRenderer = healthBackground.GetComponent<Renderer>();
        bgRenderer.material = CreateSimpleMaterial(backgroundColor);
        Destroy(healthBackground.GetComponent<Collider>());

        // Create health fill
        healthFill = GameObject.CreatePrimitive(PrimitiveType.Quad);
        healthFill.name = "HealthFill";
        healthFill.transform.SetParent(healthBarParent.transform);
        healthFill.transform.localPosition = new Vector3(0, 0, -0.01f);
        healthFill.transform.localRotation = Quaternion.identity;
        healthFill.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);

        Renderer fillRenderer = healthFill.GetComponent<Renderer>();
        fillRenderer.material = CreateSimpleMaterial(fullHealthColor);
        Destroy(healthFill.GetComponent<Collider>());
        initialHealthFillScale = barSize.x;

        // Create text
        if (showNumbers)
        {
            CreateHealthText();
        }
    }

    Material CreateSimpleMaterial(Color color)
    {
        // Use a simple unlit shader that always works
        Shader shader = Shader.Find("Unlit/Color");
        if (shader == null)
        {
            // Fallback to standard shader
            shader = Shader.Find("Standard");
        }

        Material mat = new Material(shader);
        mat.color = color;
        return mat;
    }

    void CreateHealthText()
    {
        GameObject textObj = new GameObject("HealthText");
        textObj.transform.SetParent(healthBarParent.transform);
        textObj.transform.localPosition = new Vector3(0, 0, -0.02f);
        textObj.transform.localRotation = Quaternion.identity;
        textObj.transform.localScale = Vector3.one * 0.15f;

        healthText = textObj.AddComponent<TextMeshPro>();
        healthText.alignment = TextAlignmentOptions.Center;
        healthText.fontSize = 4;
        healthText.color = Color.white;
        healthText.text = "100/100";

        healthText.outlineWidth = 0.3f;
        healthText.outlineColor = Color.black;
        healthText.fontStyle = FontStyles.Bold;
    }

    void LateUpdate()
    {
        // Always face the camera using billboarding
        if (mainCamera != null && healthBarParent != null)
        {
            healthBarParent.transform.rotation = mainCamera.transform.rotation;
            healthBarParent.transform.position = transform.position + Vector3.up * heightAboveObject;
        }
    }

    void UpdateHealthBar(float currentHealth)
    {
        if (healthFill == null) return;

        float healthPercentage = currentHealth / healthComponent.GetMaxHealth();

        // Update fill scale
        Vector3 newScale = healthFill.transform.localScale;
        newScale.x = initialHealthFillScale * healthPercentage;
        healthFill.transform.localScale = newScale;

        // Update text
        if (healthText != null)
        {
            healthText.text = $"{Mathf.CeilToInt(currentHealth)}/{Mathf.CeilToInt(healthComponent.GetMaxHealth())}";
        }

        // Update color
        UpdateHealthColor(healthPercentage);
    }

    void UpdateHealthColor(float healthPercentage)
    {
        if (healthFill == null) return;

        Renderer fillRenderer = healthFill.GetComponent<Renderer>();
        if (fillRenderer == null) return;

        Color targetColor = fullHealthColor;

        if (useTeamColor && teamComponent != null)
        {
            targetColor = teamComponent.GetTeamColor();
        }

        // Blend towards red at low health
        if (healthPercentage < 0.5f)
        {
            float t = healthPercentage * 2f; // 0 to 1 as health goes from 0% to 50%
            targetColor = Color.Lerp(lowHealthColor, targetColor, t);
        }

        fillRenderer.material.color = targetColor;
    }

    void OnDeath()
    {
        if (healthBarParent != null)
        {
            healthBarParent.SetActive(false);
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
}