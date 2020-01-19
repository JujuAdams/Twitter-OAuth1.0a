if (keyboard_check_pressed(ord("1")))
{
    //Start the "PIN" authorisation flow, see: https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/pin-based-oauth
    //We call callback_pin_prompt() once we're ready to ask the user to input the PIN
    twitter_start_pin_auth(callback_pin_prompt);
}

if (keyboard_check_pressed(ord("2")))
{
    //Start the "3-leg" authorisation flow, see: https://developer.twitter.com/en/docs/basics/authentication/oauth-1-0a/obtaining-user-access-tokens
    //We call callback_post_update() once we're authorised
    twitter_start_3_leg_auth("http://www.jujuadams.com", callback_post_update);
}

//Run some update logic. This keeps access tokens active etc.s
twitter_step();