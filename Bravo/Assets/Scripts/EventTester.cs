using UnityEngine;

public class EventTester : MonoBehaviour
{
    [Header("Dependencies")]
    [SerializeField] private PlayerStats playerStats;

    [Header("Test Parameters")]
    [SerializeField] private int xpToGain = 50;
    [SerializeField] private string newPlayerName = "New Test Name";
    [SerializeField] private int newPlayerHealth = 75;
    [SerializeField] private string knotName = "start";

    [Header("Debug")]
    [SerializeField] private bool testXP = false;
    [SerializeField] private bool testChangeName = false;
    [SerializeField] private bool testChangeHealth = false;
    [SerializeField] private bool testDialogue = true;

    private void Start() {
        if(playerStats == null){
            Debug.LogError("No PlayerStats in EventTester");
        }
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            if(testDialogue) TestEnterDialogue(knotName);
        }
        if (Input.GetKeyDown(KeyCode.X))
        {
            if (testXP) TestGainXP(xpToGain);
        }
        if (Input.GetKeyDown(KeyCode.N))
        {
            if (testChangeName) TestChangeName(newPlayerName);
        }
        if (Input.GetKeyDown(KeyCode.H))
        {
            if (testChangeHealth) TestChangeHealth(newPlayerHealth);
        }
    }

    public void TestGainXP(int amount)
    {
        if (playerStats == null)
        {
            Debug.LogError("PlayerStats reference is not assigned in EventTester.");
            return;
        }

        Debug.Log($"Testing XP Gain: {amount}");
        playerStats.GainXP(amount);
    }

    public void TestEnterDialogue(string knotName)
    {
        if (string.IsNullOrEmpty(knotName))
        {
            Debug.LogError("Knot name is null or empty.");
            return;
        }

        Debug.Log($"Testing Enter Dialogue: {knotName}");
        GameEventsManager.instance.dialogueEvents.EnterDialogue(knotName);
    }

    public void TestChangeName(string newName)
    {
        if (playerStats == null)
        {
            Debug.LogError("PlayerStats reference is not assigned in EventTester.");
            return;
        }

        Debug.Log($"Testing changing Name: {newName}");
        playerStats.SetPlayerName(newName);
    }

    public void TestChangeHealth(int newHealth)
    {
        if (playerStats == null)
        {
            Debug.LogError("PlayerStats reference is not assigned in EventTester.");
            return;
        }

        Debug.Log($"Testing changing Health: {newHealth}");
        playerStats.SetHealth(newHealth);
    }
}
