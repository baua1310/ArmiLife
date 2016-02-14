private["_handled", "_key", "_shift","_downKeys"];

_downKeys = [2,3,4,15];
_key     = _this select 1;
_handled = true;

if(adminCamOpen) exitWith {
	switch (_key) do {
		case 17: { remoteStaffCam_fov=remoteStaffCam_fov-0.2; remoteStaffCam camSetFov remoteStaffCam_fov; remoteStaffCam camCommit 0; };
		case 29: { remoteStaffCam_y=remoteStaffCam_y-0.2; remoteStaffCam camSetPos [remoteStaffCam_x,remoteStaffCam_z,remoteStaffCam_y]; remoteStaffCam camCommit 0; };
		case 31: { remoteStaffCam_fov=remoteStaffCam_fov+0.2; remoteStaffCam camSetFov remoteStaffCam_fov; remoteStaffCam camCommit 0; };
		case 42: { remoteStaffCam_y=remoteStaffCam_y+0.2; remoteStaffCam camSetPos [remoteStaffCam_x,remoteStaffCam_z,remoteStaffCam_y]; remoteStaffCam camCommit 0; };
		case 49: { remoteStaffCam_nvg=!remoteStaffCam_nvg; camUseNVG remoteStaffCam_nvg; };
		case 57: { adminCamOpen=false; };
	};
};

if(!(_key in _downKeys)) then {
	_shift   = _this select 2; 
	switch (_key) do {
		default { _handled = false; };
	};
};

_handled