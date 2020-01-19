/// @param  TwitterString

var _string = argument0;

if (_string != "")
{
    //twitter_api_verify(callback_confirm);
    if (show_question("Would you like to post to Twitter?"))
    {
        twitter_api_update("I'm making this post from inside a #GameMaker game running in Windows using pure native GML. Think of the possibilities! The code is free and open source forever: https://github.com/JujuAdams/Twitter-OAuth1.0a", callback_confirm);
    }
}