using System;
using System.Collections.Generic;
using Ink.Runtime;

public class DialogueEvents
{
    public event Action<string, List<Choice>> OnDisplayDialogue;
    public event Action OnDialogueStarted;
    public event Action OnDialogueFinished;
    public event Action<int> onUpdateChoiceIndex;
    //New
    public event Action<string> OnKnotChanged;
    //New
    public event Action<string> onEnterDialogue;

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
    //New
    public void KnotChanged(string knotName)
    {
        OnKnotChanged?.Invoke(knotName);
    }
    //New
    public void EnterDialogue(string knotName)
    {
        onEnterDialogue?.Invoke(knotName);
    }
}
