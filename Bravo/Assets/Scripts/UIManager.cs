using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Ink.Runtime;

public class UIManager : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private Button[] choiceButtons;
    [SerializeField] private Button nextButton; // The "Next" button
    [SerializeField] private ScrollRect dialogueScrollRect; // Reference to the Scroll Rect

    [Header("Player Stats UI")]
    [SerializeField] private TextMeshProUGUI playerName_disp;
    [SerializeField] private TextMeshProUGUI level_disp;
    [SerializeField] private TextMeshProUGUI health_disp;
    [SerializeField] private TextMeshProUGUI xp_disp;
    // **NEW: Location Text**
    [SerializeField] private TextMeshProUGUI locationText; // Reference to the location text object
    // **NEW: Trait Texts**
    [SerializeField] private TextMeshProUGUI honesty_disp;
    [SerializeField] private TextMeshProUGUI deception_disp;
    [SerializeField] private TextMeshProUGUI courage_disp;
    [SerializeField] private TextMeshProUGUI caution_disp;
    [SerializeField] private TextMeshProUGUI compassion_disp;
    [SerializeField] private TextMeshProUGUI insensitivity_disp;
    [SerializeField] private TextMeshProUGUI matrixAwareness_disp;
    // **NEW: Honor and Greed Texts**
    [SerializeField] private TextMeshProUGUI honor_disp;
    [SerializeField] private TextMeshProUGUI greed_disp;

    private void OnEnable()
    {
        // Subscribe to dialogue events
        GameEventsManager.instance.dialogueEvents.OnDisplayDialogue += DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.OnDialogueStarted += ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnDialogueFinished += HideDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnClearDialogue += ClearDialogue;

        // Subscribe to player events
        GameEventsManager.instance.playerEvents.onPlayerGainedXP += UpdateXPDisplay;
        GameEventsManager.instance.playerEvents.onPlayerLeveledUp += UpdateLevelDisplay;
        GameEventsManager.instance.playerEvents.onPlayerNameChanged += UpdateNameDisplay;
        GameEventsManager.instance.playerEvents.onPlayerHealthChanged += UpdateHealthDisplay;
        // **NEW: Subscribe to Trait Events**
        GameEventsManager.instance.playerEvents.onHonestyChanged += UpdateHonestyDisplay;
        GameEventsManager.instance.playerEvents.onDeceptionChanged += UpdateDeceptionDisplay;
        GameEventsManager.instance.playerEvents.onCourageChanged += UpdateCourageDisplay;
        GameEventsManager.instance.playerEvents.onCautionChanged += UpdateCautionDisplay;
        GameEventsManager.instance.playerEvents.onCompassionChanged += UpdateCompassionDisplay;
        GameEventsManager.instance.playerEvents.onInsensitivityChanged += UpdateInsensitivityDisplay;
        GameEventsManager.instance.playerEvents.onMatrixAwarenessChanged += UpdateMatrixAwarenessDisplay;
        // **NEW: Subscribe to Honor and Greed Events**
        GameEventsManager.instance.playerEvents.onHonorChanged += UpdateHonorDisplay;
        GameEventsManager.instance.playerEvents.onGreedChanged += UpdateGreedDisplay;
        // **NEW: Subscribe to Location Changed Event**
        GameEventsManager.instance.playerEvents.onLocationChanged += UpdateLocationDisplay;

        // Add listener to the "Next" button
        nextButton.onClick.AddListener(NextLine);

        // **NEW: Initialize UI with current values**
        InitializeUI();
    }

    private void OnDisable()
    {
        // Unsubscribe from dialogue events
        GameEventsManager.instance.dialogueEvents.OnDisplayDialogue -= DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.OnDialogueStarted -= ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnDialogueFinished -= HideDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnClearDialogue -= ClearDialogue;

        // Unsubscribe from player events
        GameEventsManager.instance.playerEvents.onPlayerGainedXP -= UpdateXPDisplay;
        GameEventsManager.instance.playerEvents.onPlayerLeveledUp -= UpdateLevelDisplay;
        GameEventsManager.instance.playerEvents.onPlayerNameChanged -= UpdateNameDisplay;
        GameEventsManager.instance.playerEvents.onPlayerHealthChanged -= UpdateHealthDisplay;
        // **NEW: Unsubscribe from Trait Events**
        GameEventsManager.instance.playerEvents.onHonestyChanged -= UpdateHonestyDisplay;
        GameEventsManager.instance.playerEvents.onDeceptionChanged -= UpdateDeceptionDisplay;
        GameEventsManager.instance.playerEvents.onCourageChanged -= UpdateCourageDisplay;
        GameEventsManager.instance.playerEvents.onCautionChanged -= UpdateCautionDisplay;
        GameEventsManager.instance.playerEvents.onCompassionChanged -= UpdateCompassionDisplay;
        GameEventsManager.instance.playerEvents.onInsensitivityChanged -= UpdateInsensitivityDisplay;
        GameEventsManager.instance.playerEvents.onMatrixAwarenessChanged -= UpdateMatrixAwarenessDisplay;
        // **NEW: Unsubscribe from Honor and Greed Events**
        GameEventsManager.instance.playerEvents.onHonorChanged -= UpdateHonorDisplay;
        GameEventsManager.instance.playerEvents.onGreedChanged -= UpdateGreedDisplay;
        // **NEW: Unsubscribe from Location Changed Event**
        GameEventsManager.instance.playerEvents.onLocationChanged -= UpdateLocationDisplay;

        // Remove listener from the "Next" button
        nextButton.onClick.RemoveListener(NextLine);
    }

    private void InitializeUI()
    {
        // Get the current values from PlayerStats
        PlayerStats playerStats = FindObjectOfType<PlayerStats>(); // Assuming there's only one PlayerStats

        if (playerStats != null)
        {
            UpdateXPDisplay(playerStats.XP);
            UpdateLevelDisplay(playerStats.Level);
            UpdateNameDisplay(playerStats.PlayerName);
            UpdateHealthDisplay(playerStats.Health);
            UpdateHonestyDisplay(playerStats.Honesty);
            UpdateDeceptionDisplay(playerStats.Deception);
            UpdateCourageDisplay(playerStats.Courage);
            UpdateCautionDisplay(playerStats.Caution);
            UpdateCompassionDisplay(playerStats.Compassion);
            UpdateInsensitivityDisplay(playerStats.Insensitivity);
            UpdateMatrixAwarenessDisplay(playerStats.MatrixAwareness);
            // **NEW: Update Honor and Greed**
            UpdateHonorDisplay(playerStats.Honor);
            UpdateGreedDisplay(playerStats.Greed);
            UpdateLocationDisplay(playerStats.Location);
        }
        else
        {
            Debug.LogError("PlayerStats not found in the scene!");
        }
    }

    private void ShowDialoguePanel()
    {
        dialoguePanel.SetActive(true);
    }

    private void HideDialoguePanel()
    {
        dialoguePanel.SetActive(false);
    }

    private void ClearDialogue()
    {
        dialogueText.text = "";
    }

    private void DisplayDialogue(string text, List<Choice> choices)
    {
        // Append the new text instead of replacing it
        dialogueText.text += text + "\n"; // Add a newline for readability

        // Scroll to the bottom after adding new text
        Canvas.ForceUpdateCanvases();
        dialogueScrollRect.verticalNormalizedPosition = 0f; // 0 is the bottom

        // **NEW CODE: Hide/Show "Next" Button**
        if (choices.Count > 0)
        {
            nextButton.gameObject.SetActive(false); // Hide "Next" button
        }
        else
        {
            nextButton.gameObject.SetActive(true);  // Show "Next" button
        }

        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < choices.Count)
            {
                choiceButtons[i].gameObject.SetActive(true);
                choiceButtons[i].GetComponentInChildren<TextMeshProUGUI>().text = choices[i].text;

                DialogueChoiceButton choiceButtonScript = choiceButtons[i].GetComponent<DialogueChoiceButton>();

                if (choiceButtonScript != null)
                {
                    choiceButtonScript.SetChoiceIndex(i);
                    choiceButtonScript.SetChoiceText(choices[i].text);
                }
                else Debug.LogError("No DialogueChoiceButton found in the choiceButtons!");

                int choiceIndex = i;
                choiceButtons[i].onClick.RemoveAllListeners();
                choiceButtons[i].onClick.AddListener(() => OnChoiceSelected(choiceIndex));
            }
            else
            {
                choiceButtons[i].gameObject.SetActive(false);
            }
        }
    }

    public void OnChoiceSelected(int choiceIndex)
    {
        GameEventsManager.instance.dialogueEvents.UpdateChoiceIndex(choiceIndex);
        GameEventsManager.instance.inputEvents.SubmitPressed();
    }

    public void UpdateXPDisplay(int xp)
    {
        xp_disp.text = $"XP: {xp}";
        Debug.Log($"Player XP updated to {xp}");
    }

    public void UpdateLevelDisplay(int level)
    {
        level_disp.text = $"Level: {level}";
        Debug.Log($"Player Level updated to {level}");
    }

    public void UpdateNameDisplay(string name)
    {
        playerName_disp.text = $"Name: {name}";
        Debug.Log($"Player Name updated to {name}");
    }

    public void UpdateHealthDisplay(int health)
    {
        health_disp.text = $"Health: {health}";
        Debug.Log($"Player Health updated to {health}");
    }

    // New method for the "Next" button
    public void NextLine()
    {
        GameEventsManager.instance.inputEvents.SubmitPressed();
    }

    // **NEW: Update Location Display**
    public void UpdateLocationDisplay(string location)
    {
        if (locationText != null)
        {
            locationText.text = $"Location: {location}";
            Debug.Log($"Player Location updated to {location}");
        }
        else
        {
            Debug.LogError("Location Text object is not assigned in UIManager!");
        }
    }

    // **NEW: Update Trait Displays**
    public void UpdateHonestyDisplay(int honesty)
    {
        if (honesty_disp != null)
        {
            honesty_disp.text = $"Honesty: {honesty}";
            Debug.Log($"Player Honesty updated to {honesty}");
        }
        else
        {
            Debug.LogError("Honesty Text object is not assigned in UIManager!");
        }
    }

    public void UpdateDeceptionDisplay(int deception)
    {
        if (deception_disp != null)
        {
            deception_disp.text = $"Deception: {deception}";
            Debug.Log($"Player Deception updated to {deception}");
        }
        else
        {
            Debug.LogError("Deception Text object is not assigned in UIManager!");
        }
    }

    public void UpdateCourageDisplay(int courage)
    {
        if (courage_disp != null)
        {
            courage_disp.text = $"Courage: {courage}";
            Debug.Log($"Player Courage updated to {courage}");
        }
        else
        {
            Debug.LogError("Courage Text object is not assigned in UIManager!");
        }
    }

    public void UpdateCautionDisplay(int caution)
    {
        if (caution_disp != null)
        {
            caution_disp.text = $"Caution: {caution}";
            Debug.Log($"Player Caution updated to {caution}");
        }
        else
        {
            Debug.LogError("Caution Text object is not assigned in UIManager!");
        }
    }

    public void UpdateCompassionDisplay(int compassion)
    {
        if (compassion_disp != null)
        {
            compassion_disp.text = $"Compassion: {compassion}";
            Debug.Log($"Player Compassion updated to {compassion}");
        }
        else
        {
            Debug.LogError("Compassion Text object is not assigned in UIManager!");
        }
    }

    public void UpdateInsensitivityDisplay(int insensitivity)
    {
        if (insensitivity_disp != null)
        {
            insensitivity_disp.text = $"Insensitivity: {insensitivity}";
            Debug.Log($"Player Insensitivity updated to {insensitivity}");
        }
        else
        {
            Debug.LogError("Insensitivity Text object is not assigned in UIManager!");
        }
    }

    public void UpdateMatrixAwarenessDisplay(int matrixAwareness)
    {
        if (matrixAwareness_disp != null)
        {
            matrixAwareness_disp.text = $"Aware: {matrixAwareness}";
            Debug.Log($"Player Matrix Awareness updated to {matrixAwareness}");
        }
        else
        {
            Debug.LogError("Matrix Awareness Text object is not assigned in UIManager!");
        }
    }

    // **NEW: Update Honor and Greed Displays**
    public void UpdateHonorDisplay(int honor)
    {
        if (honor_disp != null)
        {
            honor_disp.text = $"Honor: {honor}";
            Debug.Log($"Player Honor updated to {honor}");
        }
        else
        {
            Debug.LogError("Honor Text object is not assigned in UIManager!");
        }
    }

    public void UpdateGreedDisplay(int greed)
    {
        if (greed_disp != null)
        {
            greed_disp.text = $"Greed: {greed}";
            Debug.Log($"Player Greed updated to {greed}");
        }
        else
        {
            Debug.LogError("Greed Text object is not assigned in UIManager!");
        }
    }
}
