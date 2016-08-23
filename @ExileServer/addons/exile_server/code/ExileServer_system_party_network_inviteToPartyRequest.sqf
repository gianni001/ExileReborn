/**
 * ExileServer_system_party_network_inviteToPartyRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_playerToInvite","_partyLeader"];
_sessionID = _this select 0;
_parameters = _this select 1;
_playerToInvite = objectFromNetId (_parameters select 0);
_partyLeader = _sessionID call ExileServer_system_session_getPlayerObject;
format ["%1 (%2) has invited %3 (%4) to his party.", name _partyLeader, netId _partyLeader, name _playerToInvite, _parameters select 0] call ExileServer_util_log;
[_playerToInvite, "inviteToPartyRequest", [netId _partyLeader]] call ExileServer_system_network_send_to;
true