/// Completes the "PIN" authorisation flow by submitting a user-inputted PIN to Twitter for confirmation
/// 
/// @param PINstring    The PIN that the user has inputted, copied from Twitter's authorisation web page
/// @param callback     The script to call once authorisation has been granted or denied

var _pin      = argument0;
var _callback = argument1;

if (global.__twitter_state != TWITTER_STATE.PIN_PENDING)
{
    __twitter_error("Cannot finish PIN-based authorisation at this time");
    return -1;
}

var _result = __twitter_signed_request("POST", "https://api.twitter.com/oauth/access_token", ["oauth_token", global.__twitter_token, "oauth_verifier", _pin]);
if (_result < 0) return _result;

__twitter_message("Submitting PIN ", _pin);

global.__twitter_state    = TWITTER_STATE.EXCHANGING_TOKEN;
global.__twitter_callback = _callback;

return _result;
