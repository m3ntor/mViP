public void HookEvents(){
	HookEvent("player_disconnect", PlayerDisconnect_Event,EventHookMode_Pre);
}

public void OnClientPostAdminCheck(int iClient){
	if(IsPlayerVip(iClient) && IsValidClient(iClient) && g_cvVipConnnectAnnoucment.BoolValue){
		PrintToChatAll("╔════════════════════════════════════════╗");
		PrintToChatAll("%s %N has joined the game", VIP_PREFIX, iClient);
		PrintToChatAll("╚════════════════════════════════════════╝");
	}	
}

public Action PlayerDisconnect_Event(Event event, const char[] name, bool dontBroadcast) 
{
	int iClient = GetClientOfUserId(event.GetInt("userid"));
	if(IsPlayerVip(iClient) && IsValidClient(iClient) && g_cvVipDisconnectAnnoucment.BoolValue){
		
		PrintToChatAll("╔════════════════════════════════════════╗");
		PrintToChatAll("%s %N has left the game", VIP_PREFIX, iClient);
		PrintToChatAll("╚════════════════════════════════════════╝");
		return Plugin_Handled;
	}
	return Plugin_Continue;
}