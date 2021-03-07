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

//stock int IsPistolOrKnifeRound() { return GetRoundCount() == 0 || GetRoundCount() == 15; }


stock void AddBonusHealth(int iClient, int iBonusHealth){
	int iClientHealth = GetClientHealth(iClient);
	int iClientHealthWithBonus = iClientHealth + iBonusHealth;
	
	if(iClientHealthWithBonus > g_cvViPMaxHp.IntValue){
		SetEntityHealth(iClient, g_cvViPMaxHp.IntValue);
		return;
	}
	SetEntityHealth(iClient, iClientHealthWithBonus);
}

bool IsKnifeClass(const char[] sClassname)
{
	if ((StrContains(sClassname, "knife") > -1 && strcmp(sClassname, "weapon_knifegg") != 0) || StrContains(sClassname, "bayonet") > -1)
		return true;
	return false;
}

public Action GivePlayerBonuses(Handle timer, int iClient)
{
	if(IsValidClient(iClient)){
		
		if (!g_cvBonusOnFirstRound.BoolValue && GetRoundCount() == 0) { return; }
		
		if (!g_cvBonusAfterHalfTime.BoolValue && g_cvHalfTime.IntValue == 1 && GetRoundCount() == (g_cvMaxRounds.IntValue / 2)) { return; }
		
		if (g_cvViPHeGrenade.BoolValue && GetClientHEGrenades(iClient) == 0) { GivePlayerItem(iClient,"weapon_hegrenade"); }
		
		if (g_cvViPSmokeGrenade.BoolValue && GetClientSmokeGrenades(iClient) == 0) { GivePlayerItem(iClient,"weapon_smokegrenade"); }
		
		if (g_cvViPFlashGrenade.BoolValue && GetClientFlashbangs(iClient) == 0) { GivePlayerItem(iClient,"weapon_flashbang"); }
		
		if(g_cvViPFireGrenade.BoolValue && GetClientFireGrenades(iClient) == 0){
			switch(GetClientTeam(iClient))
			{
				case CS_TEAM_T:
				{
					GivePlayerItem(iClient,"weapon_molotov");
				}
				case CS_TEAM_CT:
				{
					GivePlayerItem(iClient,"weapon_incgrenade");
					if (g_cvViPDefuseKit.BoolValue && GetClientDefuseKit(iClient) == 0) {
						SetEntProp(iClient, Prop_Send, "m_bHasDefuser", 1);
					}
				}
			}
		}
		
		if (g_cvViPDecoyGrenade.BoolValue && GetClientDecoyGrenades(iClient) == 0) { GivePlayerItem(iClient,"weapon_decoy"); }
		
		if(g_cvViPKevlarType.IntValue == 1){
			SetEntProp(iClient, Prop_Send, "m_ArmorValue", g_cvViPKevlarValue.IntValue);
		} else if(g_cvViPKevlarType.IntValue == 2){
			SetEntProp(iClient, Prop_Send, "m_ArmorValue", g_cvViPKevlarValue.IntValue);
			SetEntProp(iClient, Prop_Send, "m_bHasHelmet", 1);
		}
	}
}


stock int GetClientHEGrenades(int iClient)
{
	return GetEntProp(iClient, Prop_Data, "m_iAmmo", _, HEGrenadeOffset);
}

stock int GetClientSmokeGrenades(int iClient)
{
	return GetEntProp(iClient, Prop_Data, "m_iAmmo", _, SmokegrenadeOffset);
}

stock int GetClientFlashbangs(int iClient)
{
	return GetEntProp(iClient, Prop_Data, "m_iAmmo", _, FlashbangOffset);
}

stock int GetClientFireGrenades(int iClient)
{
	return GetEntProp(iClient, Prop_Data, "m_iAmmo", _, FireGrenadesOffset);
}

stock int GetClientDecoyGrenades(int iClient)
{
	return GetEntProp(iClient, Prop_Data, "m_iAmmo", _, DecoyGrenadeOffset);
}

stock int GetClientDefuseKit(int iClient)
{
	return GetEntProp(iClient, Prop_Send, "m_bHasDefuser");
}
