using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [Header("Ink Story")]
    [SerializeField] private TextAsset inkJSONAsset; // The compiled Ink story
    private int currentChoiceIndex = -1;
    private Story story; // The Ink story object
    private bool dialoguePlaying = false; // Tracks whether dialogue is active

    [Header("UI")]
    [SerializeField] private GameObject dialoguePanel;

    [Header("Dependencies")]
    [SerializeField] private PlayerStats playerStats;

    private void Awake()
    {
        story = new Story(inkJSONAsset.text); // Load the Ink story

        // Bind external functions for traits
        story.BindExternalFunction("AdjustHonesty", (int delta) => {
            playerStats.AdjustHonesty(delta);
        });
        story.BindExternalFunction("AdjustDeception", (int delta) => {
            playerStats.AdjustDeception(delta);
        });
        story.BindExternalFunction("AdjustCourage", (int delta) => {
            playerStats.AdjustCourage(delta);
        });
        story.BindExternalFunction("AdjustCaution", (int delta) => {
            playerStats.AdjustCaution(delta);
        });
        story.BindExternalFunction("AdjustCompassion", (int delta) => {
            playerStats.AdjustCompassion(delta);
        });
        story.BindExternalFunction("AdjustInsensitivity", (int delta) => {
            playerStats.AdjustInsensitivity(delta);
        });

        // Bind external functions for core stats
        story.BindExternalFunction("GainXP", (int amount) => {
            playerStats.GainXP(amount);
        });
        story.BindExternalFunction("SetHealth", (int newHealth) => {
            playerStats.SetHealth(newHealth);
        });

        // Bind external function for player name
        story.BindExternalFunction("SetPlayerName", (string newName) => {
            playerStats.SetPlayerName(newName);
        });

        // Bind external functions for new variables
        story.BindExternalFunction("AdjustMatrixAwareness", (int delta) => {
            playerStats.AdjustMatrixAwareness(delta);
        });

        story.BindExternalFunction("SetLocation", (string newLocation) => {
            playerStats.SetLocation(newLocation);
        });
    }

    private void OnEnable()
    {
        GameEventsManager.instance.dialogueEvents.onEnterDialogue += EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed += SubmitPressed;
        GameEventsManager.instance.dialogueEvents.onUpdateChoiceIndex += UpdateChoiceIndex;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.dialogueEvents.onEnterDialogue -= EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed -= SubmitPressed;
        GameEventsManager.instance.dialogueEvents.onUpdateChoiceIndex -= UpdateChoiceIndex;
    }

    private void EnterDialogue(string knotName)
    {
        Debug.Log($"Trying to start knot: {knotName}");
        if (dialoguePlaying) return;

        dialoguePlaying = true;
        story.ChoosePathString(knotName);

        GameEventsManager.instance.dialogueEvents.DialogueStarted(); // Trigger event
        ContinueDialogue();
    }


    private void SubmitPressed()
    {
        if (dialoguePlaying) ContinueDialogue();
    }
    private void ContinueDialogue()
    {
        // Check if choices are available first
        if (story.currentChoices.Count > 0)
        {
            // If a choice has been made, apply it
            if (currentChoiceIndex != -1)
            {
                story.ChooseChoiceIndex(currentChoiceIndex);
                currentChoiceIndex = -1; // Reset choice index
                ContinueDialogue(); // Call ContinueDialogue again to process the choice
                return;//stop the function after calling itself
            }
            else return;//do nothing
        }

        //check if there is more text
        if (story.canContinue)
        {
            string dialogueLine = story.Continue();
            Debug.Log($"Dialogue: {dialogueLine}");
            GameEventsManager.instance.dialogueEvents.DisplayDialogue(dialogueLine, story.currentChoices);
        }
        else ExitDialogue();
    }



    private void ExitDialogue()
    {
        dialoguePlaying = false;

        GameEventsManager.instance.dialogueEvents.DialogueFinished(); // Trigger event
        Debug.Log("Dialogue ended.");
    }

    //updates the choice to the last choice selected by the player
    private void UpdateChoiceIndex(int choiceIndex){
        currentChoiceIndex = choiceIndex;
    }
}
