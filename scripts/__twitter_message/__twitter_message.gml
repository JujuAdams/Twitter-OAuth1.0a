/// @param value
/// @param [value...]
/// 
/// @jujuadams 2020-01-18

var _string = "";
var _i = 0;
repeat(argument_count)
{
    _string += string(argument[_i]);
    ++_i;
}

show_debug_message(string_format(current_time, 10, 0) + " Twitter: " + _string);

return _string;