/// Initialises the Twitter library
/// You can find consumerKey and consumerSecret via the Apps page on Twitter's backend:
/// https://developer.twitter.com/en/apps/
/// 
/// @param  consumerKey     Provided by Twitter
/// @param  consumerSecret  Provided by Twitter
/// 
/// @jujuadams 2020-01-19

show_debug_message("Welcome to the Twitter library by @jujuadams! v" + __TWITTER_VERSION + " " + __TWITTER_DATE);

if (!code_is_compiled() && !TWITTER_IGNORE_YYC_WARNING)
{
    __twitter_error("It's very easy to extract strings from GameMaker VM builds.\nPlease use YYC to build games for public release.");
}

var _consumer_key    = argument0;
var _consumer_secret = argument1;

global.__twitter_consumer_key    = _consumer_key;
global.__twitter_consumer_secret = _consumer_secret;

global.__twitter_token                 = "";
global.__twitter_token_secret          = "";
global.__twitter_state                 = TWITTER_STATE.INITIALISED;
global.__twitter_localhost_server      = -1;
global.__twitter_access_token_received = false;

#macro __TWITTER_VERSION  "1.0.0"
#macro __TWITTER_DATE     "2020/01/19"