public void HookEvents(){
	HookEvent("player_disconnect", PlayerDisconnect_Event,EventHookMode_Pre);
	//HookEvent("round_start", RoundStart_Event,EventHookMode_Pre);
	//HookEvent("round_end", RoundEnd_Event, EventHookMode_Post);
	HookEvent("player_spawn", PlayerSpawn_Event);
}
public void OnClientPostAdminCheck(int iClient){
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && g_cvViPConnnectAnnoucment.BoolValue){
		PrintToChatAll("╔════════════════════════════════════════╗");
		PrintToChatAll("%s %N has joined the game", VIP_PREFIX, iClient);
		PrintToChatAll("╚════════════════════════════════════════╝");
	}	
}

public Action PlayerDisconnect_Event(Event event, const char[] name, bool dontBroadcast) 
{
	int iClient = GetClientOfUserId(event.GetInt("userid"));
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && g_cvViPDisconnectAnnoucment.BoolValue){
		
		PrintToChatAll("╔════════════════════════════════════════╗");
		PrintToChatAll("%s %N has left the game", VIP_PREFIX, iClient);
		PrintToChatAll("╚════════════════════════════════════════╝");
		return Plugin_Handled;
	}
	return Plugin_Continue;
}

public Action PlayerSpawn_Event(Event event, const char[] name, bool dontBroadcast) 
{
	int iClient = GetClientOfUserId(event.GetInt("userid"));
	
	if(IsValidClient(iClient) && IsPlayerVip(iClient) && !IsPistolOrKnifeRound())
	{
		SetEntityHealth(iClient, g_cvViPStartRoundHp.IntValue);
	}
}