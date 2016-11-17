/*
    fn_addA.sqf
    Stirgoy
*/

//   ;)
if (!isDedicated) exitWith {};

private ["_pobj","_adbb","_esc","_auid","_conn","_arrA","_puede","_adb2","_siV2","_arrN","_nuid","_lLog","_nivel","_ePass"];

//parametros de entrada
_pobj = param [0,objNull,[objNull]];
_adbb = param [1,objNull,[objNull]];
_nivel = param [2,-1,[0]];

//condiciones de salida
if (isNull _pobj) exitWith {};
if (isNull _adbb) exitWith {};
if(_nivel == -1) exitWith {};
_auid = getPlayerUID _pobj;
_nuid = getPlayerUID _adbb;

//ini master
_conn = ["new","Master"] call OO_INIDBI;
_arrA = ["read",["Admin","Admins"]] call _conn;

_puede = false;
if (count _arrA == 0) then {_puede = true; _nivel = 3;} else { if (_auid in _arrA) then { _puede = true;};};
if (count _arrA > 0 && _auid == _nuid) exitWith {};     //A si mismo....

//solo admins o 1º
if(!_puede) exitWith {};

_arrN = [name _adbb];
_ePass = ["C","1234"] call stir_fnc_eCode;

//añadimos a master/admins
_arrA pushBack _nuid;
_esc = ["write",["Admin","Admins",_arrA]] call _conn;

//ini admin
_adb2 = ["new","Admin"] call OO_INIDBI;

_siV2 = ["write",[_nuid,"UID",_nuid]] call _adb2;
_siV2 = ["write",[_nuid,"Nivel",_nivel]] call _adb2;
_siV2 = ["write",[_nuid,"Nombres",_arrN]] call _adb2;
_siV2 = ["write",[_nuid,"LI_user",(name _adbb)]] call _adb2;
_siV2 = ["write",[_nuid,"LI_pass",_ePass]] call _adb2;  //"1234"
//_siV2 = ["write",[_nuid,"",0]] call _adb2;

//FALTA NOTIFICAR JUGADOR
//FALTA EXPULSAR AL LOBBY

//log
_lLog = format ["StirAdmin <> Administrador:  %4  UID: %5 <> A añadido como admin a: %1 UID: %2 Nivel: %3",
    (name _adbb),
    _nuid,
    _nivel,
    (name _pobj),
    _auid];

["AdminLog",_lLog,true] call stir_fnc_cLog;
