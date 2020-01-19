/// Returns the current operation state of the library, using the TWITTER_STATE enum
/// 
/// @jujuadams 2020-01-19

enum TWITTER_STATE
{
    INITIALISED,
    REQUESTING_PIN_TOKEN,
    PIN_PENDING,
    REQUESTING_TOKEN,
    AUTHENTICATING_USER,
    EXCHANGING_TOKEN,
    ACCESS_TOKEN_RECEIVED,
    OPERATION_PENDING,
}

return global.__twitter_state;