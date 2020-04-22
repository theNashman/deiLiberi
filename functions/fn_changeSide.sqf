//Used primarily to change the player side to simulate Player-Faction relations

params ["_unit", "_side"];
[_unit] joinSilent createGroup [_side, true];