params ["_dragger", "_dragged"];


_dragger playMove "AcinPercMstpSnonWnonDnon";
_dragged playMove "AinjPfalMstpSnonWnonDf_carried_dead";

 _dragged attachTo [_dragger, [0, 0, -1.2], "LeftShoulder"];

_dragged setDir 0;
[{
    params ["_args", "_idPFH"];
    _args params ["_dragger","_dragged", "_startTime"];

    if (!alive _dragged || {!alive _dragger} || {!(isNull objectParent _dragger)} || {_dragger distance _dragged > 10}) then {
        if ((_dragger distance _dragged > 10) && {(derp_missionTime - _startTime) < 1}) exitWith {};
        [_dragger, _dragged, "CARRYING"] call derp_revive_fnc_dropPerson;
        [_idPFH] call derp_fnc_removePerFrameHandler;
    };
} , 0.5, [_dragger, _dragged, derp_missionTime]] call derp_fnc_addPerFrameHandler;