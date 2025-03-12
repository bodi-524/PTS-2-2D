using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerStats : MonoBehaviour
{
    // Core Stats
    public string PlayerName { get; private set; } = "General Kenobi";
    public int Level { get; private set; } = 1;
    public int Health { get; private set; } = 100;
    public int XP { get; private set; } = 0;

    // Character Traits (Opposing Pairs)
    public int Honesty { get; private set; } = 5;
    public int Deception { get; private set; } = 5;
    public int Courage { get; private set; } = 5;
    public int Caution { get; private set; } = 5;
    public int Compassion { get; private set; } = 5;
    public int Insensitivity { get; private set; } = 5;
    public int MatrixAwareness { get; private set; } = 0;
    public string Location { get; private set; } = "Unknown";

    private int nextLevelXP = 50; // XP required for the next level

    private void Awake()
    {
        //Setting the values on start
        GameEventsManager.instance.playerEvents.PlayerNameChanged(PlayerName);
        GameEventsManager.instance.playerEvents.PlayerLeveledUp(Level);
        GameEventsManager.instance.playerEvents.PlayerGainedXP(XP);
        GameEventsManager.instance.playerEvents.PlayerHealthChanged(Health);
        //Trait events
        GameEventsManager.instance.playerEvents.HonestyChanged(Honesty);
        GameEventsManager.instance.playerEvents.DeceptionChanged(Deception);
        GameEventsManager.instance.playerEvents.CourageChanged(Courage);
        GameEventsManager.instance.playerEvents.CautionChanged(Caution);
        GameEventsManager.instance.playerEvents.CompassionChanged(Compassion);
        GameEventsManager.instance.playerEvents.InsensitivityChanged(Insensitivity);
        //Awareness and Location
        GameEventsManager.instance.playerEvents.MatrixAwarenessChanged(MatrixAwareness);
        GameEventsManager.instance.playerEvents.LocationChanged(Location);

    }

    // Character Trait Methods
    public void AdjustHonesty(int delta)
    {
        Honesty += delta;
        Honesty = Mathf.Clamp(Honesty, 0, 10);
        Deception = 10 - Honesty;

        GameEventsManager.instance.playerEvents.HonestyChanged(Honesty);
        GameEventsManager.instance.playerEvents.DeceptionChanged(Deception);
    }

    public void AdjustDeception(int delta)
    {
        AdjustHonesty(-delta);
    }

    public void AdjustCourage(int delta)
    {
        Courage += delta;
        Courage = Mathf.Clamp(Courage, 0, 10);
        Caution = 10 - Courage;

        GameEventsManager.instance.playerEvents.CourageChanged(Courage);
        GameEventsManager.instance.playerEvents.CautionChanged(Caution);
    }

    public void AdjustCaution(int delta)
    {
        AdjustCourage(-delta);
    }

    public void AdjustCompassion(int delta)
    {
        Compassion += delta;
        Compassion = Mathf.Clamp(Compassion, 0, 10);
        Insensitivity = 10 - Compassion;

        GameEventsManager.instance.playerEvents.CompassionChanged(Compassion);
        GameEventsManager.instance.playerEvents.InsensitivityChanged(Insensitivity);
    }

    public void AdjustInsensitivity(int delta)
    {
        AdjustCompassion(-delta);
    }

    // Core Stat Methods
    public void GainXP(int amount)
    {
        XP += amount;
        GameEventsManager.instance.playerEvents.PlayerGainedXP(XP);

        // Check if the player has enough XP to level up
        while (XP >= nextLevelXP)
        {
            LevelUp();
        }
    }

    private void LevelUp()
    {
        Level++;
        XP -= nextLevelXP;
        nextLevelXP = Mathf.CeilToInt(nextLevelXP * 1.5f);

        GameEventsManager.instance.playerEvents.PlayerLeveledUp(Level);
    }

    public void SetHealth(int newHealth)
    {
        Health = Mathf.Clamp(newHealth, 0, 100);
        GameEventsManager.instance.playerEvents.PlayerHealthChanged(Health);
    }

    public void SetPlayerName(string newName)
    {
        PlayerName = newName;
        GameEventsManager.instance.playerEvents.PlayerNameChanged(PlayerName);
    }
    // Awareness and Location Methods
    public void AdjustMatrixAwareness(int delta)
    {
        MatrixAwareness += delta;
        GameEventsManager.instance.playerEvents.MatrixAwarenessChanged(MatrixAwareness);
    }

    public void SetLocation(string newLocation)
    {
        Location = newLocation;
        GameEventsManager.instance.playerEvents.LocationChanged(Location);
    }
}
