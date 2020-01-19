/// Generic method to submit requests to Twitter using an access token
/// Check Twitter's API for more information on what endpoints are available:
/// https://developer.twitter.com/en/docs/api-reference-index
/// 
/// @param  method         HTTP method to use, usually POST or GET
/// @param  url            The URL of the API endpoint e.g. https://api.twitter.com/1.1/friends/list.json
/// @param  paramsArray    An array of parameters to be used for the request. See below
/// @param  callback       Script to call once Twitter has responded
/// 
/// The parameter array is made from pairs of strings e.g. [key1, value1, key2, value2]
/// This array gets unpacked and appended to the URL like so:
///    https://api.twitter.com/1.1/endpoint.json?key1=value1&key2=value2
/// Most Twitter API calls require the use of parameters so check the documentation carefully
/// 
/// @jujuadams 2020-01-19

if (!twitter_is_ready())
{
    __twitter_error("Cannot begin operation, library isn't ready");
    return -1;
}

var _method       = argument0;
var _url          = argument1;
var _params_array = argument2;
var _callback     = argument3;

var _result = __twitter_signed_request(_method, _url, _params_array);
if (_result < 0) return _result;

__twitter_message("Making ", _method, " request to ", _url, " using ", _params_array);

global.__twitter_state    = TWITTER_STATE.OPERATION_PENDING;
global.__twitter_callback = _callback;

return _result;