params ["_dragger", "_dragged"];

[_dragger] allowGetIn false;

private _timer = derp_missionTime + 5;

_dragged setDir (getDir _dragger + 180);
_dragged setPosASL (getPosASL _dragger vectorAdd (vectorDir _dragger));

_dragger playMove "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon";
_dragged playMove "AinjPfalMstpSnonWrflDnon_carried_Up";

_timer = derp_missionTime + 15;

[{
    params ["_args", "_idPFH"];
    _args params ["_dragger", "_dragged", "_timeOut"];

    if !(_dragger getVariable ["derp_revive_isCarrying", false]) exitWith {
        [_dragger, _dragged, "CARRYING"] call derp_revive_fnc_dropPerson;
        [_idPFH] call derp_fnc_removePerFrameHandler;
    };


    if (!alive _dragged || {_dragger distance _dragged > 10}) then {
        [_dragger, _dragged, "CARRYING"] call derp_revive_fnc_dropPerson;
        [_idPFH] call derp_fnc_removePerFrameHandler;
    };

    if (derp_missionTime > _timeOut) exitWith {
        [_dragger, _dragged] call derp_revive_fnc_startCarrying;
        [_idPFH] call derp_fnc_removePerFrameHandler;
    };
}, 0.2, [_dragger, _dragged, derp_missionTime + 5]] call derp_fnc_addPerFrameHandler;