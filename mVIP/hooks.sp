public void HookEvents(){
	HookEvent("player_disconnect", PlayerDisconnect_Event,EventHookMode_Pre);
	//HookEvent("round_start", RoundStart_Event,EventHookMode_Pre);
	//HookEvent("round_end", RoundEnd_Event, EventHookMode_Post);
	HookEvent("player_spawn", PlayerSpawn_Event);
	HookEvent("player_death", PlayerDeath_Event);
}
public void OnClientPostAdminCheck(int iClient){
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && g_cvViPConnnectAnnoucment.BoolValue){
		PrintToChatAll("%s %N has joined the game", VIP_PREFIX, iClient);
	}	
}

public Action PlayerDisconnect_Event(Event hEvent, const char[] name, bool dontBroadcast) 
{
	int iClient = GetClientOfUserId(hEvent.GetInt("userid"));
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && g_cvViPDisconnectAnnoucment.BoolValue){
		
		PrintToChatAll("%s %N has left the game", VIP_PREFIX, iClient);
		return Plugin_Handled;
	}
	return Plugin_Continue;
}

public Action PlayerSpawn_Event(Event hEvent, const char[] name, bool dontBroadcast) 
{
	int iClient = GetClientOfUserId(hEvent.GetInt("userid"));
	
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && !IsPistolOrKnifeRound())
	{
		SetEntityHealth(iClient, g_cvViPStartRoundHp.IntValue);
		CreateTimer(0.5,GivePlayerGrenades,iClient);
	}
}

public Action PlayerDeath_Event(Event hEvent, const char[] name, bool dontBroadcast) {
	
	int iAttacker = GetClientOfUserId(hEvent.GetInt("attacker"));
	int iVictim = GetClientOfUserId(hEvent.GetInt("userid"));
	
	if((IsValidClient(iAttacker) && IsValidClient(iVictim)) && IsPlayerVip(iAttacker) && !IsPistolOrKnifeRound() && GetClientTeam(iAttacker) != GetClientTeam(iVictim))
	{
		bool bHeadshot = hEvent.GetBool("headshot", false);
		
		char sWeapon[64];
		hEvent.GetString("weapon", sWeapon, sizeof(sWeapon));
		
		if (bHeadshot) {
			AddBonusHealth(iAttacker, g_cvViPHealthBonusPerHeadshotKill.IntValue);
			
			return; }
		
		if(IsKnifeClass(sWeapon)) {
			
			AddBonusHealth(iAttacker, g_cvViPHealthBonusPerKnifeKill.IntValue); return;
		}
		
		AddBonusHealth(iAttacker, g_cvViPHealthBonusPerKill.IntValue);
		return;
		
	}
	
}