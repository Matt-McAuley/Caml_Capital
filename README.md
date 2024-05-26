# Caml Capital
## Contents

- [Summary](#summary)
- [Images](#images)
- [Running Locally](#running-locally)
- [Authors](#authors)

## Summary

This is a project for **"CS 3110 class at Cornell University"**, where we
worked in a team of 3 to develop any software of our choosing over the course of the semester.
We chose to make an OCaml terminal iteration of the board game Monopoly. Our code is mostly functional
with small imperitive features to control for things like property rent. We have most of our game logic within
bin/main.ml where the game loop resides and the code determines what should happen on each player's turn.
We have compilation units within lib to represent Property and Player data types. Our data for the information
on each property is stored within a CSV file in data/ along with different ASCII artworks. Our compilation
units were tested with an OUnit test suite and the rest of our code was tested manually by playing our game. We completed
the project in mutliple sprints where we had to develop working prototypes that provided client value. We then continued
to iterate and improve until we had a product that met our standards at the end of the semester. We learned about working
in an agile software development team, functional programming, game design, version control, and proper code testing which were
all necessary to make this project successful.

## Images

### Start Screen
![Start Screen Image](/data/start.png)

### Mid Game Screen
![Mid Game Screen Image](/data/midgame.png)

## Running locally

### Step 1: Download the source code
Clone or download a zip file of the source code onto your device

### Step 2: Install Dependencies
Follow the instructions in INSTALL.txt

### Command to run project locally: 
```dune exec bin/main.exe```

## Authors
### Matthew McAuley
mwm223@cornell.edu

### Erdis Brahimi
eb697@cornell.edu

### Sharanya Dabas
sb699@cornell.edu