private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);                    

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['JohnO_events_initialize','JohnOs_events\addons\Events\events_config.sqf']
];

call JohnO_events_initialize;
diag_log "Initializing JohnOs_events...";
true