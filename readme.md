#Installation

Replace the contents of your ExileServer\addons\ with the pbo'd files inside this repos ExileServer\addons
Repalce your Exile.Altis pbo, with the pbo'd Exile.Altis folder in this repo
Install marma - marma.io

Navigate to @ExileServer\addons\JohnOs_events\addons\Events\Persistent_vehicles

Open the spawn_vehicles.sqf
On line 22, change the UID to your UID -- This needs to be a valid UID that exists in the account table of your data base. If you are using a fresh database, fire the server up, join the server and this will create an account entry. Then use the UID from there.

If you are using infiStar, dont embarrass your self and use these settings insde your EXILE_AHAT_CONFIG.hpp

	/* The following 4 options can be disabled by putting the value to -1. For example "TGV = -1;" */
	/* Terrain Grid Value   */ TGV = 3.125;	/* 50, 25, 12.5  */	/* if set to 50 grass will be very low for better client FPS.. default is 25 ~35 is good performance and grass :) */
	/* ViewDistance Value   */ VDV = 1300;
	/* ObjectViewDistance   */ VOV = 1300;
	/* ShadowViewDistance   */ SVD = 100; 

Note: Your servers persistent world will begin at the time defined inside your exile_server_config\config.cpp

You are allowed to use these files un-altered. 

