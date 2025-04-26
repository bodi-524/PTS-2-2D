/*-----------------------------------------------
The second script of the proto version
Last edited : 28-03-2025
It is the 1 and 2 episode
-----------------------------------------------*/


/*------------------------------------------------- 
Debug statements, for personal use only
//《 》Replacing  the italics with this
// Positive Morality {pmoral(" ")}
// Negative morality {nmoral(" ")}
// Location {location(" ")}
// Weapons {weapons(" ")}
// rizz {rizz(" ")}
// Fights {fights(" ")}
// Foreshadowing {foreshadow(" ")}
// Ominous voice  {hito(" ")}
------------------------------------------------- */

VAR clothes = ""

=== Thou_art_Awakened ===
~SetLocation("Some dark place")
TODO: Need to paraphrase to give a more fantasy feel
<i>
    You wake up surrounded by filth and husk,
    there is a particular animal musk, a darkness surrounding you, it restricts your vision.
    There are torches hanging on a central pillar of what seems to be a {location("small barn ")}.
    You turn your gaze downwards and see you are wearing
</i>
* <i>I am wearing a dirty robe that covers my body, some cheap-looking bracelets & rings with worn-out gems.</i>
    -> i_wanna_build_a_mage

* <i>I am wearing an average looking shirt and a pants with suspenders, a staple for nobles.</i>
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
<i>
    You sit down to look around the {location("barn")}, you are just wearing boots and <>{clothes}
    What do you do next ?
</i>

* <i>Get up and explore the dark and unknown area</i>
    ~ AdjustCourage(1)
    {pmoral("《 Courage increased 》")}
    -> dora_da_explora
    
* <i>Call for help, see if someone responds</i>
    ~ AdjustCaution(1)
    {nmoral("《 Caution increased 》")}
    <i>You wait for some time, but no one shows up.</i>
    "Guess its too early"
    <i>You go towards a large container with water and start to clean the filth of your boots and {clothes}</i>
    -> help_me_waifu_1

* <i>Ignore it, and go to sleep</i>
<i>You go to sleep for 5 more minutes</i>
    -> snorlax

=dora_da_explora

<i>
You get up in the low light conditions,  {i_wanna_build_a_wtf: you feel the coldness in the temperature, since you are naked} and start exploring the surroundings.
You see there are multiple animals in the barn, from horses to cows. A peculiar sound catches your attention. It seems like a animal crying for help, you start walking towards it.
When you reach the corner of the {location("barn")}, you see a white calf lying on the ground, shaking and crying as if in pain. Another cow going restless in the next enclosure. Presumably its mother.
What do you do next ?
</i>
* <i>Try to save the calf. It seems the cold has seeped into the calf and its suffering from frostbite.{i_wanna_build_a_mage: I cover it with my robe} {i_wanna_build_a_wtf: I use my naked body to wrap myself around the calf} </i>
~ AdjustCompassion(1)
{pmoral("《 Compassion increased 》")}
-> imma_barbie_girl

* <i>Ignore the calf, start humming 'Furr' by 'pink guy'. <s>"PETA on my dick, PETA on my dick. . ."</s></i>
~ AdjustInsensitivity(1)
{nmoral("《 Insensitivity increased 》")}
-> imma_barbie_girl

* <i>{fights("Kick the calf")}. </i>
"Your voice is annoying, be quiet!"
<i>The calf's cries more loudly, with pain.</i>
~ AdjustInsensitivity(2)
{nmoral("《 Insensitivity increased 》")}
    
    - - <i>You hear rattling of enclosures, and a loud clank. You turn around to see, its a rampaging bull, running towards you. You succesfully dodge the bull's assault.
    What will you do next ?</i>
    * * {fights("Fight the bull")}
        - - - <i>You initiate fight with bull</i> // TODO fight
        <i><b>The implementation for this is pending, so you will move to the next stage automatically. Any inconveneince is deeply regretted.</b></i>
        * * * "Yea whatever"
        -> imma_barbie_girl
        
    * * <i>Utilize your classroom knowledge. Lie down, act dead.</i> // TODO Integrate some sort of achievement system.

        - - - <i> You have unlocked the achievement <b> Dumb ways to die </b>.
        The bull runs towards you with his horned head pointing toward ground, and scoops you up like one of those bob the builder machinations.
        You feel the sensation of flying, it was shortlived.</i>
        - - - <i> You fall down towards the ground, followed by some hoof massage.</i>
        - - - <i> Unalive feature activated.</i>
        -> unalive_feature
    
    * * <i>Run towards the bull enclosure and lock it.</i>
        
        - - - <i>You walk inside the bull enclosure and securely lock it. After catching your breath, you jump out of it and get out of that section of barn and lock it down.</i>
        ~ AdjustCourage(1)
        {pmoral("《 Courage increased 》")}
        * * * "Phew! That was scary"
        ->imma_barbie_girl


=snorlax
<i>The soft light that had been straining your eyes is now gone, as if something has shrouded it entirely. In the sudden absence, you feel a presence—something is near. But you ignore it and continue sleeping.</i>

- <i>After some time, the lingering putrid smell of the barn has grown more intense. You feel something warm on your face, you intinctively wipe it off your face and feel a weird sensation of something in semi-solid state like a sticky paste.</i>
- <i>By the time you come to your senses, the damage has already been done. You wake up to the sight of a clump of black hairy balls dangling over your face. The realisation of that sight and smell feels you with disgust and anger. </i>
    <i> Get shit on by horse <\i> // TODO Achievement
* <i>Ignore the beast and clean yourself</i>
~ AdjustHonor(1)
{pmoral("《 Honor increased 》")}
-> imma_barbie_girl.

* {fights("Try to kill the horse")}
    -> horse_killa

= imma_barbie_girl
<i>{horse_killa: After your fight with horse, y|Y}ou begin to wash yourself with the water from a nearby container. As you clean, you notice faint rays of sunlight filtering into the space. The cheerful chirping of birds fills the air, and you realize the soft glow outside is the first light of dawn breaking over the horizon.
You move toward the window, peering outside to take in the view.</i>

- Clustered before you are humble houses crafted from straw and timber, their design unmistakably reminiscent of a medieval age. The faint sound of footsteps reaches your ears, growing louder as someone approaches the barn. You turn toward the entrance, your gaze fixed, eager to catch a glimpse of the approaching figure."
* . . .
-> help_me_waifu_1

= horse_killa
-  {fights("You initiate fight with horse")} //TODO fight
<i>The implementation for this is pending, so you will move to the next stage automatically. Any inconveneince is deeply regretted.</i>
->imma_barbie_girl

=help_me_waifu_1
<i>You see the figure of a maiden approach. She has blonde hair covering her coral blue eyes. Here complexion is white as that of an angel. But her body is frail, she has dark circles around her eyes. You wonder if she is a helper at this place.</i>

- <i>You try to get her attention in the most meek way possible. Appearing small, non-threatening, bowing as low as possible with hands held high. </i>
* "Hello there. . ."
->help_me_waifu_2

* [Rizz]<i>You scan the woman's figure top to down</i> "{rizz("Mmmm.. Mmmm.. MMMM!.. (shaking your head left to right with closed eyes) <b> Marvellous <\b>")}"

    - - <i>The woman instinctively wraps her arms around her breasts, trying to hide them from your prying perverted gaze.</i>
    * * "Forgive me my lady" - <i>You get down on one knee with my head bowed down.</i>
    ->help_me_waifu_2

    * * <i>. . . (wait for her to react)</i>
    ->help_me_waifu_2
    
= help_me_waifu_2
- <i> She is shocked to see me in the {location("barn")}, the fear is visible from her expressions. She quickly takes glance at all possible exits.
You realize her intentions, and back away from her,  giving her some space, so she would realize you are not a threat. {i_wanna_build_a_wtf: My lack of clothes is certainly not helping, you grab a pan and hide your family jewels}
You try to sudbue her fears by the best smile you can muster, and signalling that you are not some lunatic. During your act and posturing, you slip over some horse shit and fall down on your face. You hear a faint giggling while you get back up.
The blonde girl approaches you, and offers a rag to wipe off the horse shit. You accept it, and says </i> "Thanks"
- <i> She helps you get up, and asks</i> 
"Who are you, and why are you in my family's barn."
<i>How do you reply ?</i>
* Absurd lie
"I, CATO SICKARIUS AM THE KNIGHT-CHAMPION OF MC-RAGE."

    - - "But all the holy knights perished in {foreshadow("The Holy Avengement War")}. {i_wanna_build_a_wtf: wWhy are you naked Sir}"
    * * "Ahem! No M'lady, I am not a knight of this kingdom, I am from the capital world of Ultra-Mars, Mc-Rage!"
    ~ AdjustDeception(2)
    {nmoral("《 Deception increased 》")}

        - - -"That sounds made up."- <i>Blonde girl says being suspicious.</i>
        * * * "Hahaha, i was testing you. Of course its made up"
        ->Truth_seeker
        
* Truth
~ AdjustHonesty(1)
{pmoral("《 Honesty increased 》")}
->Truth_seeker

* <i>Hit on her</i>
    
    - - <i>Taking sudden whiffs of air all around you, you turn your gaze towards the blonde girl.</i>
    * * "{rizz("Did you fart m'lady?")}"
        
        - - - "Huh..?" - Blonde girl exclaims with a poker face.
        * * * "{rizz(". . . Cause you blew me away")}"
        《 Rizz increased (it has no implication in the game though lmao.) 》
            
            - - - - " I am sorry sir, I don't understand what you wish to imply " - <i>Blonde girl replies with red face & starts to turn around and walk away.</i>
            * * * * "Wait M'lady, that a sort of humourous retort, please forgive me"
            ~ AdjustDeception(1)
            {nmoral("《 Deception increased 》")}
            ->Truth_seeker
            
            * * * * <i>My apologies M'lady, that was just me admiring and appraising your God given looks, i beg for forgiveness to have offended you.</i>
            ~ AdjustHonesty(1)
            {pmoral("《 Honesty increased 》")}
            ->Truth_seeker

=Truth_seeker
- <i>You start to convey her the truth. How you spawned in this world.</i>
* "I have no idea how I came here. I had a weird dream, and when I woke up, I was at this barn, wearing boots & {clothes}."
    
    - - "Don't you remember anything from your past ?"- <i>Blonde girl asks sympathetically.</i>
    * *  "No Madam."
        
        - - - "Hmm.. It seems you have lost your memory" - <i>Blonde girl</i>
        * * * "I have no way to refute that"
        <i>You sit down on the wooden floor. Seeing that, the blonde girl sits down on a husk bale.</i>
        "This must be hard for you ..." - <i>Blonde girl</i>
        ->explanation_rez
        
=explanation_rez
" If its not a bother, may I ask you some {explanation_world_2 ||explanation_who_am_i|| explanation_who_are_u: more}  questions {explanation_who_are_u: Rez|M'lady} " <i>you ask her humbly</i>

- {explanation_who_are_u: Rez|The blonde girl} nods
* <i>Enquire about the world.</i>
<i>You ask her about the world and factions, to correlate it with what the ominous voice said, and which faction area you have spawned in. </i>
-> explanation_world_2

* <i>Ask about yourself</i>
<i>You ask her if she knows anything about you in this world, or people who have spawned like yourself.</i>
-> explanation_who_am_i

* <i>Ask about her</i>
-> explanation_who_are_u

=explanation_who_are_u
<i>You ask her about her.</i>
"Who are you ...?"

- "This property is owned by house Ella and I am Rednic Ella the first daughter of the house Ella. You can call me Miss. Rednic if you may, madam seems a bit too formal for my taste" - <i>Miss Rednic replies with a faint smile.</i>
*  <i>You think that there is more you wish to know about her, but this much is good enough for now, any more would creep her out.</i>
~ AdjustCompassion(1)
{pmoral("《 Compassion increased 》")}
"{rizz("I would go with Rez")}"- <i>I say with a wink. . .</i>
<i>(Wondering what kind of pathetic lousy writing this. Seriously, Cinderella) </i>
~ AdjustMatrixAwareness(1)
《 Awareness increased 》
{explanation_world_2 && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}

* "A first daughter, why you lie to me like that ? You carry yourself like a servant." <i>You reply instinctively.</i>
~ AdjustInsensitivity(1)
{nmoral("《 Insensitivity increased 》")}
<i>Rez just nods and says nothing.</i>
{explanation_world_2 && explanation_who_am_i : -> barn_stint_father | -> explanation_rez}

=explanation_world_2
~ SetLocation("Barn in Clearport")
<i>{explanation_who_are_u: Rez|The blonde girl} explains to you about the history of {location("Aldarast")}.</i>

- "This is {location("Clearport a city in Aldarast")}, we are humans, there was a war called {foreshadow("The Holy Avengement war")} where all factions banded together to fight demons 10 years back and won. All factions..." <i>{explanation_who_are_u: Rez |The blonde girl} spoke</i>
* <i>You interrupt her,</i> " What factions are there in this world?"
    
    - - "I was getting to that, there are orcs, elves and  furries." <i>{explanation_who_are_u: Rez |The blonde girl} answered.</i>
    * * "Wait, there should be more. What about centaurs and dragons etc. And furries!? "
        
        - - - "Oh, how do you know about them, they have not been seen after conclusion of the war, many speculate they all went extinct. And yes furries are the beast people. Prior to war they were known as Begros. The hero of HA war changed their name for some reason." <i>{explanation_who_are_u: Rez |The blonde girl} answered, curiously wondering.</i>
        * * * "Haha, I read it in a book"
        ~ AdjustDeception(1)
        {nmoral("《 Deception increased 》")}
        {explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}

        * * * " I had a weird dream, where I heard a voice explaining me about this world"
        ~ AdjustHonesty(1)
        {pmoral("《 Honesty increased 》")}
        {explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}

=explanation_who_am_i
"{explanation_who_are_u: Rez|M'lady}, by any chanve do you know me ? {explanation_who_are_u: Rez|The blonde girl} looks at me confused "Huh.? . . No, you never told me your name"
"I mean, have you seen me before our interaction here?"

- "Oh, I know what you mean, but no. I have not met you prior to this meeting. So what should I call you ?" <i>{explanation_who_are_u: Rez|The blonde girl} answered.</i> 
* "{rizz("I guess you can call me . . anytime")}"
{writer("<< Dude come on! stop it, here is a redo just to keep FBI out >>")}
-> explanation_who_am_i // TODO: Accept name input dialogue box in unity

* " You can call me {playerName}"
{explanation_who_are_u && explanation_who_am_i :  -> barn_stint_father | -> explanation_rez}


// === barn_stint_father ===
// - "So what do you plan to do from here on out {playerName}" - <i>Rez enquires fondling with her hair.</i>
// <i>How do you respond</i>
// * <i>Thank her & Leave</i>
// " I think, I ought to leave, {Thou_art_Awakened.i_wanna_build_a_wtf:the hour is early, i can hopefully steal some clothes before people wake up} i am thankful for your help Rez. But this is where we part ways."
//     - - <i>Rez nods.</i>
//     * * <i>I get up and bring my hand forward for a handshake.</i>
//     <i>Rez confused with this, mirrors it after some time and gives a weird look, I shake hands and leave.</i>
//     ~city_rez = false
// -> me_and_the_city

// * <i>Ask her to accompany you</i>
// "I don't know anything about this world, would you like to come with me Rez?"
//     - - <i>Rez's eyes widen with that statement.</i> "What! Are you sure, you want me to come with you, I am of no help to anyone around me, even my mother says i should not be a burden to others around me.{Thou_art_Awakened.i_wanna_build_a_wtf: Also, you seem weird.}"
//     * * "No, Rez, dont be like that. I don't know you or your life story that well to comment on that. But What i know is, you are a kind person, who beleived my story, who belived in me. I won't force you. But i want you to know, you will never be a burden to me."
//         - - - <i>Rez starts sobbing</i> "... Thank you for saying that."
//         * * * . . . 
//         - - - - <i>Rez continues sobbing</i>
//         * * * * <i>You get up and {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from the barn and wrap it around like a robe, then }Step closer to Rez and gently place your hand on her head, giving a soft pat.</i> "There, there... Miss Rednic Ella" <i>you say with a warm smile.</i> "Would you guide this boy from another world for a holy crusade, I mean to explore this strange and wondrous land?" 
//         - - - - - <i>Rez looks up to me, and clasps my hands.</i> "I can show you around."
//         * * * * * "Okay then, Here we go!"
//         ~ city_rez = true
//         -> me_and_the_city

// * <i>Ask her what she desires.</i>
// "{rizz("What do you desire ?")}"
//     - - "What do you mean?... I need to return to my duties. I can offer some assistance, but I have responsibilities I cannot ignore," <i>The question takes her by surprise, leaving her momentarily speechless. Rez murmurs, looking down, her eyes fixated on the rough wooden planks of the barn floor. No one has ever cared enough to ask her what she wants.</i>
//     * * "Then, i will show myself out. I appreaciate you for for providing me with some much needed information about this world."
//         - - - <i>Rez nods with a smile on her face.</i>
//         * * * "Well then, you have a good one. Cheers."
//         <i>You get up, courteoulsy bow and walk out of the barn door.</i>
//             - - - - <i>Unbeknownst to you, Rez rises and tries to reach for your hand, as if pleading for you to stay with her just a little longer. An unfamiliar emotion stirs within her — a warmth, a fleeting sense of happiness she can't quite put into words, but it seems to be slipping away like sand through her fingers.</i>
//             * * * * <i>You don't look back</i>
//             <i>You keep walking towards the city  {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from clothes drying outside the barn and wrap it around like a robe. }</i>
//             -> me_and_the_city
//             ~city_rez = false
//             * * * * <i>You look back</i>
//             <i>You see Rez's hand trying to reach for yours. You grab it, and ask her. If she would be interested to accompany her and show her around. She nods, happily. Wiping her watery eyes. </i>
//             ~city_rez = true
//             -> me_and_the_city

// === me_and_the_city
// <i>You {city_rez==true:and Rez }walk outside of the barn. {city_rez==true:You ask Rez, where are we going, she instructs you to just follow her, after reaching a intersection she stops and replies "We can go towards {location("city port")} or go towards the {location("Adventurer's guild")} or explore {location("the Market")} |You look around, and walk aimlessly for hours, you ask people for direction and finally reach an intersection with 3 paths going in different directions. Namely, {location("Guild, Port, Market")}}</i>
// - <i>Where do you go ?</i>
// * <i>Go towards Clearport's port</i>
// <i>You decide to visit Clearport's port, hoping there must be something special about it, since the city is literally named after it.</i>
// <i>{city_rez==true: You ask rez if there is a correlation between the city's name with its port. She nods while smiling and replies</i> " The city's port is the {location("river Paship")}, its water is extremely clear where the port is established."}
//     - - <i>You arrive at the slums of the city. There is a distinct putrid smell in the air. You continue to follow the path towards the port, you take the path through a dark alley, thats when you sense a gloomy presence in there. There is a person with diety white robes and standing with support of a worn out stick. Sensing your presence, he lifts up his head blocking my path and staring at you directly. There is a sudden silence that envelopes the surrounding. It seemed as if the time had stopped. {city_rez==true: I look out for Rez, who has already moved along that shady old man, but it appears she is also stuck in the time freeze.}</i>
//     * * "Whoa! Did you just Za warudo!"
//     -> fateful_encounter_2

// * <i>Go towards Adventurer's guild</i>
//     - - <i>This path is under development. Any inconvenience is regretted. Peace</i>
//     * * Man, fuck this shit. Cast Alt + F4
// -> END

// * <i>Go towards Market</i>
//     - - <i>This path is under development. Any inconvenience is regretted. Peace</i>
//     * * Man, fuck this shit. Cast Alt + F4
// -> END

// === fateful_encounter_2
// <i>The man than removes its hood smiling with eyes closed, he has a long white beard, white hair. The hairdo looks messy but his face is vibrant and exudes vibrant aura. </i>
// - <i>This path is under development. Any inconvenience is regretted. Peace</i>
// * Man, fuck this shit. Cast Alt + F4
