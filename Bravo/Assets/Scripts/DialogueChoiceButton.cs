using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using TMPro;

public class DialogueChoiceButton : MonoBehaviour, ISelectHandler
{
    [Header("Components")]
    [SerializeField] private Button button;
    // No longer need to serialize the text component. We will find it
    private TextMeshProUGUI choiceText;

    private int choiceIndex = -1;

    private void Awake()
    {
        // Find the TextMeshProUGUI component in the children
        choiceText = GetComponentInChildren<TextMeshProUGUI>();

        if (choiceText == null)
        {
            Debug.LogError("No TextMeshProUGUI found in children of DialogueChoiceButton!");
        }
    }

    public void SetChoiceText(string choiceTextString)
    {
        if (choiceText != null)
        {
            choiceText.text = choiceTextString;
        }
    }

    public void SetChoiceIndex(int choiceIndex)
    {
        this.choiceIndex = choiceIndex;
    }

    public void SelectButton()
    {
        button.Select();
    }

    public void OnSelect(BaseEventData eventData)
    {
        Debug.Log($"Choice {choiceIndex} was selected");
        GameEventsManager.instance.dialogueEvents.UpdateChoiceIndex(choiceIndex);
    }

}
