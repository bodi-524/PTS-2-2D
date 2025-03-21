using System;
using System.Collections.Generic;
using Ink.Runtime;

public class DialogueEvents
{
    public event Action<string, List<Choice>> OnDisplayDialogue;
    public event Action OnDialogueStarted;
    public event Action OnDialogueFinished;
    public event Action<int> onUpdateChoiceIndex;
    public event Action<string> onEnterDialogue;
    public event Action OnClearDialogue;


    public void DisplayDialogue(string text, List<Choice> choices)
    {
        OnDisplayDialogue?.Invoke(text, choices);
    }

    public void DialogueStarted()
    {
        OnDialogueStarted?.Invoke();
    }

    public void DialogueFinished()
    {
        OnDialogueFinished?.Invoke();
    }

    public void UpdateChoiceIndex(int choiceIndex)
    {
        onUpdateChoiceIndex?.Invoke(choiceIndex);
    }

    public void EnterDialogue(string knotName)
    {
        onEnterDialogue?.Invoke(knotName);
    }

    public void ClearDialogue()
    {
        OnClearDialogue?.Invoke();
    }
}
