type t

val get_name : t -> string
(** [get_name] returns the name of the property. *)

val get_pos : t -> int
(** [get_pos] returns the position of the property on the board. *)

val get_cost : t -> int
(** [get_cost] returns the cost to purchase the property. *)

val get_rent : t -> int
(** [get_rent] returns the rent that a player landing on the property must pay. *)

val get_color : t -> ANSITerminal.style list
(** [get_color] returns the color group that the property falls under. *)

val ( = ) : t -> t -> bool
(** [p1 = p2] returns true if property 1 and property 2 are the same property.
    Two properties are the same property if they have the same name. *)

val create_property :
  string -> int -> int -> int -> ANSITerminal.style list -> int -> t
(** [create_property name pos cost rent color] creates a property with the name
    [name], position [pos], cost [cost], rent [rent], and color [color]. *)
