/*
    fn_adminClient.sqf
    Stirgoy
    establece el nivel de admin all entrar a mision
*/

if (isDedicated) exitWith {};

waitUntil {stir_admin};

player setVariable ["stir_query",false,true];
[player] remoteExec ["stir_fnc_adminConn", 2];  //no script
waitUntil {player getVariable "stir_query"};

player setVariable ["stir_query", nil,true];

private ["_stradmllvll"];
_stradmllvll = player getVariable "stir_admin_nvl";
player setVariable ["stir_admin_nvl", nil,true];

//Mantenemos el nivel '"estatico"'
_stradmllvll = format ["{%1}",_stradmllvll];
stir_nivel_admin = call compileFinal _stradmllvll;
