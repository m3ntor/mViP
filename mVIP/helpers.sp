stock bool IsPlayerVip(int iClient)
{
	char sFlag[10];
	g_cvViPFlag.GetString(sFlag, sizeof(sFlag));
	return GetUserFlagBits(iClient) & ReadFlagString(sFlag) || GetAdminFlag(GetUserAdmin(iClient), Admin_Root);
}

stock bool IsValidClient(int iClient) {
  return iClient > 0 && iClient <= MaxClients && IsClientConnected(iClient) && IsClientInGame(iClient) && !IsFakeClient(iClient) && !IsClientSourceTV(iClient);
}

stock bool IsWarmUp(){ return GameRules_GetProp("m_bWarmupPeriod") == 1; }

stock int GetRoundCount() { return GetTeamScore(CS_TEAM_CT) + GetTeamScore(CS_TEAM_T); }

stock int IsPistolOrKnifeRound() { return GetRoundCount() == 0 || GetRoundCount() == 15; }


stock void AddBonusHealth(int iClient, int iBonusHealth){
	int iClientHealth = GetClientHealth(iClient);
	int iClientHealthWithBonus = iClientHealth + iBonusHealth;
	
	if(iClientHealthWithBonus > g_cvViPMaxHp.IntValue){
		SetEntityHealth(iClient, g_cvViPMaxHp.IntValue);
		return;
	}
	SetEntityHealth(iClient, iClientHealthWithBonus);
}

bool IsKnifeClass(const char[] classname)
{
	if ((StrContains(classname, "knife") > -1 && strcmp(classname, "weapon_knifegg") != 0) || StrContains(classname, "bayonet") > -1)
		return true;
	return false;
}