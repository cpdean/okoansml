type not_player = Fox | Goose | Corn | Empty
type fox_spot = HasFox | NoFox
type goose_spot = HasGoose | NoGoose
type corn_spot = HasCorn | NoCorn
type player_spot = HasPlayer | NoPlayer
type river_side = (fox_spot * goose_spot * corn_spot * player_spot)
type boat = EmptyBoat | Boat of player_spot * not_player
type game_state = river_side * boat * river_side
