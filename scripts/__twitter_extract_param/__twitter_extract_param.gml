/// @param string
/// @param parameterName

var _string = argument0 + "&";
var _param  = argument1 + "=";

var _pos = string_pos(_param, _string);
if (_pos <= 0) return "";

_string = string_delete(_string, 1, _pos + string_length(_param) - 1);
var _ampersand_pos = string_pos("&", _string);
var _space_pos = string_pos(" ", _string);

if (_ampersand_pos <= 0)
{
    _pos = _space_pos;
}
else if (_space_pos <= 0)
{
    _pos = _ampersand_pos;
}
else
{
    _pos = min(_ampersand_pos, _space_pos);
}

if (_pos <= 0) return "";

return string_copy(_string, 1, _pos-1);