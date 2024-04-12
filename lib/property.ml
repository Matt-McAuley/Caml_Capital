type t = {
  name : string;
  pos : int;
  cost : int;
  rent : int;
  color : ANSITerminal.style list;
}

let get_name p = p.name
let get_pos p = p.pos
let get_cost p = p.cost
let get_rent p = p.rent
let get_color p = p.color
let ( = ) p1 p2 = p1.name = p2.name
let create_property name pos cost rent color = { name; pos; cost; rent; color }
