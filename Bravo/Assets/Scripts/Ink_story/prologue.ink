/*-----------------------------------------------
The first script of the proto version
Last edited : 11-03-2025
It is the starting point of story;
-----------------------------------------------*/


=== big_bang ===
~ SetLocation("Void")
You open your eyes...
You are surrounded by nothing.
An empty void, a place where nothing exist.

(1st)
- It seems like a dream, thats when some thoughts start popping in your head
* . . .
-> 1st

- It all started with
* my father
    
- (opts_a1)
    *  [I must've got my pimpin' genes from him;  the way he left my momma . . .]
    -> opts_a1
    * [But i can't remember my dad, wait wtf . .  who is my father ?]
        - - Is this a simulation ??
        * * Naah, thats absurd
        ~ AdjustMatrixAwareness(-1)
        <i> Awareness decreased </i>
        -> opts_a1
        * * (sim)  [Interesting, maybe . . . ]
        ~ AdjustMatrixAwareness(1)
        <i> Awareness increased </i>
        -> opts_a1
    
     * [How long does buying milk take, did he go on the dragon milk quest?]
    
-> fateful_encounter_1


=== fateful_encounter_1 ===

= meeting_hitogami
- Just when you were contemplating about your father's milk purchasing skills, you hear something. 
"Greeting young padowan, the force is strong within you." - Ominous voice
* "Am i hearing shit . . . "
-  . . .
* "Ayo wtf! It stopped. God! this is a weird dream"

- "Child, this is not a dream . . ." - Ominous voice
* "Oh! . . . Are you God?"

- "Pfft... Ahem! Consider me a guide." - Ominous voice
* "Sounds suspicious"
    - - "Why would you say that ?" - Ominous voice
    * * "Prove yourself"
        - - - "I have no moral obligation to prove anything to you child" - Ominous voice
        * * * "Thats what a imposter would say"
        - - - - "You can beleive me or not child, the facts remain the same"-Ominous voice sounding a bit frustated
        * * * * Alright, what is this place, why am i here, what is my purpose?
        -> explaination_hitogami
        * * * {big_bang.sim} " As if it is out of ordinary, is this some sort of simulation or a game?"
            ~ AdjustMatrixAwareness(1)
            <i> Awareness increased </i>
        -> explaination_hitogami
    * * "Um ... I don't know." - I say acting confused
        - - - "HAHAHA, what an interesting child" - Ominous voice
        * * * . . .
        ->explaination_hitogami
    
= explaination_hitogami
- "This is the world of Aldarast, where you your choices determine the destiny . . ."- Ominous voice
    * "Interesting"
    <i> Compassion increased </i>
    <i> Courage increased </i>
    ~ AdjustCompassion(1)
    ~ AdjustCourage(1)
    * "Boring, make it more beleivable atleast"
    <i> Insensitivity increased </i>
    <i> Cautiousness increased </i>
    ~ AdjustInsensitivity(1)
    ~ AdjustCaution(1)

- ". . . Here, you will encounter multiple situations, that would demand you to make choices, you have the liberty to choose what you deem to be appropriate."

- "Nevertheless, those choices will bear consequences. Some consequences will have little to no effect, but some would have world altering effects. So be vary."- Ominous voice

- "What do you wish to know"- Ominous voice
    * "Please explain to me about this world" 
    -> explanation_world
    * "Please explain to me about the populus of this world" 
    -> explanation_factions
    * {big_bang.sim} "This is a weird game, can we just start" 
    ~ AdjustMatrixAwareness(1)
    <i> Awareness increased </i>
    -> next_alpha

=explanation_world
- "Aldarast, a fantasy world with multiple races and magic. There is a tragic past filled with war and ..."- Ominous voice
    * "What happened in the past, tell me about that ?"
    - - "Hmmm. .  Where should i begin, okay. . .
    Long ago, all different races lived harmoniously in isolation with neutral relations and general trading of goods, then everything changed when the Demons attacked..."- Ominous voice
    * * \(Isn't that Avatar) - thinking
        - - - "...the demons summoned a powerful demon fox, it's nine tail's lashing in every direction, smashing mountains and sending tidal waves crashing the shores . . ."- Ominous voice
        * * * "Come on! seriously?"
        - - - - "Shut your mouth and don't interrupt me again, So there are many factions, who fought amongst each other. There were alliances for convenience formed, but there was no scope of peace amongst them. There was fear amongst all, the average lifespan was short, the economy was in shambles, it was not a life worth living for any alive soul. A peaceful future was not in sight ..."- Ominous voice
        * * * * ...
        - - - -"It felt as if, in the grim darkness of the far future. There will be only war!"- Ominous voice
        * * * * "Dude!"
        - - - -"The senseless killing, resulted in sense of collective hatred towards demon race; It united all the other races, they decided to band together and form an alliance."- Ominous voice
        * * * * "Yeah!"
        - - - - "After a decade long conflict, the demons were defeated, the casualities suffered by each faction were high. But the alliance of convenience was eventually broken, followed by a truce amongst all parties. The cultural differences did not allow for assimilation and a friendly co-existence."
        * * * * "What factions were involved ?" 
        ->explanation_factions
        * * * * Cool. Can we just start now. 
        ->next_alpha
        
=explanation_factions
-"There are good amount of races in the world of Aldarast. Most of them are bipedals, and some quadrupedal. Which one interests you?"- Ominous voice
* "Just give me a gist of all"
    - - "The most generic, the humans. They have more subclasses based on their affinity to magic. But we won't go much deeper into that.
    - - Elves, they mostly live in forests and are isolationist.They have ranged weapons speciality and some have magic affinity as well. There are different factions among elves with some cultural differences. Reports state there are two factions and they both reside in forests. Namely, Forest elves and Alpine elves located at white moon glade(central region) and Twilight blossom grove(east region).
    - - Begros, they live close proximity to elves, they are basically bipedal beasts. They have little to no magic affinity but have high physical prowess with exceptional agility. They were considered extinct in the war. But lately, some sightings have been reported by traders along the White moon glade.
    - - Orcs, they live in the arid deserts. They do not engage with other races, unless forced too. Not many approach them because of their crude looks and intensity. They don't possess any sort of elemental magic affinity but are robust and powerful physically. They have a settlement in the South west corner. 
    - - Centaurs, have not been seen for a long time. They live in arid plateaus of Molons in the west expanse. They have quadrupedal, if that wasn't obvious. They don't have elemental magic affinity as well, but have astronomical quickness! They are located at the western region.
    - - Witches, were human researchers of the late human faction, they have exceptional mental provess, they have secluded themselves from general human populus. No living soul has seen them for a long time+, there are rumours they live in the South-East region, somewhere along the Ruins of Northhaven.
    - - Demons, they have been reported to be extinct, after the conclusion of holy avengement war between the alliance and demons.
    - - Dragons, mythical creatures that were provided their timely support during holy avengement war. Regarded as Gods and protectors. After the conclusion of war they disappeared and no sightings have been reported.
    These are all the factions in Aldarast." - Ominous voice
    * * "Cool, can we start already, i am bored"
    -> next_alpha
    * * "Wow! there are so many factions! Can i join any of them?"
        - - -"No, but you can certainly interact with them, and form amity or animosity with them." - Ominous voice
        * * * "So, will i spawn as a slime or something?"
        - - - - "Hmm. . . I wonder" 
        ->next_alpha
        * * * "Can you explain the world to me. I skipped that."
        -> fateful_encounter_1.explanation_world


=== next_alpha

A brilliant white aura surrounds you as an ancient runic circle materializes beneath your feet, its arcane symbols pulsing with power in a language long forgotten. You hear a huge humming noise. "What is happening !?"
The blinding radiance intensifies until your vision is consumed by pure whiteness. Then, consciousness returns as you awaken.

-> Thou_art_Awakened

