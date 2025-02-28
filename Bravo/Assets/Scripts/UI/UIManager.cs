using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using Ink.Runtime;

public class UIManager : MonoBehaviour
{
    [Header("Dialogue UI")] // Dialogue UI elements
    [SerializeField] private GameObject dialoguePanel; // The dialogue panel (parent object)
    [SerializeField] private TextMeshProUGUI dialogueText; // Text display for dialogue
    [SerializeField] private GameObject[] choiceButtons; // Buttons for choices

    private void OnEnable()
    {
        // Subscribe to dialogue events
        GameEventsManager.instance.dialogueEvents.onDisplayDialogue += DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.onDialogueStarted += ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.onDialogueFinished += HideDialoguePanel;
    }

    private void OnDisable()
    {
        // Unsubscribe from dialogue events
        GameEventsManager.instance.dialogueEvents.onDisplayDialogue -= DisplayDialogue;
        GameEventsManager.instance.dialogueEvents.onDialogueStarted -= ShowDialoguePanel;
        GameEventsManager.instance.dialogueEvents.onDialogueFinished -= HideDialoguePanel;
    }
    
    //Though it seems Showing and Hiding is irrelevant for a text basedgame;
    // But since we intend to implement turn based combat(⊙⁠‿◎)🔪💉🩸 ⎛⎝( ` ᢍ ´ )⎠⎞ᵐᵘʰᵃʰᵃ
    private void ShowDialoguePanel()
    {
        // Show the dialogue panel
        dialoguePanel.SetActive(true);
    }

    private void HideDialoguePanel()
    {
        // Hide the dialogue panel
        dialoguePanel.SetActive(false);
    }
    private void DisplayDialogue(string text, List<Choice> choices)
    {
        // Display the dialogue text
        dialogueText.text = text;
        // Display the choices and a button for each choice. Independent number of choices ദ്ദി( • ᴗ - ) ✧
        for (int i = 0; i < choiceButtons.Length; i++)
        {
            if (i < choices.Count)
            {
                choiceButtons[i].SetActive(true);
                choiceButtons[i].GetComponentInChildren<TextMeshProUGUI>().text = choices[i].text;
            }
            else
            {
                choiceButtons[i].SetActive(false);
            }
        }
    }
    // Called when a choice button is clicked
    public void OnChoiceSelected(int choiceIndex)
    {
        GameEventsManager.instance.dialogueEvents.MakeChoice(choiceIndex);
    }


}
