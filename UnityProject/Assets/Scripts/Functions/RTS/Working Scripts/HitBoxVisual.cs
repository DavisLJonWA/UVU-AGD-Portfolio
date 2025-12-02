using UnityEngine;

public class HitBoxVisual : MonoBehaviour
{
    [Header("Hit Box Visual Settings")]
    [SerializeField] private MeshRenderer meshRenderer;
    [SerializeField] private Material hitBoxMaterial;
    [SerializeField] private Color hitBoxColor = Color.yellow;
    [SerializeField] private float opacity = 0.3f;
    
    void Start()
    {
        if (meshRenderer == null)
            meshRenderer = GetComponent<MeshRenderer>();
            
        SetupHitBoxVisual();
    }
    
    void SetupHitBoxVisual()
    {
        if (meshRenderer != null && hitBoxMaterial != null)
        {
            Material mat = new Material(hitBoxMaterial);
            hitBoxColor.a = opacity;
            mat.color = hitBoxColor;
            meshRenderer.material = mat;
        }
    }
    
    public void SetColor(Color newColor)
    {
        hitBoxColor = newColor;
        if (meshRenderer != null)
        {
            Material mat = meshRenderer.material;
            hitBoxColor.a = opacity;
            mat.color = hitBoxColor;
        }
    }
    
    public void SetOpacity(float newOpacity)
    {
        opacity = Mathf.Clamp01(newOpacity);
        if (meshRenderer != null)
        {
            Material mat = meshRenderer.material;
            hitBoxColor.a = opacity;
            mat.color = hitBoxColor;
        }
    }
}