// Team.cs
using UnityEngine;

public enum TeamAffiliation
{
    Team1,
    Team2,
    Team3,
    Team4,
    Neutral
}

public class Team : MonoBehaviour
{
    [Header("Team Settings")]
    [SerializeField] private TeamAffiliation team = TeamAffiliation.Neutral;
    [SerializeField] private Color teamColor = Color.white;
    [SerializeField] private string teamName = "Unnamed Team";

    public TeamAffiliation GetTeam() => team;
    public Color GetTeamColor() => teamColor;
    public string GetTeamName() => teamName;

    public void SetTeam(TeamAffiliation newTeam) => team = newTeam;
    public void SetTeamColor(Color newColor) => teamColor = newColor;

    public bool IsSameTeam(Team otherTeam)
    {
        if (otherTeam == null) return false;
        return team == otherTeam.team;
    }

    public bool IsEnemy(Team otherTeam)
    {
        if (otherTeam == null) return false;
        return team != otherTeam.team && team != TeamAffiliation.Neutral && otherTeam.team != TeamAffiliation.Neutral;
    }

    public static bool AreEnemies(Team teamA, Team teamB)
    {
        if (teamA == null || teamB == null) return false;
        return teamA.IsEnemy(teamB);
    }
}