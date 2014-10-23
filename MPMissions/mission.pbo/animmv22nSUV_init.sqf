private ["_curveh","_inVehicle"];
while {sleep 1;true} do {
	_curveh = vehicle player;
	_inVehicle = _curveh != player;
	{
		//diag_log("[CURSORTARGET] ENTINIES SHIT " + str(count((getPos vehicle _x) nearEntities ["CAManBase",15])));
		if (((_x animationPhase "turn_wing") == 0) && ((count((getPos vehicle _x) nearEntities ["CAManBase",15])) == 0) && ((count (crew _x)) == 0) && (!isEngineOn _x) && (_x != _curveh)) then {
			_x animate ["ramp_top",0];
			_x animate ["ramp_bottom",0];
			[_x,1] execVM "\ca\air2\mv22\scripts\pack.sqf";
			sleep 1;
			player action ["lightOff",_x];
		};
		if (_inVehicle && (_curveh == _x)) then {
			private ["_obj_mv22"];
			_obj_mv22 = _curveh;
			if ((_obj_mv22 animationPhase "turn_wing") == 1) then {
				[_obj_mv22,0] execVM "\ca\air2\mv22\scripts\pack.sqf";
			};
			if (isEngineOn _curveh) then {
				_curveh animate ["ramp_top",0];
				_curveh animate ["ramp_bottom",0];
				player action ["lightOn",_curveh];
			} else {
				if ((_obj_mv22 animationPhase "ramp_top") == 0) then {
					if (mv22_open < 0) then {
						in_mv22_op = _obj_mv22;
						mv22_open = in_mv22_op addAction [("<t color=""#00FF00"">" + ("Open Ramp") + "</t>"),"addons\animmv22nSUV\mv22_open.sqf",_obj_mv22,-10,false,true,"",""];
					};
				} else {
					in_mv22_op removeAction mv22_open;
					mv22_open = -1;
				};
				if ((_obj_mv22 animationPhase "ramp_top") == 1) then {
					if (mv22_close < 0) then {
						in_mv22_cl = _obj_mv22;
						mv22_close = in_mv22_cl addAction [("<t color=""#00FF00"">" + ("Close Ramp") + "</t>"),"addons\animmv22nSUV\mv22_close.sqf",_obj_mv22,-10,false,true,"",""];
					};
				} else {
					in_mv22_cl removeAction mv22_close;
					mv22_close = -1;
				};
			};
		} else {
			in_mv22_op removeAction mv22_open;
			mv22_open = -1;
			in_mv22_cl removeAction mv22_close;
			mv22_close = -1;
		};

	} count ((position player) nearObjects ["MV22_DZ",100]);
	{
		if (((_x animationPhase "HideGun_01") == 0) && ((count (crew _x)) == 0) && (!isEngineOn _x) && (_x != _curveh)) then {
				_x animate ["HideGun_01",1];
				sleep 1;
				_x animate ["CloseCover1",1];
				_x animate ["CloseCover2",1];
				sleep 1;
				_x action ["lightOff",_x];
		};
		if _inVehicle then {
			if (_curveh == _x) then {
				private ["_obj_suv"];
				_obj_suv = _curveh;
				if ((!(isNull (_obj_suv turretUnit [0]))) && ((_obj_suv animationPhase "HideGun_01") == 1)) then {
					player action ["moveToCargo",_obj_suv,2];
					titleText ["\n\nYou must open the hatch first.","PLAIN DOWN"];
					titleFadeOut 4;
				};
				if ((_obj_suv animationPhase "HideGun_01") == 1) then {
					if (suv_open < 0) then {
						in_suv_op = _obj_suv;
						suv_open = in_suv_op addAction [("<t color=""#00FF00"">" + ("Open Hatch") + "</t>"),"addons\animmv22nSUV\suv_open.sqf",_obj_suv,-10,false,true,"",""];
					};
				} else { 
					in_suv_op removeAction suv_open;
					suv_open = -1;
				};
				if ((_obj_suv animationPhase "HideGun_01") == 0) then {
					if (suv_close < 0) then {
						in_suv_cl = _obj_suv;
						suv_close = in_suv_cl addAction [("<t color=""#00FF00"">" + ("Close Hatch") + "</t>"),"addons\animmv22nSUV\suv_close.sqf",_obj_suv,-10,false,true,"",""];
					};
				} else {
					in_suv_cl removeAction suv_close;
					suv_close = -1;
				};
			};
		} else {
			in_suv_op removeAction suv_open;
			suv_open = -1;
			in_suv_cl removeAction suv_close;
			suv_close = -1;
		};
	} count ((position player) nearObjects ["ArmoredSUV_Base_PMC",100]);
};
