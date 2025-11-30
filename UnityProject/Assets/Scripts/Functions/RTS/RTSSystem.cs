using UnityEngine;
using System.Collections.Generic;

public class RTSSystem : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask selectableLayer = 1 << 6;
    [SerializeField] private LayerMask groundLayer = 1 << 7;
    [SerializeField] private TeamAffiliation playerTeam = TeamAffiliation.Team1;

    [Header("UI References")]
    [SerializeField] private RectTransform selectionBox;

    private List<Minion> selectedMinions = new List<Minion>();
    private Camera mainCamera;
    private Vector2 selectionStart;
    private bool isSelecting = false;

    void Start()
    {
        mainCamera = Camera.main;
        
        if (selectionBox != null)
            selectionBox.gameObject.SetActive(false);
    }

    void Update()
    {
        HandleSelectionInput();
        HandleCommands();
    }

    void HandleSelectionInput()
    {
        if (Input.GetMouseButtonDown(0))
        {
            StartSelection();
        }

        if (Input.GetMouseButton(0) && isSelecting)
        {
            UpdateSelectionBox();
        }

        if (Input.GetMouseButtonUp(0) && isSelecting)
        {
            EndSelection();
        }
    }

    void StartSelection()
    {
        selectionStart = Input.mousePosition;
        isSelecting = true;

        if (selectionBox != null)
        {
            selectionBox.gameObject.SetActive(true);
            UpdateSelectionBoxPosition(selectionStart, selectionStart);
        }

        if (!Input.GetKey(KeyCode.LeftShift))
        {
            ClearSelection();
        }
    }

    void UpdateSelectionBox()
    {
        if (selectionBox == null) return;
        UpdateSelectionBoxPosition(selectionStart, Input.mousePosition);
    }

    void UpdateSelectionBoxPosition(Vector2 startPos, Vector2 currentPos)
    {
        float width = currentPos.x - startPos.x;
        float height = currentPos.y - startPos.y;

        selectionBox.anchoredPosition = new Vector2(
            Mathf.Min(startPos.x, currentPos.x),
            Mathf.Min(startPos.y, currentPos.y)
        );

        selectionBox.sizeDelta = new Vector2(Mathf.Abs(width), Mathf.Abs(height));
    }

    void EndSelection()
    {
        isSelecting = false;

        if (selectionBox != null)
            selectionBox.gameObject.SetActive(false);

        Vector2 selectionEnd = Input.mousePosition;

        if (Vector2.Distance(selectionStart, selectionEnd) < 20f)
        {
            HandleSingleClickSelection();
        }
        else
        {
            HandleBoxSelection(selectionStart, selectionEnd);
        }
    }

    void HandleSingleClickSelection()
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, selectableLayer))
        {
            Minion minion = hit.collider.GetComponent<Minion>();
            if (minion != null && minion.Team.TeamAffiliation == playerTeam)
            {
                if (!Input.GetKey(KeyCode.LeftShift))
                    ClearSelection();

                SelectMinion(minion);
            }
        }
        else if (!Input.GetKey(KeyCode.LeftShift))
        {
            ClearSelection();
        }
    }

    void HandleBoxSelection(Vector2 startScreen, Vector2 endScreen)
    {
        Rect selectionRect = GetScreenRect(startScreen, endScreen);
        Minion[] allMinions = FindObjectsOfType<Minion>();

        foreach (Minion minion in allMinions)
        {
            if (minion.Team.TeamAffiliation != playerTeam) continue;

            Vector2 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
            if (selectionRect.Contains(screenPos))
            {
                SelectMinion(minion);
            }
        }
    }

    Rect GetScreenRect(Vector2 screenPosition1, Vector2 screenPosition2)
    {
        screenPosition1.y = Screen.height - screenPosition1.y;
        screenPosition2.y = Screen.height - screenPosition2.y;

        Vector2 topLeft = Vector2.Min(screenPosition1, screenPosition2);
        Vector2 bottomRight = Vector2.Max(screenPosition1, screenPosition2);

        return Rect.MinMaxRect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
    }

    void HandleCommands()
    {
        if (Input.GetMouseButtonDown(1) && selectedMinions.Count > 0)
        {
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, selectableLayer | groundLayer))
            {
                Health enemyHealth = hit.collider.GetComponent<Health>();
                if (enemyHealth != null && enemyHealth.IsAlive)
                {
                    Team enemyTeam = hit.collider.GetComponent<Team>();
                    if (enemyTeam != null && enemyTeam.TeamAffiliation != playerTeam)
                    {
                        // Attack command
                        foreach (Minion minion in selectedMinions)
                        {
                            minion.IssueAttackCommand(enemyHealth);
                        }
                        return;
                    }
                }

                // Move command
                if (UnityEngine.AI.NavMesh.SamplePosition(hit.point, out UnityEngine.AI.NavMeshHit navHit, 1f, UnityEngine.AI.NavMesh.AllAreas))
                {
                    foreach (Minion minion in selectedMinions)
                    {
                        minion.IssueMoveCommand(navHit.position);
                    }
                }
            }
        }
    }

    void SelectMinion(Minion minion)
    {
        if (selectedMinions.Contains(minion)) return;

        selectedMinions.Add(minion);
        minion.Select();
    }

    void ClearSelection()
    {
        foreach (Minion minion in selectedMinions)
        {
            minion.Deselect();
        }
        selectedMinions.Clear();
    }
}