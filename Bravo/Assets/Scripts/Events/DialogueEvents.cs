using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Ink.Runtime;

public class DialogueEvents
{
    // Event for when dialogue starts
    public event Action<string> onEnterDialogue;
    public void EnterDialogue(string knotName) => onEnterDialogue?.Invoke(knotName);

    // Event for displaying dialogue text and choices
    public event Action<string, List<Choice>> onDisplayDialogue;
    public void DisplayDialogue(string text, List<Choice> choices) => onDisplayDialogue?.Invoke(text, choices);

    // Event for when dialogue starts
    public event Action onDialogueStarted;
    public void DialogueStarted() => onDialogueStarted?.Invoke();

    // Event for when dialogue ends
    public event Action onDialogueFinished;
    public void DialogueFinished() => onDialogueFinished?.Invoke();

    public event Action<int> onMakeChoice; // Event for when a choice is made
    public void MakeChoice(int choiceIndex) => onMakeChoice?.Invoke(choiceIndex);

}