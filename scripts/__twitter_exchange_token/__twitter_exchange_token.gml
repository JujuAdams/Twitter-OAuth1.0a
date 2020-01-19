if (global.__twitter_state != TWITTER_STATE.AUTHENTICATING_USER)
{
    __twitter_error("Cannot exchange token at this time");
    return -1;
}

var _result = __twitter_signed_request("POST", "https://api.twitter.com/oauth/access_token", ["oauth_token", global.__twitter_token, "oauth_verifier", global.__twitter_verifier]);
if (_result < 0) return _result;

__twitter_message("Exchanging tokens");

global.__twitter_state = TWITTER_STATE.EXCHANGING_TOKEN;

return _result;
