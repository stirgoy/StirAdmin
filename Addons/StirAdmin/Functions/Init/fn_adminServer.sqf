/*
    fn_adminServer.sqf
    Stirgoy
*/

if (!isDedicated) exitWith {};

private ["_adb","_siV","_adb2","_siV2"];

//master ini
_adb = ["new","Master"] call OO_INIDBI;
_siV = ["read",["Admin","Version"]] call _adb;

if ( typeName _siV == "BOOL" ) then
{
    _siV = ["write",["Admin","Version",0.1]] call _adb;
    _siV = ["write",["Admin","Admins",[]]] call _adb;
};


//admin ini
_adb2 = ["new","Admin"] call OO_INIDBI;
_siV2 = ["read",["Ajustes","Version"]] call _adb2;

if ( typeName _siV2 == "BOOL" ) then
{
    _siV2 = ["write",["Ajustes","Version",0.1]] call _adb2;
};

//cargado
stir_admin = true;
publicVariable "stir_admin";
