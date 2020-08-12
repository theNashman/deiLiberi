/*
	SideA and SideB are the sides whose realtions should be changed
	_friend is 0 or 1 for 'hostile' and 'friendly' respsectively
	e.g. ["west", "east", 1] call DLIB_fnc_changeRelation
	--This will make BLUFOR and OPFOR friendly
*/


params ["_sideA", "_sideB", "_friend"];
_sideA setFriend [_sideB, _friend];
_sideB setFriend [_sideA, _friend];		//Have to mirror it, command doesn't go both ways