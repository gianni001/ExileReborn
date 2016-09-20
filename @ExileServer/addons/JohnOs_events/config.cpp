//Heli crashes modded for Exile by Darth_Rogue
class CfgPatches 
{
	class JohnOs_events
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
	};
};

class CfgFunctions 
{
	class JohnOs_events
	{
		class A3CCustom 
		{
			file = "JohnOs_events\addons";
			class init {
				postInit = 1;
			};
		};
	};
};