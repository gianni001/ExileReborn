
class CfgPatches 
{
	class Enigma_Exile_Custom {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		author[]= {"Happydayz_EngimaTeam"}; 	
	};
};
class CfgFunctions 
{
	class EnigmaTeam 
	{
		class main 
		{
			file = "\Enigma_Exile_Custom\init";
			class init
			{
				preInit = 1;
			};
			class postinit
			{
				postInit = 1;
			};
		};
	};
};

