using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class HealthBar : MonoBehaviour
{
    [Header("Health Bar Settings")]
    [SerializeField] private Slider healthSlider;
    [SerializeField] private Image fillImage;
    [SerializeField] private TextMeshProUGUI healthText;
    [SerializeField] private Vector3 offset = new Vector3(0, 2f, 0);
    [SerializeField] private Gradient healthGradient;
    
    private Camera mainCamera;
    private float maxHealth = 100f;
    
    void Start()
    {
        mainCamera = Camera.main;
        
        if (healthSlider == null)
            healthSlider = GetComponentInChildren<Slider>();
            
        if (fillImage == null && healthSlider != null)
            fillImage = healthSlider.fillRect.GetComponent<Image>();
            
        UpdateHealthBar();
    }
    
    void Update()
    {
        // Face the main camera (billboard effect)
        if (mainCamera != null)
        {
            transform.LookAt(transform.position + mainCamera.transform.rotation * Vector3.forward,
                            mainCamera.transform.rotation * Vector3.up);
        }
        
        // Follow the parent unit with offset
        if (transform.parent != null)
        {
            transform.position = transform.parent.position + offset;
        }
    }
    
    public void SetMaxHealth(float max)
    {
        maxHealth = max;
        
        if (healthSlider != null)
        {
            healthSlider.maxValue = maxHealth;
            healthSlider.value = maxHealth;
        }
        
        UpdateHealthBar();
    }
    
    public void SetHealth(float health)
    {
        if (healthSlider != null)
        {
            healthSlider.value = health;
        }
        
        UpdateHealthBar();
    }
    
    void UpdateHealthBar()
    {
        if (healthSlider != null && fillImage != null)
        {
            // Update color based on health percentage
            float healthPercent = healthSlider.value / maxHealth;
            fillImage.color = healthGradient.Evaluate(healthPercent);
            
            // Update text if available
            if (healthText != null)
            {
                healthText.text = $"{healthSlider.value:F0}/{maxHealth:F0}";
            }
        }
    }
    
    public void SetOffset(Vector3 newOffset)
    {
        offset = newOffset;
    }
}