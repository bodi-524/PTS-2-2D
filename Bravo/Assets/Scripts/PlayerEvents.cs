using System;
using UnityEngine;

public class PlayerEvents
{
    // Core Player Stat Events
    public event Action<int> onPlayerGainedXP;
    public event Action<int> onPlayerLeveledUp;
    public event Action<string> onPlayerNameChanged;
    public event Action<int> onPlayerHealthChanged;

    // Character Trait Events
    public event Action<int> onHonestyChanged;
    public event Action<int> onDeceptionChanged;
    public event Action<int> onCourageChanged;
    public event Action<int> onCautionChanged;
    public event Action<int> onCompassionChanged;
    public event Action<int> onInsensitivityChanged;

    // New Events
    public event Action<int> onMatrixAwarenessChanged;
    public event Action<string> onLocationChanged;

    // **NEW: Honor and Greed Events**
    public event Action<int> onHonorChanged;
    public event Action<int> onGreedChanged;

    // Core Stat Event Call Methods
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
        if (onPlayerNameChanged != null) onPlayerNameChanged(name);
    }

    public void PlayerHealthChanged(int health)
    {
        if (onPlayerHealthChanged != null) onPlayerHealthChanged(health);
    }

    // Trait Event Call Methods
    public void HonestyChanged(int honesty)
    {
        if (onHonestyChanged != null) onHonestyChanged(honesty);
    }

    public void DeceptionChanged(int deception)
    {
        if (onDeceptionChanged != null) onDeceptionChanged(deception);
    }

    public void CourageChanged(int courage)
    {
        if (onCourageChanged != null) onCourageChanged(courage);
    }

    public void CautionChanged(int caution)
    {
        if (onCautionChanged != null) onCautionChanged(caution);
    }

    public void CompassionChanged(int compassion)
    {
        if (onCompassionChanged != null) onCompassionChanged(compassion);
    }

    public void InsensitivityChanged(int insensitivity)
    {
        if (onInsensitivityChanged != null) onInsensitivityChanged(insensitivity);
    }

    // New Event Call Methods
    public void MatrixAwarenessChanged(int matrixAwareness)
    {
        if (onMatrixAwarenessChanged != null) onMatrixAwarenessChanged(matrixAwareness);
    }

    public void LocationChanged(string location)
    {
        if (onLocationChanged != null) onLocationChanged(location);
    }

    // **NEW: Honor and Greed Event Call Methods**
    public void HonorChanged(int honor)
    {
        if (onHonorChanged != null) onHonorChanged(honor);
    }

    public void GreedChanged(int greed)
    {
        if (onGreedChanged != null) onGreedChanged(greed);
    }
}
