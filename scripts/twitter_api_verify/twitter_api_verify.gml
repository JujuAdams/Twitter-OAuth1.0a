/// Verifies the owner of the account associated with the current access token
/// 
/// @param callback    The script to call once Twitter has responded
/// 
/// @jujuadams 2020-01-19

return twitter_request("GET", "https://api.twitter.com/1.1/account/verify_credentials.json", [], argument0);