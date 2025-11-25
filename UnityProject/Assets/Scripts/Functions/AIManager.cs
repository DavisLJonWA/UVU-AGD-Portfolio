using UnityEngine;
using System.Collections.Generic;

public class AIManager : MonoBehaviour
{
    [Header("AI Management")]
    [SerializeField] private bool enableAllAIOnStart = false;
    [SerializeField] private KeyCode toggleAllAIKey = KeyCode.F8;
    
    private List<AIController> allAIControllers = new List<AIController>();
    private bool allAIActive = false;

    void Start()
    {
        // Find all AI controllers in the scene
        AIController[] foundAIs = FindObjectsOfType<AIController>();
        allAIControllers.AddRange(foundAIs);
        
        allAIActive = enableAllAIOnStart;
        
        // Set initial state
        foreach (AIController ai in allAIControllers)
        {
            ai.SetActive(allAIActive);
        }
        
        Debug.Log($"AI Manager initialized. Found {allAIControllers.Count} AI controllers. Press {toggleAllAIKey} to toggle all AI.");
    }

    void Update()
    {
        if (Input.GetKeyDown(toggleAllAIKey))
        {
            ToggleAllAI();
        }
    }

    void ToggleAllAI()
    {
        allAIActive = !allAIActive;
        
        foreach (AIController ai in allAIControllers)
        {
            ai.SetActive(allAIActive);
        }
        
        Debug.Log($"All AI controllers are now {(allAIActive ? "ACTIVE" : "INACTIVE")}");
    }

    // Public methods to control specific AI teams
    public void SetAIActive(TeamAffiliation team, bool active)
    {
        foreach (AIController ai in allAIControllers)
        {
            if (ai.GetControlledTeam() == team)
            {
                ai.SetActive(active);
                break;
            }
        }
    }

    public bool IsAIActive(TeamAffiliation team)
    {
        foreach (AIController ai in allAIControllers)
        {
            if (ai.GetControlledTeam() == team)
            {
                return ai.IsActive();
            }
        }
        return false;
    }

    [ContextMenu("Print AI Status")]
    public void PrintAIStatus()
    {
        Debug.Log("=== AI STATUS ===");
        foreach (AIController ai in allAIControllers)
        {
            Debug.Log($"{ai.GetControlledTeam()}: {(ai.IsActive() ? "ACTIVE" : "INACTIVE")}");
        }
        Debug.Log("=================");
    }

    [ContextMenu("Force All AI to Attack")]
    public void ForceAllAIAttack()
    {
        foreach (AIController ai in allAIControllers)
        {
            if (ai.IsActive())
            {
                ai.ForceAttack();
            }
        }
    }
}