class CfgPatches 
{
	class JohnOs_events
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_server"};
	};
};

class CfgFunctions
{
	class JohnOs_events
	{
		class Bootstrap
		{
			file="JohnOs_events\bootstrap";
			class preInit
			{
				preInit = 1;
			};
		};
	};
};
