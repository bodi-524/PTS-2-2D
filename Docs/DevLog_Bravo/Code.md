## Code for our project

We start with setting up a basic 2D Built in render pipeline for 2022LTS and start with setting up the Directories in the asset. (the GitHub version control has already been set up so not going much into it.)

Based on [Tutorial notes](Misc/Tutorial%20notes.md) from rainman. 
We will be using Event Driven Architecture. 
This is the initial structure of the code base, just a preliminary design with some scripts is given as below. 

![](Misc/Pasted%20image%2020250225080445.png)

I think i can expand on these after some implementation. 

This is just a preliminary design and is definitely going to change. I could not start the coding without a blueprint, i felt clueless.

So, before everything, i started with building the directories for these 5 system. Then the next step was to download inky editor and the [Ink Integration for unity](https://assetstore.unity.com/packages/tools/integration/ink-integration-for-unity-60055). Followed by downloading and importing the package into my unity project. 

Now we begin with Dialogue System.

The design is very much based on Rainman's implementation. 

### <mark style="background: #ADCCFFA6;">GameEventsManager</mark>
The <mark style="background: #ADCCFFA6;">GameEventsManager</mark> is the **central hub** for all events in your game. It allows different systems (e.g., Dialogue, Quest, Player, UI) to communicate without needing direct references to each other.

The only worthwhile code snippet is this one in the whole script. And is explained below more to as a reference for my own sake.
```
public static GameEventsManager instance { get; private set; }

```

`public static GameEventsManager instance { get; private set; }`:

- This creates a **static property** that other scripts can access to get the instance of the <mark style="background: #ADCCFFA6;">GameEventsManager</mark>.
- The `private set` ensures that only the <mark style="background: #ADCCFFA6;">GameEventsManager</mark> itself can set the instance.

Next we start with the creating Event classes for all the systems.
![](Misc/Pasted%20image%2020250225202449.png)

![](Misc/Pasted%20image%2020250225180613.png)

The gist of  events flow between systems is as follows:

### <mark style="background: #ADCCFFA6;">DialogueManager</mark>
**Triggers**:    
- `onEnterDialogue`: When dialogue starts.        
- `onDisplayDialogue`: When dialogue text and choices are displayed.        
**Listens**:    
 - `onSubmitPressed`: When the player presses the submit button (e.g., to continue dialogue).

### <mark style="background: #ADCCFFA6;">UIManager</mark>
**Listens**:    
- `onDisplayDialogue`: Updates the UI to show dialogue text and choices.

### <mark style="background: #ADCCFFA6;">InputManager</mark>
**Triggers**:    
- `onSubmitPressed`: When the player presses the submit button. 

### <mark style="background: #ADCCFFA6;">QuestManager</mark>
**Triggers**:    
- `onQuestCompleted`: When a quest is completed.

### <mark style="background: #ADCCFFA6;">PlayerManager</mark>
**Listens**:    
- `onQuestCompleted`: Updates player stats (e.g., grants XP).

###  <mark style="background: #ADCCFFA6;">DialogueManager</mark>

The code has been uploaded for this commit. Below is the breakdown, for the current version. 
#### **Variables**
- **`inkJSONAsset`**: The compiled Ink story (`.json` file).    
- **`story`**: The Ink `Story` object that manages the dialogue flow.    
- **`dialoguePlaying`**: Tracks whether dialogue is currently active.
#### **Event Subscriptions**
- **`OnEnable`**: Subscribes to `onEnterDialogue` and `onSubmitPressed` events.    
- **`OnDisable`**: Unsubscribes from events
#### **EnterDialogue**
- Starts dialogue from a specific **knot** (e.g., `"start"`).    
- Triggers the `DialogueStarted` event.    
- Calls `ContinueDialogue` to display the first line of dialogue.
#### **SubmitPressed**
- Handles the submit button press during dialogue.(UI element will be added later)
- Calls `ContinueDialogue` to progress the dialogue.
#### **ContinueDialogue**
- Continues the Ink story and displays the next line of dialogue.    
- If there are choices, they are passed to the `DisplayDialogue` event.    
- If the story ends, calls `ExitDialogue`.
#### **ExitDialogue**
- Ends the dialogue and triggers the `DialogueFinished` event.

### <mark style="background: #ADCCFFA6;">EventTester</mark>
A testing script to verify the functioning. And for this we add some console printing statements in <mark style="background: #ADCCFFA6;">DialogueManager</mark> as well.

## Scene in Unity
Create Empty game objects and assign <mark style="background: #ADCCFFA6;">DialogueManager</mark>, <mark style="background: #ADCCFFA6;">GameEventsManager</mark>, <mark style="background: #ADCCFFA6;">EventTester</mark>

Next we move the <mark style="background: #ADCCFFA6;">GameEventsManager</mark> up in Script Execution Order.
Edit > Project Settings > Script Execution Order move it above Default time with -50. To ensure that the Event Manager is initialized.
