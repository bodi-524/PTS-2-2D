using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

// WE wont be attaching this script; it will be created using eventsManager
public class DialogueEvents
{
    public event Action<string> onEnterDialogue;
    puclic void EnterDialogue(string knotName)
    {
        if (onEnterDialogue != null)
        {
            onEnterDialogue(knotName);
        }
    }
}
