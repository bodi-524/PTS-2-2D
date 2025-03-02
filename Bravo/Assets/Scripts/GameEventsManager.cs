using System;
using UnityEngine;

public class GameEventsManager : MonoBehaviour
{
    //Singleton instance
    public static GameEventsManager instance { get; private set; }

// Event classes
    public DialogueEvents dialogueEvents;
    public InputEvents inputEvents;
    public PlayerEvents playerEvents;
    public QuestEvents questEvents;

    private void Awake()
    {
        //To ensure that there is only one instance of the Game Events Manager
        if (instance != null)
        {
            Debug.LogError("Found more than one Game Events Manager in the scene.");
        }
        instance = this;

        // Initialize event classes
        dialogueEvents = new DialogueEvents();
        inputEvents = new InputEvents();
        playerEvents = new PlayerEvents();
        dialogueEvents = new DialogueEvents();
        // questEvents = new QuestEvents();
    }
}