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

val create_property : string -> int -> int -> int -> t
(** [create_property] creates a property with the given name, position, cost,
    and rent. *)
