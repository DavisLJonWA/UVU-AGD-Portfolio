using UnityEngine;
using System.Collections.Generic;

public class AIManager : MonoBehaviour
{
    [Header("AI Management")]
    [SerializeField] private bool enableAllAIOnStart = false;
    [SerializeField] private KeyCode toggleAllAIKey = KeyCode.F8;

    private List<AIController> aiControllers = new List<AIController>();
    private bool allAIActive = false;

    void Start()
    {
        FindAIControllers();
        
        allAIActive = enableAllAIOnStart;
        SetAllAIState(allAIActive);
        
        Debug.Log($"AI Manager initialized. Found {aiControllers.Count} AI controllers. Press {toggleAllAIKey} to toggle all AI.");
    }

    void Update()
    {
        if (Input.GetKeyDown(toggleAllAIKey))
        {
            ToggleAllAI();
        }
    }

    void FindAIControllers()
    {
        AIController[] foundControllers = FindObjectsOfType<AIController>();
        aiControllers.Clear();
        aiControllers.AddRange(foundControllers);
    }

    void ToggleAllAI()
    {
        allAIActive = !allAIActive;
        SetAllAIState(allAIActive);
        Debug.Log($"All AI controllers are now {(allAIActive ? "ACTIVE" : "INACTIVE")}");
    }

    void SetAllAIState(bool active)
    {
        foreach (AIController ai in aiControllers)
        {
            if (ai != null)
            {
                ai.gameObject.SetActive(active);
            }
        }
    }

    public void SetTeamAIState(TeamAffiliation team, bool active)
    {
        foreach (AIController ai in aiControllers)
        {
            if (ai != null && ai.ControlledTeam == team)
            {
                ai.gameObject.SetActive(active);
                break;
            }
        }
    }

    public bool IsTeamAIActive(TeamAffiliation team)
    {
        foreach (AIController ai in aiControllers)
        {
            if (ai != null && ai.ControlledTeam == team)
            {
                return ai.gameObject.activeInHierarchy;
            }
        }
        return false;
    }

    [ContextMenu("Print AI Status")]
    public void PrintAIStatus()
    {
        Debug.Log("=== AI STATUS ===");
        foreach (AIController ai in aiControllers)
        {
            if (ai != null)
            {
                Debug.Log($"{ai.ControlledTeam}: {(ai.gameObject.activeInHierarchy ? "ACTIVE" : "INACTIVE")}");
            }
        }
        Debug.Log("================");
    }

    [ContextMenu("Refresh AI Controllers")]
    public void RefreshAIControllers()
    {
        FindAIControllers();
        Debug.Log($"Refreshed AI controllers. Found {aiControllers.Count} controllers.");
    }
}