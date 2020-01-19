/// Starts the "PIN" authorisation flow for Twitter
/// See: https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/pin-based-oauth
/// 
/// This method requires that the user inputs a PIN from a web page into the application
/// It's inelegant but more robust than the "3-leg" flow
/// 
/// @param callback   The script to call once the Twitter authorisation page has been opened
/// 
/// @jujuadams 2020-01-19

if (global.__twitter_state != TWITTER_STATE.INITIALISED)
{
    __twitter_error("Cannot begin PIN authorisation at this time");
    return -1;
}

var _callback = argument0;

var _result = __twitter_signed_request("POST", "https://api.twitter.com/oauth/request_token", ["oauth_callback", "oob"]);
if (_result < 0) return _result;

__twitter_message("Requesting token (PIN flow)");

global.__twitter_callback = _callback;
global.__twitter_state    = TWITTER_STATE.REQUESTING_PIN_TOKEN;

global.__twitter_expires = current_time + TWITTER_PIN_TIMEOUT;

return _result;
