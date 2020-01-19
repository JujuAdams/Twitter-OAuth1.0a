/// Place this script in the Step event of a persistent instance
/// 
/// @jujuadams 2020-01-19

switch(global.__twitter_state)
{
    case TWITTER_STATE.REQUESTING_PIN_TOKEN:
    case TWITTER_STATE.PIN_PENDING:
    case TWITTER_STATE.REQUESTING_TOKEN:
    case TWITTER_STATE.AUTHENTICATING_USER:
    case TWITTER_STATE.EXCHANGING_TOKEN:
        if (current_time > global.__twitter_expires)
        {
            __twitter_error("Authorisation flow expired");
            __twitter_reset(true);
        }
    break;
}