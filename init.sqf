enableSaving [ true, false ];



//Preprocessor Compiles go here



//Player Relations are defined here
//Faction trust for all factions must start Neutral

/*
	There are only 3 sides and 1 is occupied.
	To meet this constraint I've compressed the factions.
	NATO and FIA (UN and SK) are BLUFOR
	AAF and Syndikat (China and Mafia) are INDFOR
	BLU and IND are enemies.
	3-Way War

	Lore-reasoning:
	FIA is backed by British CTRG, and technically allied with NATO.
	Corrupt AAF officials are supporting Mafia (sometimes).
	Can use OPFOR FIA to simulate AAF vs Mafia situations.
	Sort of 3.5-Way War.
*/

west setFriend [resistance, 0];
resistance setFriend [west, 0];
resistance setFriend [east, 0];		//Can never be too sure, so I set it again
east setFriend [resistance, 0];




