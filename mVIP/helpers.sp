stock bool IsPlayerVip(int iClient)
{
	char sFlag[10];
	g_cvVipFlag.GetString(sFlag, sizeof(sFlag));
	return GetUserFlagBits(iClient) & ReadFlagString(sFlag) || GetAdminFlag(GetUserAdmin(iClient), Admin_Root);
}

stock bool IsValidClient(int iClient) {
  return iClient > 0 && iClient <= MaxClients && IsClientConnected(iClient) && IsClientInGame(iClient) && !IsFakeClient(iClient);
}