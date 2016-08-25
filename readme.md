#Installation

Replace the contents of your ExileServer\addons\ with the pbo'd files inside this repos ExileServer\addons
Repalce your Exile.Altis pbo, with the pbo'd Exile.Altis folder in this repo
Install marma - marma.io OR if you are against using marma -

Navigate to @ExileServer\addons\JohnOs_events\addons\Events\events_config.sqf

Configure marma logging - True if you use MARMA false if you dont

Change the Persistent_UID to your UID, or if you do not play on your server, a valid UID in the account table (another admin or someone you know, its not important whos it is)

Set your automatic server restarts to 4 hours - THIS IS IMPORTANT

If you are using infiStar, dont embarrass your self and use these settings insde your EXILE_AHAT_CONFIG.hpp

	/* The following 4 options can be disabled by putting the value to -1. For example "TGV = -1;" */
	/* Terrain Grid Value   */ TGV = 3.125;	/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 ~35 is good performance and grass :) */
	/* ViewDistance Value   */ VDV = 1300;
	/* ObjectViewDistance   */ VOV = 1300;
	/* ShadowViewDistance   */ SVD = 100; 

Note: Your servers persistent world will begin at the time defined inside your exile_server_config\config.cpp

You are allowed to use these files un-altered. 

#Changelog

26/08/16

Supply drop vehicles are now persistent and spawn only 2 of each class, if there server already has these vehicles the event will not occur.

You now need to define a valid UID inside @ExileServer\addons\JohnOs_events\addons\Events\events_config.sqf

	Event_SINGLEPLAYER_debug = false; 													// For debugging in single player
	Event_DEBUG_Location = [14482.4,5879.49,0];
	Persistent_UID = "76561197972232595";												// Change me..
	useMarmaLoging = false; 

