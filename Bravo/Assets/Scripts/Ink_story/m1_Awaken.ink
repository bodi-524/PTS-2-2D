/*-----------------------------------------------
The second script of the proto version
Last edited : 11-03-2025
It is the starting point of story; Where it all began
-----------------------------------------------*/


/*------------------------------------------------- 
Debug statements, for personal use only

Post check Courage : {courage}; Caution : {caution}
------------------------------------------------- */

VAR clothes = ""

=== Thou_art_Awakened ===
~SetLocation("Some dark place")
TODO: Need to paraphrase to give a more fantasy feel
You wake up surrounded by filth and husk, 
there is a particular animal musk, a darkness surrounding you, it restricts your vision. 
There are torches hanging on a central pillar of what seems to be a <color=\#aa1234> small barn </color>.
You turn your gaze downwards and see you are wearing 
* I am wearing a dirty robe that covers my body, some cheap-looking bracelets & rings with worn-out gems.
    -> i_wanna_build_a_mage
* I am wearing an average looking shirt and a pants with suspenders, a staple for nobles.
    -> i_wanna_build_a_noble
* I am wearing nothing
    -> i_wanna_build_a_wtf
    
= i_wanna_build_a_mage
~ clothes = "magician robe"
-> barn_stint_son

=i_wanna_build_a_noble
~ clothes = "noble attire"
-> barn_stint_son

=i_wanna_build_a_wtf
~ clothes = "nothing"
-> barn_stint_son

=barn_stint_son
~ SetLocation("Barn")
You sit down to look around the barn, you are just wearing boots and <>{clothes}
What do you do next ?
* Get up and explore the dark and unknown area
    ~ AdjustCourage(1)
    <i> Courage increased </i>
    // Post check Courage : {courage}; Caution : {caution}
    -> dora_da_explora
    
* Call for help, see if someone responds
    ~ AdjustCaution(1)
    <i> Caution increased </i>
    You wait for some time, but no one shows up.
    "Guess its too early"
    You go towards a large container with water and start to clean the filth of your boots and {clothes}
    -> help_me_waifu_1

* Ignore it, and go to sleep
You go to sleep for 5 more minutes
    -> snorlax

=dora_da_explora
You get up in the low light conditions,  {i_wanna_build_a_wtf: you feel the coldness in the temperature, since you are naked} and start exploring the surroundings. 
You see there are multiple animals in the barn, from horses to cows. A peculiar sound catches your attention. It seems like a animal crying for help, you start walking towards it. 
When you reach the corner of the barn, you see a white calf lying on the ground, shaking and crying for help. Another cow going restless in the next enclosure. Presumably its mother.
What do you do next ?
    * Try to save the calf. It seems the cold has seeped into the calf and its suffering from frostbite.{i_wanna_build_a_mage: I cover it with my robe} {i_wanna_build_a_wtf: I use my naked body to wrap myself around the calf} 
        ~ AdjustCompassion(1)
        <i> Compassion increased </i>
    -> imma_barbie_girl
    
    * Ignore the calf, start humming 'Furr' by 'pink guy'. "PETA on my dick, PETA on my dick. . ."
        ~ AdjustInsensitivity(1)
        <i> Insensitivity increased </i>
    -> imma_barbie_girl
    
    * Kick the calf. 
    "Your voice is annoying, be quiet!"
    The calf's cries more loudly, with pain.
    ~ AdjustInsensitivity(2)
        <i> Insensitivity increased </i>
    - - You hear rattling of enclosures, and a loud clank. You turn around to see, its a rampaging bull, running towards you. You succesfully dodge the bull's assault. 
    What will you do next ?
    * * Fight the bull
        - - - You initiate fight with bull
        TODO fight
        The implementation for this is pending, so you will move to the next stage automatically. Any inconveneince is deeply regretted.
        * * * "Yea whatever"
        -> imma_barbie_girl
        
    * * Utilize your classroom knowledge. Lie down, act dead.
    TODO Integrate some sort of achievement system.
        - - - You have unlocked the achievement <b>Dumb ways to die </b>. 
        The bull runs towards you with his horned head pointing toward ground, and scoops you up like one of those bob the builder machinations. 
        You feel the sensation of flying, it was shortlived. 
        - - - You fall down towards the ground, followed by some hoof massage.
        - - - Unalive feature activated.
        -> unalive_feature
    
    * * Run towards the bull enclosure and lock it.
        - - - You walk inside the bull enclosure and securely lock it. After catching your breath, you jump out of it and get out of that section of barn and lock it down.
            ~ AdjustCourage(1)
            <i> Courage increased </i>
        * * * "Phew! That was scary"
        ->imma_barbie_girl


=snorlax
The soft light that had been straining your eyes is now gone, as if something has shrouded it entirely. In the sudden absence, you feel a presence—something is near. But you ignore it and continue sleeping.
- After some time, the lingering putrid smell of the barn has grown more intense. You feel something warm on your face, you intinctively wipe it off your face and feel a weird sensation of something in semi-solid state like a sticky paste.
- By the time you come to your senses, the damage has already been done. You wake up to the sight of black hair dangling over your face. The realisation of that sensation and smell feels you with disgust, sadness and anger. 
    <i> Get shit on by horse <\i>
* Clean yourself
    -> imma_barbie_girl
* Try to kill the horse
    -> horse_killa
    
    
= imma_barbie_girl
You begin to wash yourself with the water from a nearby container. As you clean, you notice faint rays of sunlight filtering into the space. The cheerful chirping of birds fills the air, and you realize the soft glow outside is the first light of dawn breaking over the horizon. 
You move toward the window, peering outside to take in the view.
- Clustered before you are humble houses crafted from straw and timber, their design unmistakably reminiscent of a medieval age. The faint sound of footsteps reaches your ears, growing louder as someone approaches the barn. You turn toward the entrance, your gaze fixed, eager to catch a glimpse of the approaching figure."
* . . .
-> help_me_waifu_1

= horse_killa
-  You initiate fight with bull
    TODO fight
    The implementation for this is pending, so you will move to the next stage automatically. And inconveneince is deeply regretted.
    ->imma_barbie_girl

=help_me_waifu_1
You see the figure of a maiden approach. She has blonde hair covering her coral blue eyes. Here complexion is white as that of an angel. But her body is frail, she has dark circles around her eyes. You wonder if she is a helper at this place.
- You try to get her attention in the most meek way possible. Appearing small,non-threatening, bowing as low as possible with hands held high. 
* "Hello there. . ."
->help_me_waifu_2
* You scan the woman's figure top to down "Mmmm.. Mmmm.. MMMM!.. (shaking your head left to right with closed eyes) "Marvellous"

    - - The woman instinctively wraps her arms around her breasts, trying to hide them from your prying perverted gaze.
    * * "Forgive me my lady" - I get down on one knee with my head bowed down.
    ->help_me_waifu_2
    * * . . . \(wait for her to react)
    ->help_me_waifu_2
    
= help_me_waifu_2
- She is shocked to see me in the barn, the fear is visible from her expressions. She quickly takes glance at all possible exits. 
You realize her intentions, and back away from her,  giving her some space, so she would realize you are not a threat. {i_wanna_build_a_wtf: My lack of clothes is certainly not helping, you grab a pan and hide my jewels}
You try to sudbue her fears by the best smile you can muster, and signalling that you am not some lunatic. During your act and posturing, you slip over some horse shit and fall down on your face. You hear a faint giggling while you get back up. 
The blonde girl approaches me, and offers me a rag to wipe off the shit. You accept it, and says "Thanks"
- She helps you get up, and asks 
"Who are you, and why are you in my family's barn."
How do you reply ?
* Absurd lie
I, CATO SICKARIUS AM THE KNIGHT-CHAMPION OF MC-RAGE.
    - - "But all the holy knights perished in the holy avengement war. {i_wanna_build_a_wtf: why are you naked Sir}"
    * * "Ahem! No M'lady, I am not a knight of your puny kingdom, I am from the capital world of the stellar realm of Ultra-Mars, Mc-Rage!"
    ~ AdjustDeception(2)
    <i> Deception increased </i>
        - - -"That sounds made up."- Blonde girl says being suspicious.
        * * * "Hahaha, i was testing you. Of course its made up"
        ->Truth_seeker
        
* Truth
~ AdjustHonesty(1)
<i> Honesty increased </i>
->Truth_seeker

* Hit on her
    - - Sniffing the air, you turn your gaze towards the blonde girl.
    * * "Did you fart m'lady?"
        - - - "huh.." - Blonde girl with a poker face and a confused look.
        * * * "Cause you blew me away"
        <i> Rizz increased (it has no implication in the game though lmao. And this is pathetic game) </i>
            - - - - " I am sorry sir, i don't understand what you wish to imply " - Blonde girl replies and starts to turn around and walk away.
            * * * * Wait M'lady, that a sort of humourous retort, please forgive me
            ~ AdjustDeception(1)
            <i> Deception increased </i>
            ->Truth_seeker
            * * * * My apologies M'lady, that was just me admiring and appraising your God given looks, i beg for forgiveness to have offended you.
            ~ AdjustHonesty(1)
            <i> Honesty increased </i>
            ->Truth_seeker

=Truth_seeker
- You start to convey her the truth about your appearance in this world.
* "I have no idea how I came here. I had a weird dream, and when I woke up, I was at this barn, wearing boots & {clothes}.
    - - "Don't you remember anything from your past ?"- Blonde girl asks sympathetically
    * *  "No Madam."
        - - - "Hmm.. It seems you have lost your memory" - Blonde girl
        * * * "I have no way to refute that"
        You sit down on the ground. covered with husk. Seeing that, the blonde girl sits down on a husk bale.
        "This must be hard for you ..." - blonde girl
        ->explanation_rez
        
=explanation_rez
" If its not a bother, may I ask you some {explanation_world_2 ||explanation_who_am_i|| explanation_who_are_u: more}  questions {explanation_who_are_u: Rez|M'lady} " you ask her humbly

- {explanation_who_are_u: Rez|The blonde girl} nods
* Enquire about the world.
    You ask her about the world and factions, to correlate it with what the ominous voice said, and which faction area you have spawned in. 
-> explanation_world_2

* Ask about yourself
    You ask her if she knows anything about you in this world, or people who have spawned like yourself.
-> explanation_who_am_i
    
* Ask about her
-> explanation_who_are_u
        
=explanation_who_are_u
You ask her about her.
"Who are you ...?"
- "This property is owned by house Ella and I am Rednic Ella the first daughter of the house Ella. You can call me Miss. Rednic if you may, madam seems a bit too formal for my taste" - Miss Rednic replies with a faint smile.
*  You think that there is more you wish to know about her, but this much is good enough for now, any more would creep her out.
    ~ AdjustCompassion(1)
    <i> Compassion increased </i>
    "I would go with Rez"- I say with a wink. . .
    (Wondering what kind of pathetic lousy writing this. Seriously, you just reversed Cinderella) 
    ~ AdjustMatrixAwareness(1)
    <i> Awareness increased </i>
    {explanation_world_2 && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}

    
* "A first daughter, why you lie to me like that ? You carry yourself like a servant." I reply instinctively.
        ~ AdjustInsensitivity(1)
        <i> Insensitivity increased </i>
    Rez just nods and doesn't say anything.
        {explanation_world_2 && explanation_who_am_i : -> barn_stint_father | -> explanation_rez}

=explanation_world_2
~ SetLocation("Barn in Clearport")
{explanation_who_are_u: Rez|The blonde girl} explains to you about the history of Aldarast.
- "This is Clearport a city in Aldarast, we are humans, there was a war called the Holy Avengement war where all factions banded together to fight demons 10 years back and won. All factions..." {explanation_who_are_u: Rez |The blonde girl} spoke
* I interrupt her, " What factions are there in this world?"
    - - "I was getting to that, there are orcs, elves and  furries." {explanation_who_are_u: Rez |The blonde girl} answered.
    * * "Wait, there should be more. What about centaurs and dragons etc. And furries!? "
    - - - "Oh, how do you know about them, they have not been seen after conclusion of the war, many speculate they all went extinct. And yes furries are the beast people. Prior to war they were known as Begros. The hero of HA war changed their name for some reason." {explanation_who_are_u: Rez |The blonde girl} answered, curiously wondering.
    * * * "Haha, I read it in a book"
        ~ AdjustDeception(1)
        <i> Deception increased </i>
        {explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}
    * * * " I had a weird dream, where i heard a voice explaining me about this world"
        ~ AdjustHonesty(1)
        <i> Honesty increased </i>
        {explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}

=explanation_who_am_i
"{explanation_who_are_u: Rez|M'lady} do you know me ?
{explanation_who_are_u: Rez|The blonde girl} looks at me confused "Huh.? . . No, you never told me your name"
"I mean, have you seen me before our interaction here?"
- "Oh, I know what you mean, No. I have not met you prior to this meeting" {explanation_who_are_u: Rez|The blonde girl} answered. 
* "I guess you can call me . . anytime"
<i> Dude come on! stop it, here is a redo just to keep FBI out <\i>
-> explanation_who_am_i
    TODO : Add a name function link here
* " You can call me {playerName}"
    {explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}


=== barn_stint_father ===
- "So what do you plan to do from here on out {playerName}" - Rez enquires fondling with her hair.
How do you respond
* Thank her & Leave
" I think, I ought to leave, {Thou_art_Awakened.i_wanna_build_a_wtf:the hour is early, i can hopefully steal some clothes before people wake up} i am thankful for your help Rez. But this is where we part ways.
    - - Rez nods.
    * * I get up and bring my hand forward for a handshake.
    Rez confused with this, mirrors it after some time and gives a weird look, I shake hands and leave.
    ~city_rez = false
-> me_and_the_city

* Ask her to accompany you
"I don't know anything about this world, would you like to come with me Rez?"
    - - Rez's eyes widen with that statement. "What! Are you sure, you want me to come with you, I am of no help to anyone around me, even my mother says i should not be a burden to others around me.{Thou_art_Awakened.i_wanna_build_a_wtf: Also, you seem weird.}"
    * * "No, Rez, dont be like that. I don't know you or your life story that well to comment on that. But What i know is, you are a kind person, who beleived my story, who belived in me. I won't force you. But i want you to know, you will never be a burden to me.
        - - - Rez starts sobbing "... Thank you for saying that."
        * * * . . . 
        - - - - Rez continues sobbing
        * * * * I get up and {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from the barn and wrap it around like a robe, then } "Step closer to Rez and gently place your hand on her head, giving it a soft pat. 'There, there... Miss Rednic Ella,' you say with a warm smile. "Would you guide this boy from another world for a holy crusade, I mean to explore this strange and wondrous land?" 
        - - - - - Rez looks up to me, and clasps my hands. "I can show you around."
        * * * * * Okay then, Here we go!
        ~city_rez = true
        -> me_and_the_city

* Ask her what she desires.
"You ask her what she truly desires.
    - - 'What do you mean?... I need to return to my duties. I can offer some assistance, but I have responsibilities I cannot ignore,' Rez murmurs, her eyes fixed on the rough wooden planks of the barn floor. The question takes her by surprise, leaving her momentarily speechless. No one has ever cared enough to ask her what she wants."
    * * "Then, i will show myself out. I appreaciate you for for providing me with some much needed information about this world."
        - - - Rez nods with a smile on her face.
        * * * "Well then, you have a good one. Cheers."
        You get up, courteoulsy bow and walk out of the barn door.
            - - - -Unbeknownst to you, Rez rises and tries to reach for your hand, as if pleading for you to stay with her just a little longer. An unfamiliar emotion stirs within her—a warmth, a fleeting sense of happiness she can’t quite put into words, slipping away like sand through her fingers.
            * * * * You don't look back
            You keep walking towards the city  {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from clothes drying outside the barn and wrap it around like a robe. }
            -> me_and_the_city
            ~city_rez = false
            * * * * You look back
            You see Rez's hand trying to reach for yours. You grab it, and ask her. If she would be interested to accompany her and show her around. She nods, happily. Wiping her watery eyes. 
            ~city_rez = true
            -> me_and_the_city

=== me_and_the_city
You {city_rez==true:and Rez }walk outside of the barn. {city_rez==true:You ask Rez where are we going, she asks you to just follow her, after reaching a intersection she stops and replies "We can go towards city port or go towards the Adventurer's guild or explore the market |You look around, and walk aimlessly for hours, reaching an intersection with 3 paths going in different  directions }
- Where do you go ?
* Go towards Clearport's port
You decide to visit Clearport's port, hoping there must be something special about it, since the city is literally named after it.
{city_rez==true: You ask rez if there is a correlation between the city's name with its port. She nods while smiling and replies " The city's port is the river Paship, its water is extremely clear where the port is established.}
    - - You arrive at the slums of the city. There is a distinct putrid smell in the air. You continue to follow the path towards the port, you take the path through a dark alley, thats when you sense a gloomy presence in there. There is a person with dity white robes and standing with support of a worn out stick. Sensing your presence, he lifts up his head blocking my path and staring at me directly. It seemed as if the time had stopped. {city_rez==true: I look out for Rez, who has already passed over the man, but it appears she is also stuck in the time freeze.}
    * * Whoa! Did you just Za warudo!
    -> fateful_encounter_2

* Go towards Adventurer's guild
    - - This path is under development. Any inconvenience is regretted. Peace
    * * Man, fuck this shit. Cast Alt + F4
-> END

* Go towards Market
    - - This path is under development. Any inconvenience is regretted. Peace
    * * Man, fuck this shit. Cast Alt + F4
-> END

=== fateful_encounter_2
The man than removes its hood smiling with eyes closed, it is a man with long beard, white hair. The hairdo looks messy but his face is vibrant and exudes of an aura. 
- This path is under development. Any inconvenience is regretted. Peace
* Man, fuck this shit. Cast Alt + F4


-> END
