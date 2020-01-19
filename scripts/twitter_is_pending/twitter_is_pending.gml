/// Returns whether the library is currently performing an API endpoint query
/// A result of <false> doesn't necessarily mean the library is ready to make a query, please us twitter_is_ready() for that
/// 
/// @jujuadams 2020-01-19

return ((global.__twitter_state == TWITTER_STATE.OPERATION_PENDING) && twitter_has_access_token());