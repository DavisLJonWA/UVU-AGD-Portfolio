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
    [SerializeField] private TeamAffiliation teamAffiliation = TeamAffiliation.Neutral;
    [SerializeField] private Color teamColor = Color.white;

    public TeamAffiliation TeamAffiliation => teamAffiliation;
    public Color TeamColor => teamColor;

    public void SetTeam(TeamAffiliation newTeam) => teamAffiliation = newTeam;
    public void SetTeamColor(Color newColor) => teamColor = newColor;
}