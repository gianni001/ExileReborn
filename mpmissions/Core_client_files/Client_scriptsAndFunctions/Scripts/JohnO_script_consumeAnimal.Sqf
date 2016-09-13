/**
 * ExileClient_object_item_consume
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_itemClassName","_consumingConfig","_configEffects","_feedbackString","_effectAttributeId","_effectValue","_effectDuration","_effectUnit","_effect","_addPlusCharacter","_bloodAlcohol","_bloodAlcoholComment","_animations","_animationIndex","_stopBleeding","_configSounds","_numberOfConfigSounds","_returnItemClass"];
_itemClassName = _this select 0;

if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming") ) then
{
	_consumingConfig = configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Consuming";
	_configEffects = getArray (_consumingConfig >> "effects");
	_feedbackString = "";
	{
		_effectAttributeId = _x select 0;
		_effectValue = _x select 1;
		_effectDuration = _x select 2;
		_effectUnit = if (_effectAttributeId isEqualTo 4) then {"‰"} else {"%"};
		_effect = 
		[
			_effectAttributeId,
			_effectValue, 
			_effectDuration, 
			time, 
			_effectValue 
		];
		_addPlusCharacter = if (_effectValue > 0) then { "+" } else { "" };
		if( _effectDuration == 0 ) then 
		{
			_feedbackString = _feedbackString + format["%1: %2%3%4<br/>", (ExileClientPlayerEffectNames select _effectAttributeId), _addPlusCharacter, _effectValue, _effectUnit];
		}
		else 
		{
			_feedbackString = _feedbackString + format["%1: %2%3%4/%5s<br/>", (ExileClientPlayerEffectNames select _effectAttributeId), _addPlusCharacter, _effectValue, _effectUnit, _effectDuration];
		};
		if (_effectAttributeId isEqualTo 4) then
		{
			_bloodAlcohol = (ExileClientPlayerAttributes select 4);
			_bloodAlcohol = (_bloodAlcohol + _effectValue) max 0;
			ExileClientPlayerAttributes set [4, _bloodAlcohol];
			if (_bloodAlcohol > 0) then 
			{
				_bloodAlcoholComment = "You feel tipsy.";
				if (_bloodAlcohol >= 3) then
				{
					_bloodAlcoholComment = "You are drunk as a skunk.";
				}
				else 
				{
					if (_bloodAlcohol >= 2) then
					{
						_bloodAlcoholComment = "You are boozed-up.";
					}
					else 
					{
						if (_bloodAlcohol >= 1) then
						{
							_bloodAlcoholComment = "You are drunk.";
						};
					};
				};
				systemChat format["Your blood alcohol level is now %1%2. %3", _bloodAlcohol, "‰", _bloodAlcoholComment];
			};
			if (ExileClientDeliriumThread isEqualTo -1) then
			{
				call ExileClient_object_player_thread_delirium;
				ExileClientDeliriumThread = [20, ExileClient_object_player_thread_delirium, [], true] call ExileClient_system_thread_addtask;
			};
		}
		else 
		{
			ExileClientPlayerEffects pushBack _effect;
		};	
	} 
	foreach _configEffects;
	_animations = getArray (_consumingConfig >> "animations");
	if !(_animations isEqualTo []) then
	{
		if ((vehicle player) isEqualTo player) then 
		{
			_animationIndex = call ExileClient_util_animation_getMatrixIndex;
			player playMove (_animations select _animationIndex);
		};
	};
	_stopBleeding = getNumber (_consumingConfig >> "stopBleeding");
	if (_stopBleeding isEqualTo 1) then
	{
		player setBleedingRemaining 0;
	};
	_configSounds = getArray (_consumingConfig >> "sounds");
	_numberOfConfigSounds = count _configSounds;
	if( _numberOfConfigSounds > 0 ) then
	{
		playSound (_configSounds select (floor (random _numberOfConfigSounds)));
	};
	_returnItemClass = getText (_consumingConfig >> "returnedItem");
	if( _returnItemClass != "" ) then
	{
		player addItem _returnItemClass;
	};
	if( _feedbackString != "") then
	{
		["SuccessTitleAndText", ["Consumed animal meat", _feedbackString]] call ExileClient_gui_toaster_addTemplateToast;
	};
};
true