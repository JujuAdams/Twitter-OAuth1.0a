if (global.__twitter_state != TWITTER_STATE.REQUESTING_PIN_TOKEN)
{
    __twitter_error("Cannot authenticate user at this time");
    exit;
}

__twitter_message("Opening authorisation page (PIN flow)");

url_open("https://api.twitter.com/oauth/authenticate?oauth_token=" + global.__twitter_token);

global.__twitter_state = TWITTER_STATE.PIN_PENDING;