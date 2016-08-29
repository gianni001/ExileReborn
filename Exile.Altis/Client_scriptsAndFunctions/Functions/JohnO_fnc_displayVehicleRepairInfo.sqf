_vehicle = _this select 0;

switch (true) do
{
	case (_vehicle isKindOf "CAR"):
	{
		["InfoTitleAndText", 

			["Repair Info", 
				format 
				[
				"
				Items in <t color='#669900'>GREEN are not consumed</t>
				<br />
				<t>&#160;</t>
				<br />
				To repair the body you need: <t color='#669900'>ToolBox,Wrench,</t><t color='#ff0000'>JunkMetal and DuctTape</t>
				<br />
				<t>&#160;</t>
				<br />
				To replace a wheel you need: <t color='#669900'>ToolBox,Wrench</t><t color='#ff0000'> and a Car Wheel</t>
				<br />
				<t>&#160;</t>
				<br />
				If a wheel is not below 30% damage you can repair it with <t color='#ff0000'>Duct Tape</t>
				"
				]
			]
		] call ExileClient_gui_toaster_addTemplateToast;
	};

	case (_vehicle isKindOf "AIR"):
	{
		["InfoTitleAndText", 

			["Repair Info", 
				format 
				[
				"
				Items in <t color='#669900'>GREEN are not consumed</t>
				<br />
				<t>&#160;</t>
				<br />
				To FULLY repair this vehicle you need:
				<br />
				<t>&#160;</t>
				<br />
				<t color='#669900'>ToolBox,Wrench,Oil Canister,</t><t color='#ff0000'>DuctTape,JunkMetal,MetalPole,MetalScrews and MetalWire</t>
				<br />
				<t>&#160;</t>
				<br />
				To do a MINOR repair (+20% HP) you need:
				<br />
				<t>&#160;</t>
				<br />
				<t color='#669900'>ToolBox,Wrench,</t><t color='#ff0000'>DuctTape and JunkMetal</t>
				"
				]
			]
		] call ExileClient_gui_toaster_addTemplateToast;
	};
};