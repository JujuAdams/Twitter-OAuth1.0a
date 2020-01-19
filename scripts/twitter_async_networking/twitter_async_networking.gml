/// Place this script in the Async Networking event of a persistent instance
/// 
/// @jujuadams 2020-01-19

switch(async_load[? "type"])
{
    case network_type_connect:
        global.__twitter_out_socket = async_load[? "socket"];
        __twitter_message("New connection on socket ", global.__twitter_out_socket);
    break;
    
    case network_type_data:
        var _buffer = async_load[? "buffer"];
        if (_buffer != undefined)
        {
            var _string = buffer_read(_buffer, buffer_string);
            
            var _token = __twitter_extract_param(_string, "oauth_token");
            if (_token != global.__twitter_token)
            {
                __twitter_message("Warning! Networking response received with the wrong token");
            }
            else
            {
                global.__twitter_verifier = __twitter_extract_param(_string, "oauth_verifier");
                if (global.__twitter_verifier != "")
                {
                    __twitter_message("Received verifier token");
                    __twitter_exchange_token();
                }
                else
                {
                    __twitter_error("Couldn't find OAuth verifier in networking response");
                    __twitter_callback_failed();
                }
                
                if (global.__twitter_localhost_server >= 0)
                {
                    __twitter_message("Sending raw HTTP response");
                    
                    var _string = "HTTP/1.1 301 Moved Permanently\nLocation: " + global.__twitter_redirect_url + "\n\n";
                    
                    var _out_buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
                    buffer_write(_out_buffer, buffer_string, _string);
                    
                    network_send_raw(global.__twitter_out_socket, _out_buffer, buffer_get_size(_out_buffer));
                    buffer_delete(_out_buffer);
                }
                
                __twitter_server_destroy();
            }
        }
    break;
}