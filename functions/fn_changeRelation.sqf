/*
	SideA and SideB are the sides whose realtions should be changed
	_friend is 0 or 1 for 'hostile' and 'friendly' respsectively
*/


params ["_sideA", "_sideB", "_friend"];
_sideA setFriend [_sideB, _friend];