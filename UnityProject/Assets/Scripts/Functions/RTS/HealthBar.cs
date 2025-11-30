using UnityEngine;
using TMPro;

public class HealthBar : MonoBehaviour
{
    [Header("Health Bar Settings")]
    [SerializeField] private float heightAboveObject = 2f;
    [SerializeField] private Vector2 barSize = new Vector2(1.5f, 0.2f);
    [SerializeField] private bool showNumbers = true;

    [Header("Colors")]
    [SerializeField] private Color healthyColor = Color.green;
    [SerializeField] private Color damagedColor = Color.red;

    private Health health;
    private Team team;
    private Camera mainCamera;
    private GameObject healthBarParent;
    private GameObject healthFill;
    private TextMeshPro healthText;
    private float initialFillScale;

    void Start()
    {
        health = GetComponent<Health>();
        team = GetComponent<Team>();
        mainCamera = Camera.main;

        CreateHealthBar();
        
        health.onHealthChanged.AddListener(UpdateHealthBar);
        health.onDeath.AddListener(OnDeath);
        
        UpdateHealthBar(health.CurrentHealth);
    }

    void CreateHealthBar()
    {
        healthBarParent = new GameObject("HealthBar");
        healthBarParent.transform.SetParent(transform);
        healthBarParent.transform.localPosition = Vector3.zero;

        // Create background
        GameObject background = GameObject.CreatePrimitive(PrimitiveType.Quad);
        background.name = "HealthBackground";
        background.transform.SetParent(healthBarParent.transform);
        background.transform.localPosition = Vector3.zero;
        background.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);
        
        Renderer bgRenderer = background.GetComponent<Renderer>();
        bgRenderer.material.color = Color.gray;
        Destroy(background.GetComponent<Collider>());

        // Create health fill
        healthFill = GameObject.CreatePrimitive(PrimitiveType.Quad);
        healthFill.name = "HealthFill";
        healthFill.transform.SetParent(healthBarParent.transform);
        healthFill.transform.localPosition = new Vector3(0, 0, -0.01f);
        healthFill.transform.localScale = new Vector3(barSize.x, barSize.y, 1f);
        
        Renderer fillRenderer = healthFill.GetComponent<Renderer>();
        fillRenderer.material.color = healthyColor;
        Destroy(healthFill.GetComponent<Collider>());
        
        initialFillScale = barSize.x;

        // Create text
        if (showNumbers)
        {
            CreateHealthText();
        }
    }

    void CreateHealthText()
    {
        GameObject textObj = new GameObject("HealthText");
        textObj.transform.SetParent(healthBarParent.transform);
        textObj.transform.localPosition = new Vector3(0, 0, -0.02f);
        textObj.transform.localScale = Vector3.one * 0.1f;

        healthText = textObj.AddComponent<TextMeshPro>();
        healthText.alignment = TextAlignmentOptions.Center;
        healthText.fontSize = 2;
        healthText.color = Color.white;
    }

    void LateUpdate()
    {
        if (mainCamera != null && healthBarParent != null)
        {
            healthBarParent.transform.rotation = mainCamera.transform.rotation;
            healthBarParent.transform.position = transform.position + Vector3.up * heightAboveObject;
        }
    }

    void UpdateHealthBar(float currentHealth)
    {
        if (healthFill == null) return;

        float healthPercentage = currentHealth / health.MaxHealth;
        
        // Update fill scale
        Vector3 newScale = healthFill.transform.localScale;
        newScale.x = initialFillScale * healthPercentage;
        healthFill.transform.localScale = newScale;

        // Update color
        Renderer fillRenderer = healthFill.GetComponent<Renderer>();
        if (fillRenderer != null)
        {
            fillRenderer.material.color = Color.Lerp(damagedColor, healthyColor, healthPercentage);
        }

        // Update text
        if (healthText != null)
        {
            healthText.text = $"{Mathf.CeilToInt(currentHealth)}/{Mathf.CeilToInt(health.MaxHealth)}";
        }
    }

    void OnDeath()
    {
        if (healthBarParent != null)
            healthBarParent.SetActive(false);
    }

    void OnDestroy()
    {
        if (health != null)
        {
            health.onHealthChanged.RemoveListener(UpdateHealthBar);
            health.onDeath.RemoveListener(OnDeath);
        }
    }
}