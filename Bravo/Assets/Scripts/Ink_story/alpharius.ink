/*-----------------------------------------------
The alpharius script of the proto version
Last edited : 19-03-2025
It includes the External Functions and Variables
-----------------------------------------------*/
//
//Scripts
//
INCLUDE prologue.ink
INCLUDE m1_Awaken.ink

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