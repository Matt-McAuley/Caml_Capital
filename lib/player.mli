(* type t (** [t] is the type that represents a player of the Monopoly game *)

val create_player : string -> t
(** [create_player name] is a player starting at index of 0 with the identifier [name]
    starting with 1500 dollars and no properties. *)

val get_position : t -> int
(** [get_position player] is the index of [player] on the board. *)

val set_position : t -> int -> t
(** [set_position player new_pos] is a player with the fields of [player] but with index 
    updated on the board accoring to [new_pos]. *)

val get_properties : t -> Property.t list
(** [get_properties player] is the list of properties owned by [player]. *)

val add_property : t -> Property.t -> t
(** [add_property player property] is a player with the fields of [player] but with 
    [property] added to their properties. *)

val remove_property : t -> Property.t -> t
(** [add_property player property] is a player with the fields of [player] but with 
    [property] removed from their properties. *)

val add_money : t -> int -> t
(** [add_money player property] is a player with the fields of [player] but with 
    [money] added to their money. *)

val remove_money : t -> int -> t
(** [add_money player property] is a player with the fields of [player] but with 
    [money] removed from their money. *)
