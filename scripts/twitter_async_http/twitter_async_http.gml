/// Place this script in the Async HTTP event of a persistent instance
/// 
/// @jujuadams 2020-01-19

var _http_status = async_load[? "http_status"];
var _status      = async_load[? "status"     ];
var _result      = async_load[? "result"     ];

if (_status == 0)
{
    if (_http_status == 200)
    {
        switch(global.__twitter_state)
        {
            case TWITTER_STATE.REQUESTING_PIN_TOKEN:
                if (string_pos("oauth_callback_confirmed=true", _result) <= 0)
                {
                    __twitter_error("Token request failed, callback not confirmed");
                    __twitter_callback_failed();
                }
                else
                {
                    global.__twitter_token        = __twitter_extract_param(_result, "oauth_token"       );
                    global.__twitter_token_secret = __twitter_extract_param(_result, "oauth_token_secret");
                    
                    if ((global.__twitter_token != "") && (global.__twitter_token_secret != ""))
                    {
                        __twitter_message("Token request successful (PIN flow)");
                        __twitter_show_pin();
                        __twitter_callback_success(_result);
                    }
                    else
                    {
                        __twitter_error("Failed to decode token/secret from response (PIN flow)");
                        __twitter_callback_failed();
                    }
                }
            break;
            
            case TWITTER_STATE.REQUESTING_TOKEN:
                if (string_pos("oauth_callback_confirmed=true", _result) <= 0)
                {
                    __twitter_error("Token request failed, callback not confirmed");
                    __twitter_callback_failed();
                }
                else
                {
                    global.__twitter_token        = __twitter_extract_param(_result, "oauth_token"       );
                    global.__twitter_token_secret = __twitter_extract_param(_result, "oauth_token_secret");
                    
                    if ((global.__twitter_token != "") && (global.__twitter_token_secret != ""))
                    {
                        __twitter_message("Token request successful (3-leg flow)");
                        __twitter_authenticate_user();
                    }
                    else
                    {
                        __twitter_error("Failed to decode token/secret from response (3-leg flow)");
                        __twitter_callback_failed();
                    }
                }
            break;
            
            case TWITTER_STATE.EXCHANGING_TOKEN:
                global.__twitter_token        = __twitter_extract_param(_result, "oauth_token"       );
                global.__twitter_token_secret = __twitter_extract_param(_result, "oauth_token_secret");
                
                if ((global.__twitter_token != "") && (global.__twitter_token_secret != ""))
                {
                    __twitter_message("Token exchange successful");
                    __twitter_message("Ready for requests!");
                    
                    global.__twitter_state = TWITTER_STATE.ACCESS_TOKEN_RECEIVED;
                    global.__twitter_access_token_received = true;
                    
                    __twitter_callback_success(_result);
                }
                else
                {
                    __twitter_error("Failed to decode token/secret from response");
                    __twitter_callback_failed();
                }
            break;
            
            case TWITTER_STATE.OPERATION_PENDING:
                __twitter_callback_success(_result);
            break;
            
            default:
                __twitter_message("Warning! Unexpected async HTTP event received");
            break;
        }
    }
    else
    {
        __twitter_message(_result);
        __twitter_error("HTTP " + string(_http_status) + " received. Check output log for more details");
        
        __twitter_server_destroy();
        
        global.__twitter_state = TWITTER_STATE.INITIALISED;
        __twitter_callback_failed();
    }
}