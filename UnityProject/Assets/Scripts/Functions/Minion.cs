using UnityEngine;
using UnityEngine.AI;
using System.Collections;

public class Minion : MonoBehaviour
{
    [Header("Minion Settings")]
    [SerializeField] private float moveSpeed = 3.5f;
    [SerializeField] private GameObject moveMarkerPrefab;
    
    [Header("Selection Visual")]
    [SerializeField] private GameObject selectionIndicator;
    
    private NavMeshAgent agent;
    private Renderer[] minionRenderers;
    private Material[] originalMaterials;
    private GameObject currentMoveMarker;
    private bool isSelected = false;

    void Start()
    {
        agent = GetComponent<NavMeshAgent>();
        minionRenderers = GetComponentsInChildren<Renderer>();
        
        // Store original materials
        originalMaterials = new Material[minionRenderers.Length];
        for (int i = 0; i < minionRenderers.Length; i++)
        {
            originalMaterials[i] = minionRenderers[i].material;
        }

        // Configure agent
        if (agent != null)
        {
            agent.speed = moveSpeed;
            agent.acceleration = 8f;
            agent.angularSpeed = 360f;
            agent.stoppingDistance = 0.5f;
        }

        // Create move marker
        if (moveMarkerPrefab != null)
        {
            currentMoveMarker = Instantiate(moveMarkerPrefab);
            currentMoveMarker.SetActive(false);
        }

        // Setup selection indicator
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }
    }

    public void MoveTo(Vector3 destination)
    {
        if (agent != null && agent.isActiveAndEnabled)
        {
            if (NavMesh.SamplePosition(destination, out NavMeshHit hit, 2f, NavMesh.AllAreas))
            {
                agent.SetDestination(hit.position);
                ShowMoveMarker(hit.position);
            }
        }
    }

    public void OnSelected(Material selectedMat)
    {
        if (isSelected) return;
        
        isSelected = true;
        
        // Apply selection material to all renderers
        for (int i = 0; i < minionRenderers.Length; i++)
        {
            if (minionRenderers[i] != null && selectedMat != null)
            {
                minionRenderers[i].material = selectedMat;
            }
        }

        // Show selection indicator
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(true);
        }

        // Show move marker if active
        if (currentMoveMarker != null && agent.hasPath)
        {
            currentMoveMarker.SetActive(true);
        }
    }

    public void OnDeselected()
    {
        if (!isSelected) return;
        
        isSelected = false;
        
        // Restore original materials
        for (int i = 0; i < minionRenderers.Length; i++)
        {
            if (minionRenderers[i] != null && originalMaterials[i] != null)
            {
                minionRenderers[i].material = originalMaterials[i];
            }
        }

        // Hide selection indicator
        if (selectionIndicator != null)
        {
            selectionIndicator.SetActive(false);
        }

        // Hide move marker
        if (currentMoveMarker != null)
        {
            currentMoveMarker.SetActive(false);
        }
    }

    public void ShowMoveMarker(Vector3 position)
    {
        if (currentMoveMarker != null)
        {
            currentMoveMarker.transform.position = position + Vector3.up * 0.1f;
            currentMoveMarker.SetActive(true);
            
            // Auto-hide if not selected
            if (!isSelected)
            {
                StartCoroutine(HideMarkerAfterDelay(3f));
            }
        }
    }

    private IEnumerator HideMarkerAfterDelay(float delay)
    {
        yield return new WaitForSeconds(delay);
        if (currentMoveMarker != null && !isSelected)
        {
            currentMoveMarker.SetActive(false);
        }
    }

    void Update()
    {
        // Update move marker position if selected and moving
        if (isSelected && currentMoveMarker != null && currentMoveMarker.activeInHierarchy)
        {
            if (agent.hasPath)
            {
                currentMoveMarker.transform.position = agent.destination + Vector3.up * 0.1f;
            }
        }
    }
}