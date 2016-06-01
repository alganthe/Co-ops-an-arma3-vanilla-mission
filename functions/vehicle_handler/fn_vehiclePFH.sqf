#include "..\..\defines.hpp"
/*
* Author: alganthe
* PFEH handling vehicle respawning / abandon
* DO NOT CALL THIS. This should only be called once on server init.
*
* Arguments:
* Nothing
*''
* Return Value:
* Nothing
*/
[{
    {
        _x params ["_vehicle", "_vehicleClass", "_spawnPos", "_spawnDir", "_timer"];

        _distanceCheckResult = {
            {
                if ((_vehicle distance2D _x) < derp_PARAM_VehicleRespawnDistance || {_vehicle distance2D _spawnPos < 5}) exitWith {false};
                    true;
            } foreach allPlayers;
        };

        if (call _distanceCheckResult) then {
            [{
                params ["_vehicleClass", "_spawnPos", "_spawnDir", "_timer"];
                _newVehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
                _newVehicle setDir _spawnDir;

                derp_vehicleHandler_vehicleHandlingArray pushBack [_newVehicle, _vehicleClass, _spawnPos, _spawnDir, _timer];
                [_newVehicle] call derp_vehicleHandler_fnc_vehicleSetup;

                }, [_vehicleClass, _spawnPos, _spawnDir, _timer], _timer] call derp_fnc_waitAndExecute;
                deleteVehicle _vehicle;
            derp_vehicleHandler_vehicleHandlingArray deleteAt (derp_vehicleHandler_vehicleHandlingArray find _x);
        } else {
            [{
                params ["_oldVehicle", "_vehicleClass", "_spawnPos", "_spawnDir", "_timer"];

                if (!isNull _oldVehicle) then {
                    deleteVehicle _oldVehicle;
                };

                _newVehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
                _newVehicle setDir _spawnDir;

                derp_vehicleHandler_vehicleHandlingArray pushBack [_newVehicle, _vehicleClass, _spawnPos, _spawnDir, _timer];
                [_newVehicle] call derp_vehicleHandler_fnc_vehicleSetup;

                }, [_vehicle, _vehicleClass, _spawnPos, _spawnDir, _timer], _timer] call derp_fnc_waitAndExecute;
            derp_vehicleHandler_vehicleHandlingArray deleteAt (derp_vehicleHandler_vehicleHandlingArray find _x);
        };

    } forEach (derp_vehicleHandler_vehicleHandlingArray select {
        _x params ["_vehicle", "_vehicleClass", "_spawnPos", "_spawnDir", "_timer"];

        _distanceCheckResult = {
            {
                if ((_vehicle distance2D _x) < derp_PARAM_VehicleRespawnDistance || {_vehicle distance2D _spawnPos < 5}) exitWith {false};
                    true;
            } foreach allPlayers;
        };

        if (isNull _vehicle || {!alive _vehicle} || {!(_vehicleClass in VHCrewedVehicles) && {call _distanceCheckResult}}) then {
            true
        };
    });
}, 10, []] call derp_fnc_addPerFrameHandler;
