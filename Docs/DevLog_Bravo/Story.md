
I will paste some prompt responses, that seem relevant of my approach below. 

**Phase 1: The Narrative Core (Ink-Centric)**

**Focus:** First, prioritize the narrative flow and structure _within Ink_.    
**Approach:**    
1. **Outline the Main Story:** Write a high-level outline of the main story arc, including major plot points, choices, and potential branches.
2. **Chunk the Story:** Divide the main story into logical sections or chapters. These will become your primary modules. Each section should have:
	- A starting point (an Ink knot).
	- A series of events/dialogues.
	- Potential branching points.
	- An ending point (another Ink knot).
3. **Prototype a Section in Ink:** Choose one of these sections and write it out _completely_ in Ink. Focus on:
	- **Core Dialogue:** Create the main dialogue interactions.
	- **Choice Points:** Implement the most important choices in this section and how they diverge the narrative.
	- **Variables:** Introduce Ink variables to track player choices, character relationships, and any other important factors.
	- **Test** Test this section of code in unity.
4. **Define Key Variables:** As you write, keep track of the key Ink variables you're using. These variables will become your "interface" between Ink and your C# code.
5. **Define knots**: Have a clear name for each knot and what is its function.
**Why This First?:** By focusing on Ink first, you're solidifying the most unique and vital part of your game: the story. It will guide all subsequent system design.
    

**Phase 2: The Quest and Progression Layer**
**Focus:** Create a system to link the Ink modules together and guide players through the story.
**Approach:**
1. **Quest as Narrative Chunks:** Think of quests as the formal containers for the Ink modules.
2. **Quest Structure:** A quest will essentially consist of:
	- **Entry Point:** The Ink knot where the quest starts.
	- **Progression Knots:** The Ink knots that mark the "checkpoints" or stages within the quest.
	- **Exit Point:** The Ink knot where the quest ends.
3. **Minimalist Quest Data:** Keep the quest data itself simple. You need:
	- A unique ID.
	- A starting Ink knot.
	- A list of "progression knots" (or requirements in the original idea).
	- An ending knot (or a "completed" flag).
4. **Quest Manager (Simplified):** Your quest manager is now just a navigator. It:
	- Starts a quest (enters the starting Ink knot).
	- Tracks which "progression knots" have been reached.
	- Knows when the ending knot has been reached (quest complete).
	- Determines which quest to start next, based on previous choices.
5. **No More Complex Quest Requirements (Initially):** Initially, forget about complex "kill X monsters" or "collect Y items" requirements _within_ a quest. If those things are part of the story, handle them _within Ink_ as dialogue and choices.
6. **Link quest and story**: Each quest should follow the story, not the opposite.
7. **Flow**: The flow will be as follow. The player starts a quest, the player is directed to ink, there, a series of dialogues and choices. After each choice or sequence of dialogues, the system should check if it advance the quest. Once completed, the quest will finish.
**Why This Second?:** This phase ensures the player is guided through the story you've created. It simplifies the quest system so that it works for you, not against you.

**Phase 3: Hero Class Integration**
**Focus:** Inject hero class differences into the narrative.    
**Approach:**    
1. **Class-Specific Variables:** Decide on a few key Ink variables that will represent the player's class (e.g., `player_class = "Warrior"`, `player_class = "Mage"`).
2. **Class-Based Story Sections:** In Ink, you will create entire sections or smaller lines of dialogue that are conditional on these variables.
	`if (player_class == "Warrior") { ... } else if (player_class == "Mage")`
	`if (player_class_mage_quest1Completed){}`
3. **Class-Specific Quests:** Some quests could be exclusive to certain classes. You'd manage this in your Quest Manager.
4. **Link to stats:** Link the choices and dialogues of each class to the stats.
5. **Early Implementation:** Even if you only have a few class-specific lines at first, this starts the process of class differentiation.
**Why This Third?:** This is a layer on top of your core story. Get the story and basic progression working first.
    

**Phase 4: Advanced Features (Iteration)**
**Focus:** Refine and expand.    
**Approach:**    
1. **Complex Requirements (If Needed):** _After_ you have the core system working, consider adding back in complex requirements (kill X monsters, collect Y items) if they make sense within the story. You would handle them with `Requirement` class, as we discussed earlier.
2. **Consequences:** Track major player choices over time. Show how they affect the world and later quests.
3. **Refine Class Differentiation:** Make class differences more dramatic and meaningful.
4. **Polish the Ink:** Go back and make the dialogue writing as strong as possible.
5. **Test** Test everything.
**Why This Last?:** This phase is all about taking your already functional game and making it even better.


I intend to utilize this approach for the next steps in the development. 

Decided to have the morality and personality traits to use![](Misc/Pasted%20image%2020250305155028.png)https://pixabay.com
For royalty free images, music.

The approach has changed, its 11-03-2025.
Some big changes were made. The decision to use function and variables inside has been discarded. I will be declaring them in C# and then use the event system to update them whenever we change them. To be more precise, a function call will be done in the ink script and that would generate an event which will call the function and then it will be updated in c#. 
Been thinking about discarding the Quest system, since it is illogical for a linear story, i mean i can use it for a quest progress bar and a quest list. But should i, not in the proto anyways.
A bit of UI revamp would be needed, still thinking about how to implement the Fight algorithm. Lately, an idea of using hardcoded choice based fight system seems to be a good option. 
I would just have to code up a choice based knot and make conditionals based on variables or whatever. OR maybe i should code a script for a more generalized. 
Proto will be skipping that and moving along with the story. 

## Opposing Traits
![](Misc/Pasted%20image%2020250312091806.png)These are the current version, added one more, they have been implemented and are part of the story, though need a bit of finetuning.
I was thinking about the approach i should take for a seamless integration. I came across 2 approaches. 
Approach 1 :  Start the game with player having 5 points for each morality trait and let them go along with the story. Story will put them in situations to choose and the nature of the choice will determine the changes to the traits. This is the current approach I am taking. 
Approach 2 : Start the game with player having 0 points for each morality traits and let there be 10 questions for each opposing pair. 

Initially while planned, I had the approach 2 in mind. But while implementing, I just went along with the story. The flow does not allow for there to be random insertions for each trait pair. And in my opinion approach 1 feels more refined for a natural flow of story but not balanced for a game. I mean, most of the choices are on the compassion and courage(initially). 
Will go with the Approach 1, if I feel like. I will just superimpose Approach 2 and make it like one of those psychology survey. 


Docs for unity ink 
https://github.com/inkle/ink/blob/master/Documentation/RunningYourInk.md

Faced some major issues with linking it with the c#. This helped. 


Finally, some sort of basic functionality has been achieved. 
![](Misc/Pasted%20image%2020250321141941.png)![](Misc/Pasted%20image%2020250321142029.png)The story is now displayed as an scrollable element. 
And the choices are displayed below. 
Much more editing is needed. But i am glad I at least achieved this much. 
Phew!

30 March
The code is working fine( some basic debugging), will do some qol feature additions like type writer effect. There is a need for uniformity for trait selection too. Currently it is 

| Sr. No. | Traits +ve | Max | Traits -ve    | Max |
| ------- | ---------- | --- | ------------- | --- |
| 1       | Honesty    | 3   | Deception     | 4   |
| 2       | Compassion | 3   | Insensitivity | 4   |
| 3       | Honor      | 1   | Greed         | 1   |
| 4       | Courage    | 3   | Cautiousness  | 2   |
| 5       | Aware +ve  | 4   | Aware -ve     | 2   |

So I need all of them to be 5 ideally. Now i can adjust it in the next episode. Or I can force some changes in the narrative to . . . 
"What can be done tomorrow should be done tomorrow" 

I will state the next tasks. There is a need to separate the stages into episodes, currently the  first mission is a bit too long, and the story proceeds with multiple scenes, so I will divide it into 2 episodes. The nomenclature is not yet decided, but I think episodes make more sense. 

Also, I decided some sort of color coding for the specific words. I felt it to be more generic. I got a pallete for this https://lospec.com/palette-list/island-joy-16. But the thing is, it was not looking great. So i changed them. And it was still not visible, do added 0.1 px outline for the text. It looks okay. 
The current background is just a placeholder, So, i think i need to start using some assets into the project as well. 

| Sr. No. | Description                 | Colour code                                                    |
| ------- | --------------------------- | -------------------------------------------------------------- |
| 1       | Positive Morality <br>Trait | <big><span style="color: #6BFF6E;">■</span></big><br>\#6BFF6E  |
| 2       | Negative Morality <br>Trait | <big><span style="color: #FC567A;">■</span></big> <br>\#FC567A |
| 3       | Location                    | <big><span style="color:#4DE1FF;">■</span> </big><br>\#4DE1FF  |
| 4       | Weapons                     | <big><span style="color:#7C66FF;">■</span></big> <br>\#7C66FF  |
| 5       | Charismatic interactions    | <big><span style="color:#FFE75C;">■</span> </big><br>\#FFE75C  |
| 6       | Fights                      | <big><span style="color:#FF3885;">■</span></big> <br>\#FF3885  |
| 7       | Foreshadowing               | <big><span style="color:#F082FF;">■</span></big> <br>\#F082FF  |
| 8       | Ominous voice               | <big><span style="color:#8FB8FF;">■</span> </big><br>\#8FB8FF  |
| 9       | Writer                      | <big><span style="color:#F59D67;">■</span> </big><br>\#F59D67  |
I used functions in ink directly to introduce colour coding, I think it was genius because if one colour doesn't strike as good, I can just change it in the function. 

There is also a need for clearing the story, since the current one just keeps on going in the text box, i made it scrollable. 
