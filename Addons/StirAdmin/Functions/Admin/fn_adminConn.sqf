/*
    fn_adminConn.sqf
    Stirgoy
    query al conectar
*/

if (!isDedicated) exitWith {};

private ["_arrAd","_iAd","_iRet","_uidd","_objp"];

_objp = param [0,objNull,[objNull]];
if (isNull _objp) exitWith {};

_uidd = getPlayerUID _objp;

_iAd = ["new","Admin"] call OO_INIDBI;
_iRet = ["read",[_uidd,"Nivel"]] call _iAd;

if (typeName _iRet == "BOOL") then {_iRet = 0;};

_objp setVariable ["stir_admin_nvl", _iRet,true];
_objp setVariable ["stir_query", true,true];
