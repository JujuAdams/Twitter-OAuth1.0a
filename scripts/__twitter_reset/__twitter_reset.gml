/// @param executeCallback

var _execute_callback = argument0;

if (_execute_callback) __twitter_callback_failed();

__twitter_server_destroy();

global.__twitter_state                 = TWITTER_STATE.INITIALISED;
global.__twitter_callback              = -1;
global.__twitter_token                 = "";
global.__twitter_token_secret          = "";
global.__twitter_access_token_received = false;
global.__twitter_expires               = -1;