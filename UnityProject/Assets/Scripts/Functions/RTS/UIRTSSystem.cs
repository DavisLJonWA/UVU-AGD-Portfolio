using UnityEngine;
using UnityEngine.UI;
using System.Collections.Generic;

public class UIRTSSystem : MonoBehaviour
{
    [Header("Selection Settings")]
    [SerializeField] private LayerMask selectableLayer = 1 << 6;
    [SerializeField] private LayerMask groundLayer = 1 << 7;
    [SerializeField] private TeamAffiliation playerTeam = TeamAffiliation.Team1;

    [Header("UI References")]
    [SerializeField] private RectTransform selectionBox;
    [SerializeField] private Canvas canvas;

    [Header("Performance Settings")]
    [SerializeField] private int maxMinionsToProcessPerFrame = 20;

    private List<Minion> selectedMinions = new List<Minion>();
    private Minion[] minionCache;
    private Camera mainCamera;
    private Vector2 selectionStart;
    private bool isSelecting = false;

    void Start()
    {
        mainCamera = Camera.main;
        InitializeUI();
        CacheMinions();
    }

    void InitializeUI()
    {
        if (canvas == null)
        {
            canvas = FindObjectOfType<Canvas>();
            if (canvas == null) CreateCanvas();
        }

        if (selectionBox == null)
        {
            CreateSelectionBox();
        }
        else
        {
            selectionBox.gameObject.SetActive(false);
        }
    }

    void CreateCanvas()
    {
        GameObject canvasObj = new GameObject("SelectionCanvas");
        canvas = canvasObj.AddComponent<Canvas>();
        canvas.renderMode = RenderMode.ScreenSpaceOverlay;
        
        // These components are optional and may not be needed for basic functionality
        // canvasObj.AddComponent<CanvasScaler>();
        // canvasObj.AddComponent<GraphicRaycaster>();
    }

    void CreateSelectionBox()
    {
        if (canvas == null) return;

        GameObject boxObj = new GameObject("SelectionBox");
        boxObj.transform.SetParent(canvas.transform);
        
        selectionBox = boxObj.AddComponent<RectTransform>();
        
        // Add Image component for visual representation
        Image boxImage = boxObj.AddComponent<Image>();
        boxImage.color = new Color(0.2f, 0.4f, 1f, 0.2f);
        
        selectionBox.anchorMin = Vector2.zero;
        selectionBox.anchorMax = Vector2.zero;
        selectionBox.pivot = Vector2.zero;
        selectionBox.gameObject.SetActive(false);
    }

    void Update()
    {
        HandleSelectionInput();
        HandleCommands();

        if (Time.frameCount % 300 == 0)
        {
            CacheMinions();
        }
    }

    void CacheMinions()
    {
        minionCache = FindObjectsOfType<Minion>();
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
            ResetSelectionBox();
        }

        if (!Input.GetKey(KeyCode.LeftShift))
        {
            Minion clickedMinion = GetMinionUnderMouse();
            if (clickedMinion == null)
            {
                ClearSelection();
            }
        }
    }

    void ResetSelectionBox()
    {
        if (selectionBox == null) return;
        selectionBox.anchoredPosition = selectionStart;
        selectionBox.sizeDelta = Vector2.zero;
    }

    void UpdateSelectionBox()
    {
        if (selectionBox == null) return;

        Vector2 currentMousePos = Input.mousePosition;
        Vector2 min = Vector2.Min(selectionStart, currentMousePos);
        Vector2 max = Vector2.Max(selectionStart, currentMousePos);

        selectionBox.anchoredPosition = min;
        selectionBox.sizeDelta = max - min;
    }

    void EndSelection()
    {
        isSelecting = false;

        if (selectionBox != null)
        {
            selectionBox.gameObject.SetActive(false);
        }

        Vector2 selectionEnd = Input.mousePosition;
        float dragDistance = Vector2.Distance(selectionStart, selectionEnd);

        if (dragDistance < 5f)
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
        Minion minion = GetMinionUnderMouse();
        if (minion != null && minion.Team.TeamAffiliation == playerTeam)
        {
            if (!Input.GetKey(KeyCode.LeftShift))
            {
                ClearSelection();
            }
            SelectMinion(minion);
        }
        else if (!Input.GetKey(KeyCode.LeftShift))
        {
            ClearSelection();
        }
    }

    void HandleBoxSelection(Vector2 startScreen, Vector2 endScreen)
    {
        Rect selectionRect = new Rect(
            Mathf.Min(startScreen.x, endScreen.x),
            Mathf.Min(startScreen.y, endScreen.y),
            Mathf.Abs(endScreen.x - startScreen.x),
            Mathf.Abs(endScreen.y - startScreen.y)
        );

        int processedThisFrame = 0;
        foreach (Minion minion in minionCache)
        {
            if (minion == null || minion.Team.TeamAffiliation != playerTeam) continue;

            if (processedThisFrame >= maxMinionsToProcessPerFrame) break;

            if (IsMinionInSelectionRect(minion, selectionRect))
            {
                SelectMinion(minion);
            }

            processedThisFrame++;
        }
    }

    bool IsMinionInSelectionRect(Minion minion, Rect selectionRect)
    {
        Vector3 screenPos = mainCamera.WorldToScreenPoint(minion.transform.position);
        if (screenPos.z <= 0) return false;

        Rect expandedRect = new Rect(
            selectionRect.x - 10f,
            selectionRect.y - 10f,
            selectionRect.width + 20f,
            selectionRect.height + 20f
        );

        return expandedRect.Contains(new Vector2(screenPos.x, screenPos.y));
    }

    Minion GetMinionUnderMouse()
    {
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        if (Physics.Raycast(ray, out RaycastHit hit, Mathf.Infinity, selectableLayer))
        {
            return hit.collider.GetComponent<Minion>();
        }
        return null;
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

    void OnDestroy()
    {
        ClearSelection();
    }
}