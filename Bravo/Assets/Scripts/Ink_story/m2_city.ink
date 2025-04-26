/*-----------------------------------------------
The third script of the proto version
Last edited : 30-03-2025
It is the 2nd episode
-----------------------------------------------*/

=== barn_stint_father ===
- "So what do you plan to do from here on out {playerName}" - <i>Rez enquires fondling with her hair.</i>
<i>How do you respond</i>
* <i>Thank her & Leave</i>
" I think, I ought to leave, {Thou_art_Awakened.i_wanna_build_a_wtf:the hour is early, i can hopefully steal some clothes before people wake up} i am thankful for your help Rez. But this is where we part ways."
    
    - - <i>Rez nods.</i>
    * * <i>I get up and bring my hand forward for a handshake.</i>
    <i>Rez confused with this, mirrors it after some time and gives a weird look, I shake hands and leave.</i>
    ~city_rez = false
-> me_and_the_city

* <i>Ask her to accompany you</i>
"I don't know anything about this world, would you like to come with me Rez?"
    
    - - <i>Rez's eyes widen with that statement.</i> "What! Are you sure, you want me to come with you, I am of no help to anyone around me, even my mother says i should not be a burden to others around me.{Thou_art_Awakened.i_wanna_build_a_wtf: Also, you seem weird.}"
    * * "No, Rez, dont be like that. I don't know you or your life story that well to comment on that. But What i know is, you are a kind person, who beleived my story, who belived in me. I won't force you. But i want you to know, you will never be a burden to me."
        
        - - - <i>Rez starts sobbing</i> "... Thank you for saying that."
        * * * . . . 
        
            - - - - <i>Rez continues sobbing</i>
            * * * * <i>You get up and {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from the barn and wrap it around like a robe, then }Step closer to Rez and gently place your hand on her head, giving a soft pat.</i> "There, there... Miss Rednic Ella" <i>you say with a warm smile.</i> "Would you guide this boy from another world for a holy crusade, I mean to explore this strange and wondrous land?" 
                
                - - - - - <i>Rez looks up to me, and clasps my hands.</i> "I can show you around."
                * * * * * "Okay then, Here we go!"
                ~ city_rez = true
                -> me_and_the_city

* <i>Ask her what she desires.</i>
"{rizz("What do you desire ?")}"
    
    - - "What do you mean?... I need to return to my duties. I can offer some assistance, but I have responsibilities I cannot ignore," <i>The question takes her by surprise, leaving her momentarily speechless. Rez murmurs, looking down, her eyes fixated on the rough wooden planks of the barn floor. No one has ever cared enough to ask her what she wants.</i>
    * * "Then, i will show myself out. I appreaciate you for for providing me with some much needed information about this world."
        
        - - - <i>Rez nods with a smile on her face.</i>
        * * * "Well then, you have a good one. Cheers."
        <i>You get up, courteoulsy bow and walk out of the barn door.</i>
            
            - - - - <i>Unbeknownst to you, Rez rises and tries to reach for your hand, as if pleading for you to stay with her just a little longer. An unfamiliar emotion stirs within her — a warmth, a fleeting sense of happiness she can't quite put into words, but it seems to be slipping away like sand through her fingers.</i>
            * * * * <i>You don't look back</i>
            <i>You keep walking towards the city  {Thou_art_Awakened.i_wanna_build_a_wtf: grab a piece of cloth from clothes drying outside the barn and wrap it around like a robe. }</i>
            -> me_and_the_city
            ~city_rez = false
            
            * * * * <i>You look back</i>
            <i>You see Rez's hand trying to reach for yours. You grab it, and ask her. If she would be interested to accompany her and show her around. She nods, happily. Wiping her watery eyes. </i>
            ~city_rez = true
            -> me_and_the_city

=== me_and_the_city
<i>You {city_rez==true:and Rez }walk outside of the barn. {city_rez==true:You ask Rez, where are we going, she instructs you to just follow her, after reaching a intersection she stops and replies "We can go towards {location("city port")} or go towards the {location("Adventurer's guild")} or explore {location("the Market")} |You look around, and walk aimlessly for hours, you ask people for direction and finally reach an intersection with 3 paths going in different directions. Namely, {location("Guild, Port, Market")}}</i>
- <i>Where do you go ?</i>
* <i>Go towards Clearport's port</i>
<i>You decide to visit Clearport's port, hoping there must be something special about it, since the city is literally named after it.</i>
<i>{city_rez==true: You ask rez if there is a correlation between the city's name with its port. She nods while smiling and replies</i> " The city's port is the {location("river Paship")}, its water is extremely clear where the port is established."}
    
    - - <i>You arrive at the slums of the city. There is a distinct putrid smell in the air. You continue to follow the path towards the port, you take the path through a dark alley, thats when you sense a gloomy presence in there. There is a person with diety white robes and standing with support of a worn out stick. Sensing your presence, he lifts up his head blocking my path and staring at you directly. There is a sudden silence that envelopes the surrounding. It seemed as if the time had stopped. {city_rez==true: I look out for Rez, who has already moved along that shady old man, but it appears she is also stuck in the time freeze.}</i>
    * * "Whoa! Did you just Za warudo!"
    -> fateful_encounter_2

* <i>Go towards Adventurer's guild</i>
    
    - - <i>This path is under development. Any inconvenience is regretted. Peace</i>
    * * Man, fuck this shit. Cast Alt + F4
-> END

* <i>Go towards Market</i>
    
    - - <i>This path is under development. Any inconvenience is regretted. Peace</i>
    * * Man, fuck this shit. Cast Alt + F4
-> END

=== fateful_encounter_2
<i>The man than removes its hood smiling with eyes closed, he has a long white beard, white hair. The hairdo looks messy but his face is vibrant and exudes vibrant aura. </i>
- <i>This path is under development. Any inconvenience is regretted. Peace</i>
* Man, fuck this shit. Cast Alt + F4


-> END