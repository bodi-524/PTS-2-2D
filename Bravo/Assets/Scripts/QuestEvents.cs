using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class QuestEvents
{
    // Event for when a quest is completed
    public event Action<Quest> onQuestCompleted;
    public void QuestCompleted(Quest quest) => onQuestCompleted?.Invoke(quest);
}