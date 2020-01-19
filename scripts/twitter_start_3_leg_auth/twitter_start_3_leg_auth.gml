/// Starts the "3-leg" authorisation flow for Twitter
/// See: https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/obtaining-user-access-tokens
/// 
/// This method requires a server to be opened on the local machine using the port defined by TWITTER_LOCALHOST_PORT
/// As a result, it may fail in situations where an aggressive firewall is in place
/// A web page is also opened to authenticate the user with Twitter
/// 
/// @param redirectURL  Web page to redirect the browser to
/// @param callback     The script to call once authorisation has been granted or denied
/// 
/// @jujuadams 2020-01-19

if (global.__twitter_state != TWITTER_STATE.INITIALISED)
{
    __twitter_error("Cannot begin 3-leg authorisation at this time");
    return -1;
}

var _redirect_url = argument0;
var _callback     = argument1;

if (!__twitter_server_create()) return -2;

var _result = __twitter_signed_request("POST", "https://api.twitter.com/oauth/request_token", ["oauth_callback", "http://localhost:" + string(TWITTER_LOCALHOST_PORT) + "/"]);
if (_result < 0) return _result;

__twitter_message("Requesting token (3-leg flow)");

global.__twitter_redirect_url = _redirect_url;
global.__twitter_callback     = _callback;
global.__twitter_state        = TWITTER_STATE.REQUESTING_TOKEN;

global.__twitter_expires = current_time + TWITTER_LOCALHOST_TIMEOUT;

return _result;