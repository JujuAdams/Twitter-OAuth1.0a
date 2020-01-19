/// @param  method
/// @param  url
/// @param  parameterString
/// @param  consumerSecret
/// @param  tokenSecret

var str = string_upper(argument0) + "&" + __twitter_percent_encode(argument1) + "&" + __twitter_percent_encode(argument2);
var key = __twitter_percent_encode(argument3) + "&" + __twitter_percent_encode(argument4);
return __twitter_hmac_sha1(key, str);
