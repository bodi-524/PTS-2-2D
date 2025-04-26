/*-----------------------------------------------
The alpharius script of the proto version
Last edited : 19-03-2025
It includes the External Functions and Variables
-----------------------------------------------*/
//
//Scripts
//
INCLUDE prologue.ink
INCLUDE m1_awaken.ink
INCLUDE m2_city.ink

//Calling the knot from here.
-> big_bang




//Variable for M1
VAR city_rez = false

//
//External Variables
//

//Traits
VAR honesty = 0
VAR deception = 0
VAR courage = 0
VAR caution = 0
VAR compassion = 0
VAR insensitivity = 0
VAR honor = 0
VAR greed = 0

//name
VAR playerName = ""
VAR matrixAwareness = 0
//
//External functions
//

//Traits
EXTERNAL AdjustHonesty(delta)
EXTERNAL AdjustDeception(delta)
EXTERNAL AdjustCompassion(delta)
EXTERNAL AdjustInsensitivity(delta)
EXTERNAL AdjustHonor(delta)
EXTERNAL AdjustGreed(delta)
EXTERNAL AdjustCourage(delta)
EXTERNAL AdjustCaution(delta)

//Core stats
EXTERNAL GainXP(amount)
EXTERNAL SetHealth(newHealth)
EXTERNAL SetPlayerName(newName)

//story
EXTERNAL AdjustMatrixAwareness(delta)
EXTERNAL SetLocation(newLocation)


=== unalive_feature ===
YOU DIED
-> END


//
// Color Functions (Define these at the top of your Ink file, or in a separate file that you include)
//
=== function pmoral(text) ===
    ~ return "<color=\#6bff6e>{text}</color>"
    
=== function nmoral(text) ===
    ~ return "<color=\#fc567a>{text}</color>"

=== function location(text) ===
    ~ return "<color=\#4de1ff>{text}</color>"

=== function weapons(text) ===
    ~ return "<color=\#7c66ff>{text}</color>"

=== function rizz(text) ===
    ~ return "<color=\#ffe75c>{text}</color>"

=== function fights(text) ===
    ~ return "<color=\#ff3885>{text}</color>"

=== function foreshadow(text) ===
    ~ return "<color=\#f082ff>{text}</color>"

=== function hito(text) ===
    ~ return "<color=\#8fb8ff>{text}</color>"

=== function writer(text) ===
    ~ return "<b><color=\#f59d67>{text}</color></b>"


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
// Writer {writer(" ")}
------------------------------------------------- */