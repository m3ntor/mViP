#pragma semicolon 1

#define DEBUG

#include <sourcemod>
#include <sdktools>

#define VIP_PREFIX " ★\x02[VIP]\x04"


#include "mVIP/globals.sp"
#include "mVIP/configs.sp"
#include "mVIP/helpers.sp"
#include "mVIP/hooks.sp"
#pragma newdecls required

public Plugin myinfo = 
{
	name = "mVIP",
	author = "m3ntor",
	description = "VIP Core",
	version = "1.0a",
	url = "https://steamcommunity.com/id/m3ntorsky"
};

public void OnPluginStart()
{
	LoadConVars();
	HookEvents();
	
	RegConsoleCmd("sm_vip", CommandVIP);
}

public Action CommandVIP(int iClient, int iArgs){
	if(IsValidClient(iClient) && IsPlayerVip(iClient)){
		PrintToChat(iClient, "Masz VIP'a");
		return Plugin_Handled;
	}
	PrintToChat(iClient, "Nie masz VIP'a");
	return Plugin_Handled;
}





