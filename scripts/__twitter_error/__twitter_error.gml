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

show_debug_message(string_format(current_time, 10, 0) + " Twitter: Error! " + _string + "          " + string(debug_get_callstack()));
if (!TWITTER_QUIET_ERRORS) show_error("Twitter:\n" + _string + "\n ", false);

return _string;