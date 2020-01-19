/// Post a new tweet (a "status update") on behalf of the user
/// 
/// @param string      Text to use for the tweet
/// @param callback    Script to call once Twitter has responded
/// 
/// @jujuadams 2020-01-19

return twitter_request("POST", "https://api.twitter.com/1.1/statuses/update.json", ["status", argument0], argument1);