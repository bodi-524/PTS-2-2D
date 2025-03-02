using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerStats : MonoBehaviour
{
    public string PlayerName { get; private set; } = "Hero";
    public int Level { get; private set; } = 1;
    public int Health { get; private set; } = 100;
    public int XP { get; private set; } = 0;

    private int nextLevelXP = 50; // XP required for the next level
    
    private void Awake() {
        GameEventsManager.instance.playerEvents.PlayerNameChanged(PlayerName);
        GameEventsManager.instance.playerEvents.PlayerLeveledUp(Level);
        GameEventsManager.instance.playerEvents.PlayerGainedXP(XP);
        GameEventsManager.instance.playerEvents.PlayerHealthChanged(Health);
    }


    // Method to gain XP
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

    // Method to handle leveling up
    private void LevelUp()
    {
        Level++;
        XP -= nextLevelXP; // Carry over excess XP
        nextLevelXP = Mathf.CeilToInt(nextLevelXP * 1.5f); // Increase XP requirement by 1.5x

        GameEventsManager.instance.playerEvents.PlayerLeveledUp(Level);
        Debug.Log($"Player leveled up! New Level: {Level}, Next Level XP: {nextLevelXP}");
    }

    // Method to update health (if needed in future)
    public void SetHealth(int newHealth)
    {
        Health = Mathf.Clamp(newHealth, 0, 100); // Ensure health stays within valid range
        GameEventsManager.instance.playerEvents.PlayerHealthChanged(Health);
        Debug.Log($"Player health updated: {Health}");
    }
    
    // Method to update player name
    public void SetPlayerName(string newName)
    {
        PlayerName = newName;
        GameEventsManager.instance.playerEvents.PlayerNameChanged(PlayerName);
        Debug.Log($"Player name updated: {PlayerName}");
    }


}
