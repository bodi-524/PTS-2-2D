using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerEvents
{
    // Event for when the player gains XP
    public event Action<int> onPlayerGainedXP;
    public void PlayerGainedXP(int xp) => onPlayerGainedXP?.Invoke(xp);
}