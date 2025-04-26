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
    private string lastKnot = "";
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
        story.BindExternalFunction("AdjustGreed", (int delta) => {
            playerStats.AdjustGreed(delta);
        });
        story.BindExternalFunction("AdjustHonor", (int delta) => {
            playerStats.AdjustHonor(delta);
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

    private void Start()
    {
        // Start the story by entering the "big_bang" knot
        // EnterDialogue("big_bang"); // Removed, now called by EventTester
    }

    private void OnEnable()
    {
        GameEventsManager.instance.dialogueEvents.onEnterDialogue += EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed += SubmitPressed;
        GameEventsManager.instance.dialogueEvents.onUpdateChoiceIndex += UpdateChoiceIndex;
        // Subscribe to PlayerNameChanged event
        GameEventsManager.instance.playerEvents.onPlayerNameChanged += OnPlayerNameChanged;
        //new
        GameEventsManager.instance.playerEvents.onHonestyChanged += OnHonestyChanged;
        GameEventsManager.instance.playerEvents.onDeceptionChanged += OnDeceptionChanged;
        GameEventsManager.instance.playerEvents.onCourageChanged += OnCourageChanged;
        GameEventsManager.instance.playerEvents.onCautionChanged += OnCautionChanged;
        GameEventsManager.instance.playerEvents.onCompassionChanged += OnCompassionChanged;
        GameEventsManager.instance.playerEvents.onInsensitivityChanged += OnInsensitivityChanged;
        GameEventsManager.instance.playerEvents.onHonorChanged += OnHonorChanged;
        GameEventsManager.instance.playerEvents.onGreedChanged += OnGreedChanged;
        GameEventsManager.instance.playerEvents.onMatrixAwarenessChanged += OnMatrixAwarenessChanged;
    }

    private void OnDisable()
    {
        GameEventsManager.instance.dialogueEvents.onEnterDialogue -= EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed -= SubmitPressed;
        GameEventsManager.instance.dialogueEvents.onUpdateChoiceIndex -= UpdateChoiceIndex;
        // Unsubscribe from PlayerNameChanged event
        GameEventsManager.instance.playerEvents.onPlayerNameChanged -= OnPlayerNameChanged;
        //new
        GameEventsManager.instance.playerEvents.onHonestyChanged -= OnHonestyChanged;
        GameEventsManager.instance.playerEvents.onDeceptionChanged -= OnDeceptionChanged;
        GameEventsManager.instance.playerEvents.onCourageChanged -= OnCourageChanged;
        GameEventsManager.instance.playerEvents.onCautionChanged -= OnCautionChanged;
        GameEventsManager.instance.playerEvents.onCompassionChanged -= OnCompassionChanged;
        GameEventsManager.instance.playerEvents.onInsensitivityChanged -= OnInsensitivityChanged;
                GameEventsManager.instance.playerEvents.onHonorChanged -= OnHonorChanged;
        GameEventsManager.instance.playerEvents.onGreedChanged -= OnGreedChanged;
        GameEventsManager.instance.playerEvents.onMatrixAwarenessChanged -= OnMatrixAwarenessChanged;
    }

    private void EnterDialogue(string knotName)
    {
        Debug.Log($"Trying to start knot: {knotName}");
        if (dialoguePlaying) return;

        dialoguePlaying = true;
        story.ChoosePathString(knotName);

        // **INITIAL SYNCHRONIZATION**
        SyncPlayerStatsToInk();
        GameEventsManager.instance.dialogueEvents.ClearDialogue();
        GameEventsManager.instance.dialogueEvents.DialogueStarted(); // Trigger event
        ContinueDialogue();
        // while (story.canContinue && story.currentChoices.Count == 0)
        // {
        //     ContinueDialogue();
        // }
    }

    // **NEW METHOD: SyncPlayerStatsToInk**
    private void SyncPlayerStatsToInk()
    {
        story.variablesState["playerName"] = playerStats.PlayerName;
        story.variablesState["honesty"] = playerStats.Honesty;
        story.variablesState["deception"] = playerStats.Deception;
        story.variablesState["courage"] = playerStats.Courage;
        story.variablesState["caution"] = playerStats.Caution;
        story.variablesState["compassion"] = playerStats.Compassion;
        story.variablesState["insensitivity"] = playerStats.Insensitivity;
        story.variablesState["honor"] = playerStats.Honor;
        story.variablesState["greed"] = playerStats.Greed;
        story.variablesState["matrixAwareness"] = playerStats.MatrixAwareness;
    }

    private void SubmitPressed()
    {
        if (dialoguePlaying) ContinueDialogue();
    }
    private void ContinueDialogue()
    {
        Debug.Log("ContinueDialogue() called");
        // Check if choices are available first
        if (story.currentChoices.Count > 0)
        {
            Debug.Log("Choices available");
            // If a choice has been made, apply it
            if (currentChoiceIndex != -1)
            {
                Debug.Log($"Choosing choice: {currentChoiceIndex}");
                story.ChooseChoiceIndex(currentChoiceIndex);
                currentChoiceIndex = -1; // Reset choice index
                SyncPlayerStatsToInk();
                ContinueDialogue(); // Call ContinueDialogue again to process the choice
                return;//stop the function after calling itself
            }
            else {
                Debug.Log("Waiting for choice to be made");
                return;//do nothing
            }
        }
        //check if there is more text
        if (story.canContinue)
        {
            SyncPlayerStatsToInk();
            string dialogueLine = story.Continue();
            Debug.Log($"Dialogue: {dialogueLine}");
            GameEventsManager.instance.dialogueEvents.DisplayDialogue(dialogueLine, story.currentChoices);
        }
        else 
        {
        Debug.Log($"No dialogue to display");
        ExitDialogue();
        }
    }

    private void ExitDialogue()
    {
        dialoguePlaying = false;
        GameEventsManager.instance.dialogueEvents.DialogueFinished();
        Debug.Log("Dialogue ended.");
    }

    private void UpdateChoiceIndex(int choiceIndex){
        currentChoiceIndex = choiceIndex;
    }
    private void OnPlayerNameChanged(string newName)
    {
        story.variablesState["playerName"] = newName;
    }

    // Methods to handle changes in the traits
    private void OnHonestyChanged(int newHonesty){
        story.variablesState["honesty"] = newHonesty;
    }
    private void OnDeceptionChanged(int newDeception){
        story.variablesState["deception"] = newDeception;
    }
    private void OnCourageChanged(int newCourage){
        story.variablesState["courage"] = newCourage;
    }
    private void OnCautionChanged(int newCaution){
        story.variablesState["caution"] = newCaution;
    }
    private void OnCompassionChanged(int newCompassion){
        story.variablesState["compassion"] = newCompassion;
    }
    private void OnInsensitivityChanged(int newInsensitivity){
        story.variablesState["insensitivity"] = newInsensitivity;
    }
    private void OnHonorChanged(int newHonor){
        story.variablesState["honor"] = newHonor;
    }
    private void OnGreedChanged(int newGreed){
        story.variablesState["greed"] = newGreed;
    }
    private void OnMatrixAwarenessChanged(int newMatrixAwareness){
        story.variablesState["matrixAwareness"] = newMatrixAwareness;
    }
}
