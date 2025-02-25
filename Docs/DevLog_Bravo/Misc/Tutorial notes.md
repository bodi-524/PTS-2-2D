The initial part is based on Rainmans [video](https://www.youtube.com/watch?v=l8yI_97vjZs&t=1472s). My actual implementation starts from [Code for our project](#Code%20for%20our%20project). 

The codebase is based on the tutorial by [Rain Studio](https://www.youtube.com/@ShapedByRainStudios)

We use high design pattern
## Event Driven Architecture
A robust system
 
### Features 
- Dialogue system with choices
- Trigger actions from dialogue
- Condition dialogue
- Typing text
- Save & Load dialogue state

3 key features/requirements are
1. Branch the dialogue using choices
Allow player to choose a different pathway, or create new quest based on choices
2. Trigger things/actions from the dialogue
Have consequences for choice; specifically affect trait points based on choices
3. Conditional dialogue
Show different dialogues based on what is happening in the game
 

[Ink](## A narrative scripting language for games.) :  A narrative scripting language for games.
We use this for writing the dialogue logic.

#### <mark style="background: #ADCCFFA6;">DialogueManager.cs</mark>
For the main story and a mother ship that communicates with all other scripts

We pass the name of  the knot when we  so we can get into a particular dialogue when interacting with different NPC.

#### <mark style="background: #ADCCFFA6;">DialoguePanelUI.cs</mark>

To Display the Dialogue and choices to the player 
```
EnterDialogue<string knotName>
```
In the start it hides the UI; apparently this might not be needed for my implementation.

When we start the dialogue; <mark style="background: #ADCCFFA6;">DialogueManager</mark> will send the <mark style="background: #BBFABBA6;">DialogueStarted</mark>  Event to inform every component that dialogue has started. 
UI activates; 
The story object inside the <mark style="background: #ADCCFFA6;">DialogueManager</mark> will give out a single statement at a time including the choices

Then we send out an event called <mark style="background: #BBFABBA6;">DisplayDialogue </mark>method to display dialogue and choices.

 We <mark style="background: #BBFABBA6;">Send the UpdateChoiceIndex</mark> event with the choice
 ```
 <int index>
```
back to <mark style="background: #ADCCFFA6;">DialogueManager</mark>

so when the player selects a choice we know and can continue to the next path of dialogue.

It repeats until story runs out of dialogue
That is when we send out the <mark style="background: #BBFABBA6;">DialogueFinished</mark> event from <mark style="background: #ADCCFFA6;">DialogueManager</mark> to say that its done!


To Trigger action from the choices, we can bind a C# function to the story and when that happens, we call it directly from the ink file :p 

Eg: used by Rainman <mark style="background: #FFF3A3A6;">StartQuest</mark>, <mark style="background: #FFF3A3A6;">AdvanceQuest</mark> and <mark style="background: #FFF3A3A6;">FinishQuest</mark>


 For conditional dialogue; we can declare variables in the ink file and check if the conditions are met to start a dialogue tree or not
 In C# we can keep track of current value of all those variables depending on what is happening in the game.
 We will use and event <mark style="background: #BBFABBA6;">UpdateInkDialogueVariable</mark> 
```
 <string name, Ink.Runtime.Object value>
```
that can sent out by any script and <mark style="background: #ADCCFFA6;">DialogueManager</mark> will update the C# dictionary. C# dictionary then sets the variable value in the Story object -> ink 

An example of a recurring question, until user chooses the correct option

```
-> knot_alpha
=== knot_alpha===
Why are you gae ?
* Yes
	Cool, its not wrong, its the 21st century
	-> END
* No! what made you think that
	Really boi!
	-> knot_alpha
+ No, you are gae
	Why are you projecting your insecurities on me fam.
	-> knot_alpha
```

We can design a quest system, to keep track of all the dynamic variables.
![](Docs/DevLog_Bravo/Misc/Pasted%20image%2020250222082535.png)
Well Ackchyually, since my game does not use the top down movable contraption, we need to redesign the quest system; and i am going to call it the StatSystem or something.
And it will have similar functionality.
![](Docs/DevLog_Bravo/Misc/Pasted%20image%2020250222083040.png)
Quest Progress state is tracked in <mark style="background: #ADCCFFA6;">QuestState.cs</mark>
Rename it to <mark style="background: #ADCCFFA6;">StatState.cs</mark> and track HP, Mana etc. 

Rainman has a <mark style="background: #FFF3A3A6;">Quest</mark> Object that is managed and kept up to date by <mark style="background: #ADCCFFA6;">QuestManager.cs</mark> 
The whole thing works with the Events managed by <mark style="background: #ADCCFFA6;">GameEventsManager.cs</mark> which is a singleton that can be called to send or subscribe to any of the events.

Also rainman has set the Execution order of  <mark style="background: #ADCCFFA6;">GameEventsManager.cs</mark> above so we can subscribe to events with <mark style="background: #FFF3A3A6;">OnEnable()</mark> on startup itself
![](Docs/DevLog_Bravo/Misc/execOrder.png)

And to facilitate the movement in quests there are events set up in  <mark style="background: #ADCCFFA6;">QuestEvents.cs</mark> that allow to start, advance and finish Quest that move the quest from state for particular id. 
There is also <mark style="background: #BBFABBA6;">QuestStateChange</mark> event that is sent out whenever a state is changed

#### Context
Adding an idea of context to events. to prevent unwanted button press for events that can affect multiple values at once, will pass a enum value for the context
like DEFAULT, DIALOGUE, etc.

And thus any script that takes in the event will have the context to determine if they should handle it or not. 

Now, we create the UI and start linking it. 

