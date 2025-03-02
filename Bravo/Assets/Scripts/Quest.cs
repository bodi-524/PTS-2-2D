using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Quest
{
    public string id; // Unique identifier for the quest
    public string name; // Name of the quest
    public QuestState state; // Current state of the quest

    public Quest(string id, string name, QuestState state)
    {
        this.id = id;
        this.name = name;
        this.state = state;
    }
}

// Enum to represent the state of a quest
public enum QuestState
{
    NotStarted,
    InProgress,
    Completed
}