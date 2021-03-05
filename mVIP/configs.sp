
public void LoadConVars()
{
	g_cvViPFlag = CreateConVar("mvip_flag", "aot", "Required flag for the Vip player (Leave empty so all the players will have VIP).");
	
	g_cvViPConnnectAnnoucment = CreateConVar("mvip_connect_annnoucment", "1", "Enable/disable vip connection annoucment", _, true, 0.0, true, 1.0);
	
	g_cvViPDisconnectAnnoucment = CreateConVar("mvip_disconnect_annnoucment", "1", "Enable/disable vip disconnect annoucment", _, true, 0.0, true, 1.0);
	
	g_cvViPStartRoundHp = CreateConVar("mvip_start_round_hp", "102", "Start HP for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPMaxHp = CreateConVar("mvip_max_hp", "110", "Max HP for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPHealthBonusPerKill= CreateConVar("mvip_health_bonus_per_kill", "1", "Bonus HP per kill for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPHealthBonusPerHeadshotKill= CreateConVar("mvip_health_bonus_per_headshot_kill", "2", "Bonus HP per headshot kill for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPHealthBonusPerKnifeKill= CreateConVar("mvip_health_bonus_per_knife_kill", "3", "Bonus HP per knife kill for ViP", _, true, 0.0, true, 1000.0);
	
	g_cvViPHeGrenade = CreateConVar("mvip_he_grenade_for_vip", "1", "Bonus he grenade for ViP on spawn", _, true, 0.0, true, 1.0);
	
	g_cvViPFlashGrenade = CreateConVar("mvip_flash_grenade_for_vip", "1", "Bonus flash grenade for ViP on spawn", _, true, 0.0, true, 1.0);
	
	g_cvViPSmokeGrenade = CreateConVar("mvip_smoke_grenade_for_vip", "1", "Bonus smoke grenade for ViP on spawn", _, true, 0.0, true, 1.0);
	
	g_cvViPFireGrenade = CreateConVar("mvip_fire_grenade_for_vip", "1", "Bonus inc/molotov grenade for ViP on spawn", _, true, 0.0, true, 1.0);

	g_cvViPDecoyGrenade = CreateConVar("mvip_decoy_grenade_for_vip", "1", "Bonus decoy grenade for ViP on spawn", _, true, 0.0, true, 1.0);

	g_cvViPDefuseKit = CreateConVar("mvip_defuse_kit_for_vip", "1", "Bonus defuse kit for ViP on spawn", _, true, 0.0, true, 1.0);
	
	g_cvViPKevlarType = CreateConVar("mvip_kevlar_type", "1", "0 - no kevlar \n 1- only kevlar \n 2- kevlar + helmet", _, true, 0.0, true, 2.0);
	
	g_cvViPKevlarValue = CreateConVar("mvip_kevlar_value", "100", "Setting ammount kevlar for vip on spawn", _, true, 0.0, true, 150.0);
	
	AutoExecConfig(true, "mVIP");
}
