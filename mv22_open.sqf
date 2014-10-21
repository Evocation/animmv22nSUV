private ["_targetveh"];
_targetveh = (_this select 3);
(vehicle player) removeAction mv22_open;
mv22_open = 0;
_targetveh animate ["ramp_top",1];
_targetveh animate ["ramp_bottom",1];
mv22_open = -1;
