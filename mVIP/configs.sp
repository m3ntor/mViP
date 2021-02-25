
public void LoadConVars()
{
	g_cvVipFlag = CreateConVar("mvip_flag", "o", "Required flag for the Vip player (Leave empty so all the players will have VIP).");
	
	g_cvVipConnnectAnnoucment = CreateConVar("mvip_connect_annnoucment", "1", "Enable/disable vip connection annoucment", _, true, 0.0, true, 1.0);
	
	g_cvVipDisconnectAnnoucment = CreateConVar("mvip_disconnect_annnoucment", "1", "Enable/disable vip disconnect annoucment", _, true, 0.0, true, 1.0);
	
	
	AutoExecConfig(true, "mVIP");
}