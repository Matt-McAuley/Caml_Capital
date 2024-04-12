open Property
open ANSITerminal

let go = create_property "GO!" 0 0 0 [ default ] 0

let mediterraneanave =
  create_property "Mediterranean Avenue" 1 60 2 [ yellow; on_red ] 0

let balticave = create_property "Baltic Avenue" 2 60 4 [ yellow; on_red ] 0
let orientalave = create_property "Oriental Avenue" 3 100 6 [ cyan ] 0
let vermontave = create_property "Vermont Avenue" 4 100 6 [ cyan ] 0
let connecticutave = create_property "Connecticut Avenue" 5 120 8 [ cyan ] 0
let stcharlesplace = create_property "St. Charles Place" 6 140 10 [ magenta ] 0
let statesave = create_property "States Avenue" 7 140 10 [ magenta ] 0
let virginiaave = create_property "Virginia Avenue" 8 160 12 [ magenta ] 0

let stjamesplace =
  create_property "St. James Place" 9 180 14 [ red; on_yellow ] 0

let tennesseeave =
  create_property "Tennessee Avenue" 10 180 14 [ red; on_yellow ] 0

let newyorkave =
  create_property "New York Avenue" 11 200 16 [ red; on_yellow ] 0

let kentuckyave = create_property "Kentucky Avenue" 12 220 18 [ red ] 0
let indianaave = create_property "Indiana Avenue" 13 220 18 [ red ] 0
let illinoisave = create_property "Illinois Avenue" 14 240 20 [ red ] 0
let atlanticave = create_property "Atlantic Avenue" 15 260 22 [ yellow ] 0
let ventnorave = create_property "Ventnor Avenue" 16 260 22 [ yellow ] 0
let marvingardens = create_property "Marvin Gardens" 17 280 22 [ yellow ] 0
let pacificave = create_property "Pacific Avenue" 18 300 26 [ green ] 0

let northcarolinaave =
  create_property "North Carolina Avenue" 19 300 26 [ green ] 0

let pennsylvaniaave =
  create_property "Pennsylvania Avenue" 20 320 28 [ green ] 0

let parkplace = create_property "Park Place" 21 350 35 [ blue ] 0
let boardwalk = create_property "Boardwalk" 22 400 50 [ blue ] 0

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
