using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Ink.Runtime;

public class DialogueEvents
{
    public event Action<string> onEnterDialogue;
    public event Action<string, List<Choice>> OnDisplayDialogue;
    public event Action OnDialogueFinished;
    public event Action OnDialogueStarted;
    public event Action OnNeedToChoose;
    //new event
    public event Action<int> onUpdateChoiceIndex;

    public void EnterDialogue(string knotName)
    {
        if (onEnterDialogue != null) onEnterDialogue(knotName);
    }

    public void DisplayDialogue(string text, List<Choice> choices)
    {
        if (OnDisplayDialogue != null) OnDisplayDialogue(text, choices);
    }

    public void DialogueFinished()
    {
        if(OnDialogueFinished != null) OnDialogueFinished();
    }

    public void DialogueStarted()
    {
        if(OnDialogueStarted != null) OnDialogueStarted();
    }

    public void NeedToChoose()
    {
        if (OnNeedToChoose != null) OnNeedToChoose();
    }

    //New event method
    public void UpdateChoiceIndex(int choiceIndex)
    {
        if (onUpdateChoiceIndex != null) onUpdateChoiceIndex(choiceIndex);
    }
}