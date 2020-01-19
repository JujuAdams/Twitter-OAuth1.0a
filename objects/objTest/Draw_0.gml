//Draw the current status of the library to the screen
if (twitter_has_access_token())
{
    if (twitter_is_ready())
    {
        draw_text(10, 10, "Access token received, ready to make requests");
    }
    else if (twitter_is_pending())
    {
        draw_text(10, 10, "Operation pending");
    }
}
else switch(twitter_get_state())
{
    case TWITTER_STATE.INITIALISED:
        draw_text(10, 10, "Press <1> to begin authorisation using \"PIN\" flow");
        draw_text(10, 30, "Press <2> to begin authorisation using \"3-leg\" flow");
    break;
    
    default:
        draw_text(10, 10, "Waiting for response from Twitter");
    break;
}