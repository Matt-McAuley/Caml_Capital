# Caml Capital

## Contents

- [Description](#description)
- [Images](#images)
- [Running Locally](#running-locally-linuxmacos---requires-dune-and-opam)
- [Authors](#authors)

## Description

This was a class project for **CS 3110 at Cornell University**, where two classmates and I
were tasked to develop any software of our choosing over the course of the semester using OCaml.
We chose to make a terminal recreation of the board game Monopoly because we figured game design would be an interesting and challenging route.
The game has a maximum of 4 players and gives you instructions on how to play throughout. We implemented standard features like rolling the dice,
buying properties, buying houses/hotels, paying rent, going to jail, community chest, and chance cards.

We designed two compilation units to represent the Player data structure and the Property data structure. The Player data structure
contains the player's name, position, money, properties, and jail status. It allows for creating an empty player which represents
when less than four players play or someone loses the game. There are standard getters and setters to assist with modifying values
and maintaining which properties the player owns. The Property data structure contains the property's name, position, price, color, rent at each level,
and a ref for the current level of the property. There are also getters and setters within this module to assist with creating properties
and getting their values. The level of the property is the one imperative feature of the project as it is a ref that can be modified to
increase the rent of the property when houses/hotels are bought. We did this so that we didn't have to recreate the entire list of properties
every time one got updated and then give them back to each player. We thought using a ref in this case was the most efficient way to handle this.

Within our data directory we have a few ASCII artworks as well as a CSV file that contains all the properties in the game and their respective
values. We read in this CSV file and create a list of properties that we use to populate the board.

Our test cases mainly focus on the Player and Property modules as testing the game loop was done through playing the game ourselves.
The test suite for both of the compilation units is extensive and covers all the functions and their edge cases.

The bulk of our code is written in bin/main.ml which controls the game loop. This file is nearly 1000 lines of code with many well documented
functions that handle the game logic. We have functions for rolling the dice, moving the player, buying properties, buying houses/hotels,
paying rent, and more, all done in a functional style. Functional programming often made the code more verbose, however, it is easier to reason about and
once it compiled it was much less likely to have random bugs.

This project was great for reinforcing the concepts we learned in class and applying them to a real-world application. By the end of it, I much better
understood how to write software in a team and effectively make use of version control to manage the project. I also learned a lot about game design and
how to implement a game loop in a functional language. Functional programming was very interesting to learn and although it would've probably been much easier
to make the game in a language like Python, OCaml has helped me to think about problems in a different way and has made learning React much easier. We were also
given strict requirements for the project regarding prototype stages, offering consistent client value, having good test cases, and writing effective documentation
which are important practices to follow in the industry.

## Images

#### Start Screen
<img src="https://matt-mcauley.github.io/assets/img/Caml_Capital/start.png" alt="Start Screen Image" style="width: 95%">

#### Mid Game Screen
<img src="https://matt-mcauley.github.io/assets/img/Caml_Capital/midgame.png" alt="Mid Game Screen Image" style="width: 95%">

## Running locally (Linux/MacOS - requires dune and opam)

#### Step 1: Download the source code
Clone or download a zip file of the source code onto your device

#### Step 2: Install Dependencies
Follow the instructions in INSTALL.txt

#### Step 3: Command to run project locally:
```dune exec bin/main.exe```

## Authors

<table style="border-collapse: collapse; border:none;">
  <tr  style="border:none;">
    <td style="border:none;"><strong>Matthew McAuley</strong></td>
    <td style="border:none;"><strong>Sharanya Dabas</strong></td>
    <td style="border:none;"><strong>Erdis Brahimi</strong></td>
  </tr>
  <tr style="border:none;">
    <td style="border:none;">mwm223@cornell.edu</td>
    <td style="border:none;">sd699@cornell.edu</td>
    <td style="border:none;">eb697@cornell.edu</td>
  </tr>
</table>
