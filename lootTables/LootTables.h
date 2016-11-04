/*
	///////////////////////////////////////////////////////////////////////////////
	// Class Names
	///////////////////////////////////////////////////////////////////////////////

	Remember that item class names, group names and loot table names cannot 
	contain spaces. Also be 100% sure to have the exact same name as in Arma,
	as they are *case sensive*.

	///////////////////////////////////////////////////////////////////////////////
	// Item Groups
	///////////////////////////////////////////////////////////////////////////////

	You can link one group of items to loot tables.
	One item should only be in one group.

	Syntax:
	= <Group Name>
	<Spawn Chance Within Group>,<Item Class Name>

	///////////////////////////////////////////////////////////////////////////////
	// Propability
	///////////////////////////////////////////////////////////////////////////////

	<Spawn Chance>,<Item>

	10, Banana
	20, Tomato
	30, Cherry

	Sum of chances:
	10 + 20 + 30 = 60 = 100%

	Spawn chances:
	Banana	10 : 60 = 10 * 100 / 60 = 16.67%
	Tomato	20 : 60 = 20 * 100 / 60 = 33.33%
	Cherry	30 : 60 = 30 * 100 / 60 = 50%

	In words: 
	If Exile should spawn an item of the above group, it has a 33.33%
	chance to spawn a Banana.

	///////////////////////////////////////////////////////////////////////////////
	// Loot Tables
	///////////////////////////////////////////////////////////////////////////////

	Defines which item group spawns in which building type. The loot table itself
	is linked with a building in exile_server_config.pbo/config/CfgBuildings. Spawn
	chances work like for items.

	Syntax:
	> <Loot Table Name>
	<Spawn Chance Within Loot Table>,<Group Name>
*/



/*
	Loot Tables
*/

///////////////////////////////////////////////////////////////////////////////
// Slums/Ghetto, Farms, Village Houses, Castle etc.
// Spawn Guerilla things :)
///////////////////////////////////////////////////////////////////////////////
> CivillianLowerClass
30, Trash
7, Food
3, Drinks
8, Pistols
5, PistolAmmo
3, PistolAttachments
4, CivilianWeapons
3, ShotgunAmmo
6, SMG
4, SMGAmmo
3, SMGAttachments
20, CivilianClothing
11, CivilianBackpacks
5, CivilianVests
20, CivilianHeadgear
10, CivilianItems
1, Restraints
10, Chemlights
10, RoadFlares

///////////////////////////////////////////////////////////////////////////////
// Apartments, Offices etc.
///////////////////////////////////////////////////////////////////////////////
> CivillianUpperClass
30, Trash
7, Food
3, Drinks
3, Pistols
2, PistolAmmo
3, PistolAttachments
7, CivilianWeapons
3, ShotgunAmmo
4, SMG
3, SMGAmmo
3, SMGAttachments
1, Rifles
1, RifleAmmo
1, RifleAttachments
20, CivilianClothing
11, CivilianBackpacks
5, CivilianVests
20, CivilianHeadgear
10, CivilianItems
10, Chemlights
10, RoadFlares
1, Restraints

///////////////////////////////////////////////////////////////////////////////
// Kiosks, Supermarkets etc.
///////////////////////////////////////////////////////////////////////////////
> Shop
30, Trash
15, Food
15, Drinks
10, Pistols
2, PistolAmmo
1, PistolAttachments
4, CivilianWeapons
1, ShotgunAmmo
5, SMG
1, SMGAmmo
1, SMGAttachments
5, CivilianBackpacks
1, CivilianClothing
3, CivilianHeadgear
1, CivilianVests
7, CivilianItems
5, Chemlights
5, RoadFlares
4, SmokeGrenades
3, IndustrialItems
3, Restraints
3, MedicalItems

///////////////////////////////////////////////////////////////////////////////
// Construction Sites, Warehouses, Research etc.
///////////////////////////////////////////////////////////////////////////////
> Industrial
10, Trash
40, IndustrialItems
25, Vehicle
15, RoadFlares
5, Restraints

///////////////////////////////////////////////////////////////////////////////
// Factories
///////////////////////////////////////////////////////////////////////////////
> Factories
10, Electronics
20, Trash
50, IndustrialItems

///////////////////////////////////////////////////////////////////////////////
// Fuel Stations, Garages, Workshops etc.
///////////////////////////////////////////////////////////////////////////////
> VehicleService
20, Trash
25, IndustrialItems
40, Vehicle
15, RoadFlares
5, Restraints

///////////////////////////////////////////////////////////////////////////////
// Towers, Barracks, Hangars etc.
///////////////////////////////////////////////////////////////////////////////
> Military
65, Trash
3, CivilianItems
5, GuerillaItems
2, HEGrenades
1, UGLFlares
1, UGLSmokes
1, HandGrenades
1, SmokeGrenades
2, Restraints
2, MedicalItems
4, GuerillaClothing
5, MilitaryClothing
4, GuerillaBackpacks
5, MilitaryBackpacks
3, GuerillaVests
4, MilitaryVests
1, DLCVests
3, GuerillaHeadgear
3, MilitaryHeadgear
1, Rebreathers
8, Rifles
6, RifleAmmo
3, RifleAttachments
4, LMG
3, LMGAmmo
1, Snipers
2, SniperAmmo
2, SniperAttachments
2, SMG
1, SMGAmmo
1, Pistols
1, PistolAmmo
1, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
2, Bipods
1, Explosives

///////////////////////////////////////////////////////////////////////////////
// Hospital, Medevac etc. (Does not spawn on Altis!)
///////////////////////////////////////////////////////////////////////////////
> Medical
30, Trash
70, MedicalItems

///////////////////////////////////////////////////////////////////////////////
// Light Houses + Life Guard Towers + Castles
///////////////////////////////////////////////////////////////////////////////
> Tourist
10, MilitaryBackpacks
10, MilitaryHeadgear
1, Ghillies
1, DLCGhillies
15, Snipers
2, SniperAmmo
2, SniperAttachments
20, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
4, CivilianItems
4, HandGrenades
4, Restraints
4, MedicalItems
4, Explosives
5, Rifles
5, RifleAmmo

///////////////////////////////////////////////////////////////////////////////
// Ghost Hotel Buildings
///////////////////////////////////////////////////////////////////////////////
> Radiation
10, MilitaryBackpacks
8, MilitaryHeadgear
4, MilitaryVests
4, GuerillaItems
1, Ghillies
1, DLCGhillies
14, Snipers
2, SniperAmmo
2, SniperAttachments
5, LMG
3, LMGAmmo
15, DLCRifles
2, DLCAmmo
2, DLCOptics
2, DLCSupressor
4, HandGrenades
4, Restraints
5, MedicalItems
8, Explosives
3, EpicWeapons
8, Rifles
4, RifleAmmo
6, DLCVests
1, Pistols
1, PistolAmmo
1, ThermalHelmetGroup