/*
Inputs change increment and faction
Changes trust states for faction

-5 to -1 is enemy
0 to 9 is neutral
10 to 15 is friendly

Neutral for AAF/Mafia is the same as hostile because it should be harder for you to join their side
E.g [2, "NATO"] call DLIB_fnc_changeTrust
*/



params ["_trust", "_faction"];

private _trustArray = player getVariable ["DLIB_TRUST_ARRAY", [2,2,2,2]];
_DLIB_NATO_TRUST = _trustArray select 0;
_DLIB_FIA_TRUST = _trustArray select 1;
_DLIB_AAF_TRUST = _trustArray select 2;
_DLIB_MAFIA_TRUST = _trustArray select 3;


switch (_faction) do 
{
	case "NATO": 
	{
		_DLIB_NATO_TRUST = _DLIB_NATO_TRUST + _trust;
		if (_DLIB_NATO_TRUST > 15) then {_DLIB_NATO_TRUST = 15};
		if (_DLIB_NATO_TRUST < -5) then {_DLIB_NATO_TRUST = -5};
		_maxTrust = selectMax _trustArray;
		if (!(side player == west) and (selectMax _trustArray <= _DLIB_NATO_TRUST)) then {[player, west] call DLIB_fnc_changeSide};
		if ((side player == west) and (_DLIB_NATO_TRUST < 0)) then {[player, resistance] call DLIB_fnc_changeSide};
	};
	
	case "FIA": 
	{
		_DLIB_FIA_TRUST = _DLIB_FIA_TRUST + _trust; 
		if (_DLIB_FIA_TRUST > 15) then {_DLIB_FIA_TRUST = 15};
		if (_DLIB_FIA_TRUST < -5) then {_DLIB_FIA_TRUST = -5};
		if (!(side player == west) and (selectMax _trustArray <= _DLIB_FIA_TRUST)) then {[player, west] call DLIB_fnc_changeSide};
		if ((side player == west) and (_DLIB_FIA_TRUST < 0)) then {[player, resistance] call DLIB_fnc_changeSide};
	};

	case "AAF": 
	{
		_DLIB_AAF_TRUST = _DLIB_AAF_TRUST + _trust; 
		if (_DLIB_AAF_TRUST > 15) then {_DLIB_AAF_TRUST = 15};
		if (_DLIB_AAF_TRUST < -5) then {_DLIB_AAF_TRUST = -5};
		if (!(side player == resistance) and (selectMax _trustArray <= _DLIB_AAF_TRUST) and (_DLIB_AAF_TRUST > 9)) then {[player, resistance] call DLIB_fnc_changeSide};	
		if ((side player == resistance) and (_DLIB_AAF_TRUST < 0)) then {[player, west] call DLIB_fnc_changeSide};
	};

	case "MAFIA": 
	{
		hint "faction is MAFIA";
		_DLIB_MAFIA_TRUST = _DLIB_MAFIA_TRUST + _trust; 
		if (_DLIB_MAFIA_TRUST > 15) then {_DLIB_MAFIA_TRUST = 15};
		if (_DLIB_MAFIA_TRUST < -5) then {_DLIB_MAFIA_TRUST = -5};
		if (!(side player == resistance) and (selectMax _trustArray <= _DLIB_MAFIA_TRUST) and (_DLIB_MAFIA_TRUST > 9)) then {[player, resistance] call DLIB_fnc_changeSide};
		if ((side player == resistance) and (_DLIB_MAFIA_TRUST < 0)) then {[player, west] call DLIB_fnc_changeSide};
	};
};



/*

//Evaluate PlayerSide Var for special cases
//Should default to the side with highest trust value. Normally AAF and NATO cannot be friendly at the samw time
//But they can both be hostile

if (((_DLIB_NATO_TRUST < 0) or (_DLIB_FIA_TRUST < 0)) and ((_DLIB_AAF_TRUST < 0) or (_DLIB_MAFIA_TRUST < 0))) then {player addRating -10000};		//Make everyone hostile


*/

//Return the changed values to varspace
player setVariable ["DLIB_TRUST_ARRAY", [_DLIB_NATO_TRUST, _DLIB_FIA_TRUST, _DLIB_AAF_TRUST, _DLIB_MAFIA_TRUST], true];