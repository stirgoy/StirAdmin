/*
    fn_initAdmin.sqf
    Stirgoy
    init hibrido c/s
*/

[] spawn
{
    waitUntil {!(isNil "stir_server")};
    waitUntil {stir_server};
    if (isDedicated) then
    {
        stir_admin = false;
        publicVariable "stir_admin";
        [] call stir_fnc_adminServer;
    }
    else
    {
        [] spawn stir_fnc_adminClient;
    };
};
