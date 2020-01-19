var _string = get_string("Please enter your PIN", "0123456");

if (_string == "")
{
    twitter_submit_pin(_string, callback_post_update);
}