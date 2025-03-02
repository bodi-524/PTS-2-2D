using System;
using UnityEngine;

public class PlayerEvents
{
    public event Action<int> onPlayerGainedXP;
    public event Action<int> onPlayerLeveledUp;
    public event Action<string> onPlayerNameChanged;
    public event Action<int> onPlayerHealthChanged;

    public void PlayerGainedXP(int xp)
    {
        if (onPlayerGainedXP != null) onPlayerGainedXP(xp);
    }

    public void PlayerLeveledUp(int level)
    {
        if (onPlayerLeveledUp != null) onPlayerLeveledUp(level);
    }
    
    public void PlayerNameChanged(string name)
    {
        if(onPlayerNameChanged != null) onPlayerNameChanged(name);
    }

    public void PlayerHealthChanged(int health){
        if (onPlayerHealthChanged != null) onPlayerHealthChanged(health);
    }
}
