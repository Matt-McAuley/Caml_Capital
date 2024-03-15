type property

val get_name : property -> string
(** [get_name] is returns the name of the property. *)

val get_pos : property -> int
(** [get_pos] is returns the position of the property on the board. *)

val get_cost : property -> int
(** [get_cost] is returns the cost to purchase the property. *)

val get_rent : property -> int
(** [get_rent] is returns the rent that a player landing on the property must
    pay. *)

val create_property : string -> int -> int -> int -> property
(** [create_property] creates a property with the given name, position, cost,
    and rent. *)
