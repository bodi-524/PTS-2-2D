/*-----------------------------------------------
The alpharius script of the proto version
Last edited : 09-03-2025
It includes the Functions and Variables
-----------------------------------------------*/
//
//Scripts
//
INCLUDE prologue.ink
INCLUDE m1_Awaken.ink

//Calling the knot from here.
-> big_bang

//
//Player name, to be set from unity
//
VAR player_name = "General Kenobi"
//
//Character Traits
//grouped with opposing counterparts

//Lying 
VAR honesty = 5
VAR deception = 5

//helping
VAR compassion = 5
VAR insensitivity = 5

//stealing
VAR honor = 5
VAR greed = 5

//alpha/beta
VAR courage = 5
VAR caution = 5

//Variable for Matrix
//
VAR matrix_awareness = 0

//Variable for M1
VAR city_rez = false

//Variable for Location
VAR location = ""
//
//Functions for Opposing Morality Traits
//
=== function adjust_pair(ref first_var, ref second_var, delta) ===

    ~ first_var += delta
    // Ensure edge case for first_var
    {
        - first_var > 10: 
            ~ first_var = 10
        - first_var < 0:
            ~ first_var = 0
    }
    ~ second_var = 10 - first_var

//
//Increase or decrease
//
=== function lower(ref x) ===
~ x = x - 1

=== function raise(ref x) ===
~ x = x + 1

=== unalive_feature ===
YOU DIED

-> END