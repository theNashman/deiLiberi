/*
Used primarily to change the player side to simulate Player-Faction relations
Incorporated into fn_changeTrust
Usage: [_unit, _side] call DLIB_fnc_changeSide
	_unit: unit whose side you want to change
	_side: side you want to change to
*/

params ["_unit", "_side"];
[_unit] joinSilent createGroup [_side, true];