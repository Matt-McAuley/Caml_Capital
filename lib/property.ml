type property = {
  name : string;
  pos : int;
  cost : int;
  rent : int;
}

let get_name p = p.name
let get_pos p = p.pos
let get_cost p = p.cost
let get_rent p = p.rent
let create_property name pos cost rent = { name; pos; cost; rent }
