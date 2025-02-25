using UnityEngine;
using Ink.Runtime;

public class DialogueManager : MonoBehaviour
{
    [Header("Ink Story")]
    [SerializeField] private TextAsset inkJSONAsset; // The compiled Ink story

    private Story story; // The Ink story object
    private bool dialoguePlaying = false; // Tracks whether dialogue is active

    private void Awake()
    {
        // Load the Ink story
        story = new Story(inkJSONAsset.text);
    }

    private void OnEnable()
    {
        // Subscribe to events
        GameEventsManager.instance.dialogueEvents.onEnterDialogue += EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed += SubmitPressed;
    }

    private void OnDisable()
    {
        // Unsubscribe from events
        GameEventsManager.instance.dialogueEvents.onEnterDialogue -= EnterDialogue;
        GameEventsManager.instance.inputEvents.onSubmitPressed -= SubmitPressed;
    }

    private void EnterDialogue(string knotName)
    {
        // Start dialogue from a specific knot
        if (dialoguePlaying) return;

        dialoguePlaying = true;
        story.ChoosePathString(knotName);

        // Trigger the DialogueStarted event
        GameEventsManager.instance.dialogueEvents.DialogueStarted();

        // Continue the dialogue
        ContinueDialogue();
    }

    private void SubmitPressed()
    {
        // Handle submit button press during dialogue
        if (dialoguePlaying)
        {
            ContinueDialogue();
        }
    }

    private void ContinueDialogue()
    {
        // Continue the story and display the next line of dialogue
        if (story.canContinue)
        {
            string dialogueLine = story.Continue();
            Debug.Log($"Dialogue: {dialogueLine}"); // Print dialogue to the console

            // Print choices, if any
            if (story.currentChoices.Count > 0)
            {
                Debug.Log("Choices:");
                for (int i = 0; i < story.currentChoices.Count; i++)
                {
                    Debug.Log($"{i + 1}. {story.currentChoices[i].text}");
                }
            }

            // Trigger the DisplayDialogue event
            GameEventsManager.instance.dialogueEvents.DisplayDialogue(dialogueLine, story.currentChoices);
        }
        else
        {
            ExitDialogue();
        }
    }

    private void ExitDialogue()
    {
        // End the dialogue
        dialoguePlaying = false;

        // Trigger the DialogueFinished event
        GameEventsManager.instance.dialogueEvents.DialogueFinished();

        Debug.Log("Dialogue ended."); // Print dialogue end to the console
    }
}