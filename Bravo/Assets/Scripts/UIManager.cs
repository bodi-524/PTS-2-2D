using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class UIManager : MonoBehaviour
{
    [Header("Dialogue UI")]
    [SerializeField] private GameObject dialoguePanel;
    [SerializeField] private TextMeshProUGUI dialogueText;
    [SerializeField] private Button[] choiceButtons;

    [Header("Player Stats UI")]
    [SerializeField] private TextMeshProUGUI playerName_disp;
    [SerializeField] private TextMeshProUGUI level_disp;
    [SerializeField] private TextMeshProUGUI health_disp;
    [SerializeField] private TextMeshProUGUI xp_disp;

    private void OnEnable()
    {
        // Subscribe to dialogue events
        GameEventsManager.instance.dialogueEvents.OnDisplayDialogue += DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.OnDialogueStarted += ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnDialogueFinished += HideDialoguePanel;

        // Subscribe to player events
        GameEventsManager.instance.playerEvents.onPlayerGainedXP += UpdateXPDisplay;
        GameEventsManager.instance.playerEvents.onPlayerLeveledUp += UpdateLevelDisplay;
        //New
        GameEventsManager.instance.playerEvents.onPlayerNameChanged += UpdateNameDisplay;
        GameEventsManager.instance.playerEvents.onPlayerHealthChanged += UpdateHealthDisplay;
    }

    private void OnDisable()
    {
        // Unsubscribe from dialogue events
        GameEventsManager.instance.dialogueEvents.OnDisplayDialogue -= DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.OnDialogueStarted -= ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.OnDialogueFinished -= HideDialoguePanel;

        // Unsubscribe from player events
        GameEventsManager.instance.playerEvents.onPlayerGainedXP -= UpdateXPDisplay;
        GameEventsManager.instance.playerEvents.onPlayerLeveledUp -= UpdateLevelDisplay;
        //New
        GameEventsManager.instance.playerEvents.onPlayerNameChanged -= UpdateNameDisplay;
        GameEventsManager.instance.playerEvents.onPlayerHealthChanged -= UpdateHealthDisplay;
    }

    private void ShowDialoguePanel()
    {
        dialoguePanel.SetActive(true);
    }

    private void HideDialoguePanel()
    {
        dialoguePanel.SetActive(false);
    }

    private void DisplayDialogue(string text, List<Ink.Runtime.Choice> choices)
    {
        dialogueText.text = text;

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
    //New methods
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
}
