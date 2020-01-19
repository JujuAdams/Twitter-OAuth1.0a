/// Returns whether the API is ready to attempt another query to the Twitter API
/// 
/// @jujuadams 2020-01-19

return ((global.__twitter_state == TWITTER_STATE.ACCESS_TOKEN_RECEIVED) && twitter_has_access_token());