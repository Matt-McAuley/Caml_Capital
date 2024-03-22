type t

val get_name : t -> string
(** [get_name] is returns the name of the property. *)

val get_pos : t -> int
(** [get_pos] is returns the position of the property on the board. *)

val get_cost : t -> int
(** [get_cost] is returns the cost to purchase the property. *)

val get_rent : t -> int
(** [get_rent] is returns the rent that a player landing on the property must
    pay. *)

val ( = ) : t -> t -> bool
(** [p1 = p2] returns true if property 1 and property 2 are the same property.
    Two properties are the same property if they have the same name. *)

val create_property : string -> int -> int -> int -> t
(** [create_property] creates a property with the given name, position, cost,
    and rent. *)
