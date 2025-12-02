using UnityEngine;
using System.Collections.Generic;

public class CombatManager : MonoBehaviour
{
    public static CombatManager Instance { get; private set; }
    
    [Header("Combat Settings")]
    [SerializeField] private bool showAllHitBoxes = false;
    [SerializeField] private bool showAllAttackRanges = false;
    
    [Header("Team Colors")]
    [SerializeField] private Color playerColor = Color.blue;
    [SerializeField] private Color team2Color = Color.red;
    [SerializeField] private Color team3Color = Color.green;
    [SerializeField] private Color team4Color = Color.yellow;
    
    private List<UnitCombat> allUnits = new List<UnitCombat>();
    
    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
            DontDestroyOnLoad(gameObject);
        }
        else
        {
            Destroy(gameObject);
        }
    }
    
    void Start()
    {
        FindAllUnits();
    }
    
    void Update()
    {
        // Optional: Update unit list periodically
        if (Time.frameCount % 60 == 0) // Every 60 frames
        {
            FindAllUnits();
        }
    }
    
    void FindAllUnits()
    {
        allUnits.Clear();
        allUnits.AddRange(FindObjectsOfType<UnitCombat>());
    }
    
    public List<UnitCombat> GetUnitsByTeam(Team team)
    {
        List<UnitCombat> teamUnits = new List<UnitCombat>();
        
        foreach (UnitCombat unit in allUnits)
        {
            if (unit.GetTeam() == team && unit.IsAlive())
            {
                teamUnits.Add(unit);
            }
        }
        
        return teamUnits;
    }
    
    public UnitCombat GetNearestEnemy(Vector3 position, Team myTeam)
    {
        UnitCombat nearestEnemy = null;
        float closestDistance = Mathf.Infinity;
        
        foreach (UnitCombat unit in allUnits)
        {
            if (unit.GetTeam() != myTeam && unit.IsAlive())
            {
                float distance = Vector3.Distance(position, unit.transform.position);
                if (distance < closestDistance)
                {
                    closestDistance = distance;
                    nearestEnemy = unit;
                }
            }
        }
        
        return nearestEnemy;
    }
    
    public void ToggleAllHitBoxes(bool show)
    {
        showAllHitBoxes = show;
        
        foreach (UnitCombat unit in allUnits)
        {
            unit.ToggleHitBox(show);
        }
    }
    
    public void ToggleAllAttackRanges(bool show)
    {
        showAllAttackRanges = show;
        
        foreach (UnitCombat unit in allUnits)
        {
            unit.ToggleAttackRange(show);
        }
    }
    
    public Color GetTeamColor(Team team)
    {
        switch (team)
        {
            case Team.Player: return playerColor;
            case Team.Team2: return team2Color;
            case Team.Team3: return team3Color;
            case Team.Team4: return team4Color;
            default: return Color.white;
        }
    }
}