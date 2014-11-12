private ["_targetveh"];
_targetveh = (_this select 3);
(vehicle player) removeAction suv_close;
suv_close = 0;
if (!(isNull (_targetveh turretUnit [0]))) then {
	titleText ["\n\nThe gunner seat must be unoccupied to close the hatch.","PLAIN DOWN"];
	titleFadeOut 4;
} else {
	_targetveh animate ["HideGun_01", 1];
	sleep 1;
	_targetveh animate ["CloseCover1", 1];
	_targetveh animate ["CloseCover2", 1];
	sleep 1;
	player action ["lightOff",_targetveh];
};
suv_close = -1
