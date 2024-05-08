open Property
open ANSITerminal

let go = create_property "GO!" 0 0 0 [ default ] 0 0 0 0 0 0 0

let mediterraneanave =
  create_property "Mediterranean Avenue" 1 60 2 [ yellow; on_red ] 50 10 30 90
    160 250 30

let community_chest1 =
  create_property "Community Chest" 2 0 0 [ default ] 0 0 0 0 0 0 0

let balticave =
  create_property "Baltic Avenue" 3 60 4 [ yellow; on_red ] 50 20 60 180 320 450
    30

let income_tax = create_property "Income Tax" 4 0 0 [ default ] 0 0 0 0 0 0 0

let reading_railroad =
  create_property "Reading Railroad" 5 200 25 [ white ] 50 100 200 0 0 0 100

let orientalave =
  create_property "Oriental Avenue" 6 100 6 [ cyan ] 50 30 90 270 400 550 50

let chance1 = create_property "Chance" 7 0 0 [ default ] 0 0 0 0 0 0 0

let vermontave =
  create_property "Vermont Avenue" 8 100 6 [ cyan ] 50 30 90 270 400 550 50

let connecticutave =
  create_property "Connecticut Avenue" 9 120 8 [ cyan ] 50 40 100 300 450 600 60

let jail = create_property "Jail" 10 0 0 [ default ] 0 0 0 0 0 0 0

let stcharlesplace =
  create_property "St. Charles Place" 11 140 10 [ magenta ] 100 50 150 450 625
    750 70

let electric_company =
  create_property "Electric Company" 12 0 0 [ default ] 0 0 0 0 0 0 0

let statesave =
  create_property "States Avenue" 13 140 10 [ magenta ] 100 50 150 450 625 750
    70

let virginiaave =
  create_property "Virginia Avenue" 14 160 12 [ magenta ] 100 60 180 500 700 900
    80

let pennsylvania_railroad =
  create_property "Pennsylvania Railroad" 15 200 25 [ white ] 50 100 200 0 0 0
    100

let stjamesplace =
  create_property "St. James Place" 16 180 14 [ red; on_yellow ] 100 70 200 550
    750 950 90

let community_chest2 =
  create_property "Community Chest" 17 0 0 [ default ] 0 0 0 0 0 0 0

let tennesseeave =
  create_property "Tennessee Avenue" 18 180 14 [ red; on_yellow ] 100 70 200 550
    750 950 90

let newyorkave =
  create_property "New York Avenue" 19 200 16 [ red; on_yellow ] 100 80 220 600
    800 1000 100

let free_parking =
  create_property "Free Parking" 20 0 0 [ default ] 0 0 0 0 0 0 0

let kentuckyave =
  create_property "Kentucky Avenue" 21 220 18 [ red ] 150 90 250 700 875 1050
    110

let chance2 = create_property "Chance" 22 0 0 [ default ] 0 0 0 0 0 0 0

let indianaave =
  create_property "Indiana Avenue" 23 220 18 [ red ] 150 90 250 700 875 1050 110

let illinoisave =
  create_property "Illinois Avenue" 24 240 20 [ red ] 150 100 300 750 925 1100
    120

let bo_railroad =
  create_property "B. & O. Railroad" 25 200 25 [ white ] 50 100 200 0 0 0 100

let atlanticave =
  create_property "Atlantic Avenue" 26 260 22 [ yellow ] 150 110 330 800 975
    1150 130

let ventnorave =
  create_property "Ventnor Avenue" 27 260 22 [ yellow ] 150 110 330 800 975 1150
    130

let water_works = create_property "Water Works" 28 0 0 [ default ] 0 0 0 0 0 0 0

let marvingardens =
  create_property "Marvin Gardens" 29 280 22 [ yellow ] 150 120 360 850 1025
    1200 140

let go_to_jail = create_property "Go To Jail" 30 0 0 [ default ] 0 0 0 0 0 0 0

let pacificave =
  create_property "Pacific Avenue" 31 300 26 [ green ] 200 130 390 900 1100 1275
    150

let northcarolinaave =
  create_property "North Carolina Avenue" 32 300 26 [ green ] 200 130 390 900
    1100 1275 150

let community_chest3 =
  create_property "Community Chest" 33 0 0 [ default ] 0 0 0 0 0 0 0

let pennsylvaniaave =
  create_property "Pennsylvania Avenue" 34 320 28 [ green ] 200 150 450 1000
    1200 1400 160

let shortline_railroad =
  create_property "Short Line Railroad" 35 200 25 [ white ] 50 100 200 0 0 0 100

let chance3 = create_property "Chance" 36 0 0 [ default ] 0 0 0 0 0 0 0

let parkplace =
  create_property "Park Place" 37 350 35 [ blue ] 200 175 500 1100 1300 1500 175

let luxury_tax = create_property "Luxury Tax" 38 0 0 [ default ] 0 0 0 0 0 0 0

let boardwalk =
  create_property "Boardwalk" 39 400 50 [ blue ] 200 200 600 1400 1700 2000 200

let property_list =
  [
    go;
    mediterraneanave;
    community_chest1;
    balticave;
    income_tax;
    reading_railroad;
    orientalave;
    chance1;
    vermontave;
    connecticutave;
    jail;
    stcharlesplace;
    electric_company;
    statesave;
    virginiaave;
    pennsylvania_railroad;
    stjamesplace;
    community_chest2;
    tennesseeave;
    newyorkave;
    free_parking;
    kentuckyave;
    chance2;
    indianaave;
    illinoisave;
    bo_railroad;
    atlanticave;
    ventnorave;
    water_works;
    marvingardens;
    go_to_jail;
    pacificave;
    northcarolinaave;
    community_chest3;
    pennsylvaniaave;
    shortline_railroad;
    chance3;
    parkplace;
    luxury_tax;
    boardwalk;
  ]
