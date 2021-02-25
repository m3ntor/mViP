
public void LoadConVars()
{
	g_cvViPFlag = CreateConVar("mvip_flag", "o", "Required flag for the Vip player (Leave empty so all the players will have VIP).");
	
	g_cvViPConnnectAnnoucment = CreateConVar("mvip_connect_annnoucment", "1", "Enable/disable vip connection annoucment", _, true, 0.0, true, 1.0);
	
	g_cvViPDisconnectAnnoucment = CreateConVar("mvip_disconnect_annnoucment", "1", "Enable/disable vip disconnect annoucment", _, true, 0.0, true, 1.0);
	
	g_cvViPStartRoundHp = CreateConVar("mvip_start_round_hp", "102", "Start HP for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPMaxHp = CreateConVar("mvip_max_hp", "110", "Max HP for ViP", _, true, 0.0, true, 1000.0);
	
	
	AutoExecConfig(true, "mVIP");
}