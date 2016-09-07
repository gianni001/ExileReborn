if (ExileClientXM8CurrentSlide == "ExAd_AttachChem") then
{
	ExileClientXM8CurrentSlide = "extraApps";
};	

/** Create the go back button because.. **/

_pW = 0.025;
_pH = 0.04;
_leftCol = 0;
_leftColW = 12.8;
_rightCol = _leftCol + _leftColW + 2;
_rightColW = _leftColW + 3;
_margin = 0.2;

params["_display","_slide","_idc"];
_slideClass = "ExAd_AttachChem";
[_display,_slide,([_slideClass,"btnBack"] call ExAd_fnc_getNextIDC),[27 * _pW, 17 * _pH, 6 * _pW, 1 * _pH],'["extraApps", 1] call ExileClient_gui_xm8_slide;',"Go Back"] call ExAd_fnc_createButton;