type t = {
  name : string;
  position : int;
  properties : Property.t list;
  money : int;
}

let create_player name = { name; position = 0; properties = []; money = 1500 }
let get_position player = player.position

let set_position player new_pos =
  {
    name = player.name;
    position = new_pos;
    properties = player.properties;
    money = player.money;
  }

let get_properties player = player.properties

let add_property player property =
  {
    name = player.name;
    position = player.position;
    properties = property :: player.properties;
    money = player.money;
  }

let remove_property player property =
  {
    name = player.name;
    position = player.position;
    properties = List.filter (fun x -> x = property) player.properties;
    money = player.money;
  }

let add_money player money =
  {
    name = player.name;
    position = player.position;
    properties = player.properties;
    money = player.money + money;
  }

let remove_money player money =
  {
    name = player.name;
    position = player.position;
    properties = player.properties;
    money = player.money - money;
  }
