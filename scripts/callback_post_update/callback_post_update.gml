/// @param  TwitterString

var _string = argument0;

if (_string != "")
{
    //twitter_api_verify(callback_confirm);
    if (show_question("Would you like to post to Twitter?"))
    {
        twitter_api_update("Only you can hear this message. Only you have been chosen. Only you may join the Thousand, and only you may learn Our inscrutable names. Only you should breathe the air of unity. Only you will fill your cup and drink the Heavens. Only you... Only you...", callback_confirm);
    }
}