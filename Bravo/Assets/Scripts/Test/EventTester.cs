using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EventTester : MonoBehaviour
{
    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            // Trigger the EnterDialogue event
            GameEventsManager.instance.dialogueEvents.EnterDialogue("start");
            // Debug.Log("EnterDialogue event triggered");
        }
    }
}