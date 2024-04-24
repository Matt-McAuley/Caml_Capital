open Property
open ANSITerminal

let go = create_property "GO!" 0 0 0 [ default ] 0 0 0 0 0 0 0

let mediterraneanave =
  create_property "Mediterranean Avenue" 1 60 2 [ yellow; on_red ] 50 10 30 90
    160 250 30

let balticave =
  create_property "Baltic Avenue" 2 60 4 [ yellow; on_red ] 50 20 60 180 320 450
    30

let orientalave =
  create_property "Oriental Avenue" 3 100 6 [ cyan ] 50 30 90 270 400 550 50

let vermontave =
  create_property "Vermont Avenue" 4 100 6 [ cyan ] 50 30 90 270 400 550 50

let connecticutave =
  create_property "Connecticut Avenue" 5 120 8 [ cyan ] 50 40 100 300 450 600 60

let stcharlesplace =
  create_property "St. Charles Place" 6 140 10 [ magenta ] 100 50 150 450 625
    750 70

let statesave =
  create_property "States Avenue" 7 140 10 [ magenta ] 100 50 150 450 625 750 70

let virginiaave =
  create_property "Virginia Avenue" 8 160 12 [ magenta ] 100 60 180 500 700 900
    80

let stjamesplace =
  create_property "St. James Place" 9 180 14 [ red; on_yellow ] 100 70 200 550
    750 950 90

let tennesseeave =
  create_property "Tennessee Avenue" 10 180 14 [ red; on_yellow ] 100 70 200 550
    750 950 90

let newyorkave =
  create_property "New York Avenue" 11 200 16 [ red; on_yellow ] 100 80 220 600
    800 1000 100

let kentuckyave =
  create_property "Kentucky Avenue" 12 220 18 [ red ] 150 90 250 700 875 1050
    110

let indianaave =
  create_property "Indiana Avenue" 13 220 18 [ red ] 150 90 250 700 875 1050 110

let illinoisave =
  create_property "Illinois Avenue" 14 240 20 [ red ] 150 100 300 750 925 1100
    120

let atlanticave =
  create_property "Atlantic Avenue" 15 260 22 [ yellow ] 150 110 330 800 975
    1150 130

let ventnorave =
  create_property "Ventnor Avenue" 16 260 22 [ yellow ] 150 110 330 800 975 1150
    130

let marvingardens =
  create_property "Marvin Gardens" 17 280 22 [ yellow ] 150 120 360 850 1025
    1200 140

let pacificave =
  create_property "Pacific Avenue" 18 300 26 [ green ] 200 130 390 900 1100 1275
    150

let northcarolinaave =
  create_property "North Carolina Avenue" 19 300 26 [ green ] 200 130 390 900
    1100 1275 150

let pennsylvaniaave =
  create_property "Pennsylvania Avenue" 20 320 28 [ green ] 200 150 450 1000
    1200 1400 160

let parkplace =
  create_property "Park Place" 21 350 35 [ blue ] 200 175 500 1100 1300 1500 175

let boardwalk =
  create_property "Boardwalk" 22 400 50 [ blue ] 200 200 600 1400 1700 2000 200

let property_list =
  [
    go;
    mediterraneanave;
    balticave;
    orientalave;
    vermontave;
    connecticutave;
    stcharlesplace;
    statesave;
    virginiaave;
    stjamesplace;
    tennesseeave;
    newyorkave;
    kentuckyave;
    indianaave;
    illinoisave;
    atlanticave;
    ventnorave;
    marvingardens;
    pacificave;
    northcarolinaave;
    pennsylvaniaave;
    parkplace;
    boardwalk;
  ]
