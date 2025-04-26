/*--------------------------------------------
The first script of the proto version
Last edited : 28-03-2025
It is the starting point of story;
--------------------------------------------*/
//{location(" ")}
=== big_bang ===
~ SetLocation(" ??? ")
<i> You open your eyes... 
You are {location("surrounded by nothing.")}
{location("An empty void")}, a place where nothing exist.</i> 

- <i>It seems like a dream, thats when some thoughts start popping in your head</i>

- <i>It all started with {foreshadow("My father")}</i>

- (opts_a1)
*  <i>[I must've got my pimpin' genes from him;  the way he left my momma . . .]</i>
-> opts_a1

* <i>[But I can't remember my Dad, wait wtf . .  who is my father, who am I, where am I ?]</i>
    - - "Is this a simulation ??"
    * * "Naah, thats absurd, but i can't seem to recall, where am I. who am I . Why was i thinking about my father"
    ~ AdjustMatrixAwareness(-1)
    《 Awareness decreased 》
    -> opts_a1

    * * (sim) "[{foreshadow("Interesting, maybe . . . ")}]"
    ~ AdjustMatrixAwareness(1)
    《 Awareness increased 》
    -> opts_a1

* [<i>How long does buying milk take, did he go on the dragon milk quest?</i>]
-> fateful_encounter_1

=== fateful_encounter_1 ===

= meeting_hitogami
- <i>Just when you were contemplating about your {foreshadow("father's")} milk purchasing skills, you hear something.</i> // Approach 2 to use i tags in 3 places, check which works
~ SetLocation("Void")
{hito("Greeting young padowan, the force is strong within you. - an Ominous voice")}
* [Amazed]"Am i hearing shit . . . Ayo wtf! It stopped. God! this is a weird dream"

- {hito("Child, this is not a dream . . .")} // Something is wrong here, it seems the choice is of ominous voice
* "Oh! . . . Are you God?"

- {hito("Pfft... Ahem! Consider me a guide.")}
* "Sounds suspicious"
    
    - - {hito("Why would you say that ?")}
    * * "Prove yourself"
        
        - - - {hito("I have no moral obligation to prove anything to you child")}
        * * * "Thats what a imposter would say"
            
            - - - - {hito("You can beleive me or not child, the facts remain the same(sounding a bit frustated)")} 
            * * * * "Alright, what is this place, why am i here, what is my purpose, and why can't I remember anything of my past?"
            -> explaination_hitogami
        
        * * * {big_bang.sim} "As if it is out of ordinary, is this some sort of simulation or a game?"
        ~ AdjustMatrixAwareness(1)
        《 Awareness increased 》
        -> explaination_hitogami
    
    * * "Um ... I don't know." - I say acting confused
        
        - - - {hito("HAHAHA, what an interesting child")}
        * * * . . .
        ->explaination_hitogami
    
= explaination_hitogami

- {hito("This is the world of {location("Aldarast")}, where you your choices determine the destiny . . .")}
* "Interesting"
{pmoral("《 Compassion increased 》")}
{pmoral("《 Courage increased 》")}
~ AdjustCompassion(1)
~ AdjustCourage(1)

* "Boring, make it more beleivable atleast"
{nmoral("《 Insensitivity increased 》")}
{nmoral("《 Cautiousness increased 》")}
~ AdjustInsensitivity(1)
~ AdjustCaution(1)

- {hito(". . . Here, you will encounter multiple situations, that would demand you to make choices, you have the liberty to choose what you deem to be appropriate.")}

- {hito("Nevertheless, those choices will bear consequences. Some consequences will have little to no effect, but some would have world altering effects. So be vary.")}

- {hito("What do you wish to know")}
* "Please explain to me about this world" 
-> explanation_world

* "Please explain to me about the populus of this world" 
-> explanation_factions

* {big_bang.sim} "This is a weird game, can we just start" 
~ AdjustMatrixAwareness(1)
《 Awareness increased 》
-> next_alpha

* "How about you give me a lot of money"
~ AdjustGreed(1)
{nmoral("《 Greed increased 》")}
~ AdjustMatrixAwareness(-1)
{nmoral("《 Awareness decreased 》")}
-> next_alpha

=explanation_world
- {hito("{location("Aldarast")}, a fantasy world with multiple races and magic. There is a tragic past filled with war and ...")}
* "What happened in the past, tell me about that ?"
    
    - - {hito("Hmmm. .  Where should i begin, okay. . .")}
    {hito("Long ago, all different races lived harmoniously in isolation with neutral relations and general trading of goods, then everything changed when the Demons attacked...")}
    * * \(Isn't that Avatar) - thinking
        
        - - - {hito("...the demons summoned a powerful demon fox, it's nine tail's lashing in every direction, smashing mountains and sending tidal waves crashing the shores . . .")}
        * * * "Come on! seriously?"
            - - - - {hito("Shut your mouth and don't interrupt me again, So there are many factions, who fought amongst each other. There were alliances for convenience formed, but there was no scope of peace amongst them. There was fear amongst all, the average lifespan was short, the economy was in shambles, it was not a life worth living for any alive soul. A peaceful future was not in sight ...")}
            * * * * "...""
            
            - - - -{hito("It felt as if, in the grim darkness of the far future. There will be only war!")}
            * * * * "Dude!"
            
            - - - -{hito("The senseless killing, resulted in sense of collective hatred towards demon race; It united all the other races, they decided to band together and form an alliance.")}
            * * * * "Yeah!"
            
            - - - - {hito("After a decade long conflict, the demons were defeated, the casualities suffered by each faction were high. But the alliance of convenience was eventually broken, followed by a truce amongst all parties. The cultural differences did not allow for assimilation and a friendly co-existence.")}
            * * * * "What factions were involved ?" 
            -> explanation_factions
            
            * * * * "Cool. Can we just start now."
        ->next_alpha
        
=explanation_factions
-{hito("There are good amount of races in the world of {location("Aldarast")}. Most of them are bipedals, and some quadrupedal. Which one interests you?")}
* "Just give me a gist of all"
    
    - - {hito("The most generic, the humans. They have more subclasses based on their affinity to magic. But we won't go much deeper into that.")}
    
    - - {hito("Elves, they mostly live in {location("forests")} and are isolationist.They have ranged weapons speciality and some have magic affinity as well. There are different factions among elves with some cultural differences. Reports state there are two factions and they both reside in {location("forests")}. Namely, Forest elves and Alpine elves located at {location("white moon glade(central region)")} and {location("Twilight blossom grove(east region)")}.")}
    
    - - {hito("Begros, they live {location("close proximity to elves")}, they are basically bipedal beasts. They have little to no magic affinity but have high physical prowess with exceptional agility. They were considered extinct in the war. But lately, some sightings have been reported by traders along the {location("White moon glade")}.")}
    
    - - {hito("Orcs, they live in the arid deserts. They do not engage with other races, unless forced too. Not many approach them because of their crude looks and intensity. They don't possess any sort of elemental magic affinity but are robust and powerful physically. They have a settlement in the South west corner. ")}
    
    - - {hito("Centaurs, have not been seen for a long time. They live in {location("arid plateaus of Molons in the west expanse")}. They have quadrupedal, if that wasn't obvious. They don't have elemental magic affinity as well, but have astronomical quickness! They are located at the {location("western region")}.")}
    
    - - {hito("Witches, were human researchers of the late human faction, they have exceptional mental provess, they have secluded themselves from general human populus. No living soul has seen them for a long time+, there are rumours they live in the {location("South-East region, somewhere along the Ruins of Northhaven")}.")}
    
    - - {hito("Demons, they have been reported to be extinct, after the conclusion of holy avengement war between the alliance and demons.")}
    
    - - {hito("Dragons, mythical creatures that were provided their timely support during holy avengement war. Regarded as Gods and protectors. After the conclusion of war they disappeared and no sightings have been reported.")}
    {hito("These are all the factions in {location("Aldarast.")}")}
    * * "Cool, can we start already, i am bored"
    -> next_alpha
    
    * * "Wow! there are so many factions! Can i join any of them?"

        - - -{hito("No, but you can certainly interact with them, and form amity or animosity with them.")}
        * * * "So, will i spawn as a slime or something?"
            
            - - - - {hito("Hmm. . . I wonder")}
            ->next_alpha
        
        * * * "Can you explain the world to me. I skipped that."
        -> fateful_encounter_1.explanation_world


=== next_alpha

<i>A brilliant white aura surrounds you as an ancient runic circle materializes beneath your feet, its arcane symbols pulsing with power in a language long forgotten. You hear a huge humming noise. "What is happening !?"
The blinding radiance intensifies until your vision is consumed by pure whiteness. Then, consciousness returns as you awaken.</i>

-> Thou_art_Awakened

