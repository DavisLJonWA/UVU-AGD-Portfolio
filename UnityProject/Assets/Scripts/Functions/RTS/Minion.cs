using UnityEngine;

public class Minion : MonoBehaviour
{
    [Header("Components")]
    [SerializeField] private GameObject selectionIndicator;

    private Health health;
    private Team team;
    private CombatSystem combat;
    private MinionMovement movement;
    private bool isSelected = false;

    public Health Health => health;
    public Team Team => team;
    public CombatSystem Combat => combat;
    public MinionMovement Movement => movement;
    public bool IsSelected => isSelected;

    void Awake()
    {
        health = GetComponent<Health>();
        team = GetComponent<Team>();
        combat = GetComponent<CombatSystem>();
        movement = GetComponent<MinionMovement>();
    }

    void Start()
    {
        if (selectionIndicator != null)
            selectionIndicator.SetActive(false);
    }

    public void Select()
    {
        isSelected = true;
        if (selectionIndicator != null)
            selectionIndicator.SetActive(true);
    }

    public void Deselect()
    {
        isSelected = false;
        if (selectionIndicator != null)
            selectionIndicator.SetActive(false);
    }

    public void IssueAttackCommand(Health target)
    {
        if (combat != null)
            combat.AttackTarget(target);
    }

    public void IssueMoveCommand(Vector3 position)
    {
        if (movement != null)
        {
            movement.MoveToPosition(position);
            if (combat != null)
                combat.StopCombat();
        }
    }
}