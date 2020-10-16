/*************************************************************
 Holding Weapons Filterscript
 -» Author             : robin_be (yugecin)
 -» Release Date       : 28th March 2012
 -» Description        : You hold weapons when you are not using them.
 -» Video              : http://www.youtube.com/watch?v=Z4DDxK1vwQ8
 -» forum post         : http://forum.sa-mp.com/showthread.php?t=329467
 -» NOTE               : USES PlayerAttachedObjectSlots 0-8
 Refix by : algorithm1927 - All credits going to robin_be
**************************************************************/
#include <a_samp>
#define TIME 250 //Timer for check if player is cycling through weapons or received another weapon (in ms)
#define playercommand //comment this line to disable the /holdingweapon command for players
forward Enable(playerid);
forward Disable(playerid);
forward AttachWeapon();
forward HoldingWeaponsForAll(boolean);
new wep[MAX_PLAYERS] = -1, timer, weps[12], d[MAX_PLAYERS] = 1, d1 = 1, camera[MAX_PLAYERS];
public OnFilterScriptInit() {
	timer = SetTimer("AttachWeapon", TIME, 1);
	return print("[FS]HoldingWeapons Loaded!");
}

public OnFilterScriptExit() {
	for(new i = 0; i < MAX_PLAYERS+1; i++) if(IsPlayerConnected(i)) if(!IsPlayerNPC(i))	for(new a = 0; a < 10; a++)	if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
	return print("[FS]HoldingWeapons Unloaded!");
}

public AttachWeapon(){
	for(new i = 0; i < MAX_PLAYERS+1; i++){
	    if(IsPlayerNPC(i)) return 1;
	    if(IsPlayerInAnyVehicle(i)) {
			for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
			wep[i] = -1;
			return 1;
		}
		if(!d[i]) return 1;
		if(camera[i]) return 1;
	    
	    if(wep[i] != GetPlayerWeapon(i)) for(new a = 0; a < 12; a++){
	    	GetPlayerWeaponData(i, a, weps[a], weps[6]);
			switch(a){
			    case 0: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 0)) RemovePlayerAttachedObject(i, 0);
			        if(weps[a] == 1 && GetPlayerWeapon(i) != 1) SetPlayerAttachedObject( i, 0, 331, 6, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
			    }
			    case 1: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 1)) RemovePlayerAttachedObject(i, 1);
			        switch(weps[a]){
						case 4: if(GetPlayerWeapon(i) != 4) SetPlayerAttachedObject( i, 0, 335, 11, 0.142010, -0.100988, 0.055910, 76.125000, 75.876144, 1.143326, 1.000000, 1.000000, 1.000000 );
						case 8: if(GetPlayerWeapon(i) != 8) SetPlayerAttachedObject( i, 1, 339, 15, 0.088326, 0.066626, 0.148351, 191.990447, 341.412963, 0.000000, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 2: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 2)) RemovePlayerAttachedObject(i, 2);
			        switch(weps[a]){
						case 22: if(GetPlayerWeapon(i) != 22) SetPlayerAttachedObject( i, 2, 346, 8, -0.028010, -0.033822, 0.097883, 270.000000, 15.999426, 354.161499, 1.000000, 1.000000, 1.000000 );
						case 23: if(GetPlayerWeapon(i) != 23) SetPlayerAttachedObject( i, 2, 346, 8, -0.028010, -0.033822, 0.097883, 270.000000, 15.999426, 354.161499, 1.000000, 1.000000, 1.000000 );
						case 24: if(GetPlayerWeapon(i) != 24) SetPlayerAttachedObject( i, 2, 348, 8, -0.040643, -0.048525, 0.085376, 270.000000, 8.253683, 0.000000, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 3: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 3)) RemovePlayerAttachedObject(i, 3);
			        switch(weps[a]){
						case 25: if(GetPlayerWeapon(i) != 25) SetPlayerAttachedObject( i, 3, 349, 16, 0.084126, 0.131737, 0.197423, 176.984542, 92.569320, 14.483574, 1.000000, 1.000000, 1.000000 );
						case 26: if(GetPlayerWeapon(i) != 26) SetPlayerAttachedObject( i, 3, 350, 16, 0.090676, 0.085271, -0.075131, 0.000000, 289.166870, 355.209869, 1.000000, 1.000000, 1.000000 );
						case 27: if(GetPlayerWeapon(i) != 27) SetPlayerAttachedObject( i, 3, 351, 16, 0.100795, 0.057224, -0.082939, 180.000000, 243.483581, 180.000000, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 4: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 4)) RemovePlayerAttachedObject(i, 4);
			        switch(weps[a]){
						case 28: if(GetPlayerWeapon(i) != 28) SetPlayerAttachedObject( i, 4, 352, 7, 0.138560, -0.033982, -0.047630, 281.671447, 276.618591, 4.068862, 1.000000, 1.000000, 1.000000 );
						case 29: if(GetPlayerWeapon(i) != 29) SetPlayerAttachedObject( i, 4, 353, 7, 0.008329, -0.067031, -0.060214, 289.865051, 17.391622, 7.667663, 1.000000, 1.000000, 1.000000 );
						case 32: if(GetPlayerWeapon(i) != 32) SetPlayerAttachedObject( i, 4, 372, 7, 0.056180, -0.008887, -0.007959, 270.000000, 13.921591, 5.905599, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 5: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 5)) RemovePlayerAttachedObject(i, 5);
			        switch(weps[a]){
						case 30: if(GetPlayerWeapon(i) != 30) SetPlayerAttachedObject( i, 5, 355, 1, -0.130044, -0.127836, 0.025491, 2.044970, 6.239807, 6.833646, 1.000000, 1.000000, 1.000000 );
						case 31: if(GetPlayerWeapon(i) != 31) SetPlayerAttachedObject( i, 5, 356, 16, 0.019280, 0.118553, 0.396286, 70.920410, 274.673919, 253.978057, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 8: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 6)) RemovePlayerAttachedObject(i, 6);
			        switch(weps[a]){
						case 16: if(GetPlayerWeapon(i) != 16) SetPlayerAttachedObject( i, 6, 342, 16, -0.110845, -0.041751, 0.087840, 55.051963, 84.884071, 247.221984, 1.000000, 1.000000, 1.000000 );
						case 17: if(GetPlayerWeapon(i) != 17) SetPlayerAttachedObject( i, 6, 1672, 16, -0.110606, -0.054021, 0.036716, 215.687911, 354.659393, 90.000000, 1.000000, 1.000000, 1.000000 );
						case 18: if(GetPlayerWeapon(i) != 18) SetPlayerAttachedObject( i, 6, 344, 15, 0.029351, -0.208807, -0.164047, 0.000000, 359.932037, 0.000000, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 9: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 7)) RemovePlayerAttachedObject(i, 7);
			        switch(weps[a]){
						case 43: if(GetPlayerWeapon(i) != 43) SetPlayerAttachedObject( i, 7, 367, 1, 0.227036, 0.171111, -0.085516, 270.000000, 0.000000, 180.000000, 1.000000, 1.000000, 1.000000 );
						case 41: if(GetPlayerWeapon(i) != 41) SetPlayerAttachedObject( i, 7, 365, 12, 0.174919, -0.004211, -0.142508, 0.000000, 270.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
					}
			    }
			    case 11: {
			        if(IsPlayerAttachedObjectSlotUsed(i, 8)) RemovePlayerAttachedObject(i, 8);
			        if(weps[a] == 44 || weps[a] == 45) if(GetPlayerWeapon(i) != 44 && GetPlayerWeapon(i) != 45) SetPlayerAttachedObject( i, 8, 369, 2, 0.000000, 0.078037, 0.000000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000 );
			    }
			}
	    }
	    wep[i] = GetPlayerWeapon(i);
	}
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[]){
    if(!strcmp(cmdtext, "/holdingweapons", true)){
		#if defined playercommand
	        if(d1){
		        if(d[playerid]){
					SendClientMessage(playerid, 0x0000FFAA, "[HWEAPONS] {FFFFFF}Disabled.");
					Disable(playerid);
		        } else {
					SendClientMessage(playerid, 0x0000FFAA, "[HWEAPONS] {FFFFFF}Enabled.");
		            Enable(playerid);
		        }
			} else SendClientMessage(playerid, 0x0000FFAA, "[HWEAPONS] {FFFFFF}This function is disabled.");
	        return 1;
		#else
			return SendClientMessage(playerid, 0x0000FFAA, "[HWEAPONS] {FFFFFF}This function is disabled.");
		#endif
    }
    return 0;
}

public Disable(playerid) {
    d[playerid] = 0;
    wep[playerid] = -1;
    for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(playerid, a)) RemovePlayerAttachedObject(playerid, a);
	return 1;
}

public Enable(playerid) {
    d[playerid] = 1;
	return 1;
}

public HoldingWeaponsForAll(boolean) {
	if(boolean == 0){
 		if(!d1) return 1;
		for(new i = 0; i < MAX_PLAYERS+1; i++) for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(i, a)) RemovePlayerAttachedObject(i, a);
		KillTimer(timer);
		d1 = 0;
	    return 1;
	}
	if(boolean == 1){
		if(d1) return 1;
		timer = SetTimer("AttachWeapon", TIME, 1);
		d1 = 1;
		return 1;
	}
 	return 0;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys){
    if(newkeys == 128 && oldkeys != 128 && GetPlayerWeapon(playerid) == 43) {
        camera[playerid] = 1;
        for(new a = 0; a < 9; a++) if(IsPlayerAttachedObjectSlotUsed(playerid, a)) RemovePlayerAttachedObject(playerid, a);
    }
	if(newkeys != 128 && oldkeys == 128 && GetPlayerWeapon(playerid) == 43) camera[playerid] = 0;
	return 1;
}
