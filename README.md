# RetroRhythm
ES4 Fall 2024 Final Project - RETRO RHYTHM

Written by
Charlotte, Katherine, Tygan, Vivian

Description: Two-player game of catching falling arrows on the arrow outlines.

Folder VGA_Controller contains the Lattice formatted project files. 
All relevant input files are included under VGA_Controller/source/impl_1:
(Note the various sections - mainly game logistics, audio, controllers, and display)

TOP MODULE
    top.vhd - holds all of the modules and components and connects signals
        from all files

STATES OF GAME
    FSM.vhd - updates and tracks the state of the game

GAME LOGISTICS
    arrows_on2008.vhd - spawns arrows and updates their location
    hit_detect.vhd - updates score of players based on input from controller
        and location of arrows

AUDIO RELATED FILES
    clk_divider.vhd - clock for the music
    music_decoder.vhd - takes values of notes and output them to speaker
    music.vhd - hardcoded notes and when to play them

CONTROLLER RELATED FILES
    NESControllers.vhd - takes input from controllers and outputs as vectors

VGA (DISPLAY) RELATED FILES
    vga.vhd - draws pixels values on screen based on pattern generated from 
        pattern_gen
    pattern_gen2.vhd - updates pixel values of screen based on state of game
    score_rom.vhd - draws all score related elements at specific locations on 
        screen and score (digits, the word "score", and which player)

ROM (for DISPLAY) FILES
    arrout_rom.vhd - contains pixel values for arrows given x and y address
    arrow_rom.vhd - contains pixel values for goal outline arrows given x and y
    dig0_rom.vhd - contains pixel values for digit 0 given x and y address
    dig1_rom.vhd - contains pixel values for digit 1 given x and y address
    dig2_rom.vhd - contains pixel values for digit 2 given x and y address
    dig3_rom.vhd - contains pixel values for digit 3 given x and y address
    dig4_rom.vhd - contains pixel values for digit 4 given x and y address
    dig5_rom.vhd - contains pixel values for digit 5 given x and y address
    dig6_rom.vhd - contains pixel values for digit 6 given x and y address
    dig7_rom.vhd - contains pixel values for digit 7 given x and y address
    dig8_rom.vhd - contains pixel values for digit 8 given x and y address
    dig9_rom.vhd - contains pixel values for digit 9 given x and y address
    playerp_rom.vhd - contains pixel values for the letter p given x and y
    scoreword_rom.vhd - contains pixel values for word "score" given x and y 
    start_screen.vhd - contains pixel values for start screen given x and y 
    endscreen.vhd - contains pixel values for game over screen given x and y 

