private ["_targetveh"];
_targetveh = (_this select 3);
(vehicle player) removeAction mv22_close;
mv22_close = 0;
_targetveh animate ["ramp_top",0];
_targetveh animate ["ramp_bottom",0];
sleep 1;
mv22_close = -1;
