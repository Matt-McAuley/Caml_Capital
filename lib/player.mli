type t
(** [t] is the type that represents a player of the Monopoly game *)

val create_player : string -> t
(** [create_player name] is a player starting at index of 0 with the identifier [name]. *)

val get_position : t -> int
(** [get_position player] is the index of [player] on the board. *)