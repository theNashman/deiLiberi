//Inputs change increment and faction
//Changes trust states for faction

//-5 to -1 is enemy
//0 to 9 is neutral
//10 to 15 is friendly

//Neutral for AAF/Mafia is the same as hostile because it should be harder for you to join their side



params ["_trust", "_faction"];

switch (_faction) do 
{
	case "NATO": 
	{
		DLIB_NATO_TRUST = DLIB_NATO_TRUST + _trust;
		if (DLIB_NATO_TRUST > 15) then {DLIB_NATO_TRUST = 15};
		if (DLIB_NATO_TRUST < -5) then {DLIB_NATO_TRUST = -5};
		if (!(side player == west) and (DLIB_NATO_TRUST == selectMax DLIB_TRUST_ARRAY)) then {[player, west] DLIB_fnc_changeSide};			//Friendly case
		if ((side player == west) and (DLIB_NATO_TRUST < 0)) then {[player, resistance] DLIB_fnc_changeSide};								//Hostile case
	};
	
	case "FIA": 
	{
		DLIB_FIA_TRUST = DLIB_FIA_TRUST + _trust; 
		if (DLIB_FIA_TRUST > 15) then {DLIB_FIA_TRUST = 15};
		if (DLIB_FIA_TRUST < -5) then {DLIB_FIA_TRUST = -5};
		if (!(side player == west) and (DLIB_FIA_TRUST == selectMax DLIB_TRUST_ARRAY)) then {[player, west] DLIB_fnc_changeSide};
		if ((side player == west) and (DLIB_FIA_TRUST < 0) then {[player, resistance] DLIB_fnc_changeSide};
	};

	case "AAF": 
	{
		DLIB_AAF_TRUST = DLIB_AAF_TRUST + _trust; 
		if (DLIB_AAF_TRUST > 15) then {DLIB_AAF_TRUST = 15};
		if (DLIB_AAF_TRUST < -5) then {DLIB_AAF_TRUST = -5};
		if (!(side player == resistance) and (DLIB_AAF_TRUST == selectMax DLIB_TRUST_ARRAY) and DLIB_AAF_TRUST > 9) then {[player, resistance] DLIB_fnc_changeSide};	
		if ((side player == resistance) and (DLIB_AAF_TRUST < 0)) then {[player, west] DLIB_fnc_changeSide};
	};

	case "MAFIA": 
	{
		DLIB_MAFIA_TRUST = DLIB_MAFIA_TRUST + _trust; 
		if (DLIB_MAFIA_TRUST > 15) then {DLIB_MAFIA_TRUST = 15};
		if (DLIB_MAFIA_TRUST < -5) then {DLIB_MAFIA_TRUST = -5};
		if (!(side player == resistance) and (DLIB_MAFIA_TRUST == selectMax DLIB_TRUST_ARRAY) and (DLIB_MAFIA_TRUST > 9)) then {[player, resistance] DLIB_fnc_changeSide};
		if ((side player == resistance) and (DLIB_MAFIA_TRUST < 0)) then {[player, west] DLIB_fnc_changeSide};
	};
};



//Evaluate PlayerSide Var for special cases
//Should default to the side with highest trust value. Normally AAF and NATO cannot be friendly at the samw time
//But they can both be hostile

if (((DLIB_NATO_TRUST < 0) or (DLIB_FIA_TRUST < 0)) and ((DLIB_AAF_TRUST < 0) or (DLIB_MAFIA_TRUST < 0))) then {player addRating -10000};		//Make everyone hostile

