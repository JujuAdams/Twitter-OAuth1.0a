/// @jujuadams 2020-01-19

if (global.__twitter_localhost_server < 0)
{
    global.__twitter_localhost_server = network_create_server_raw(network_socket_tcp, TWITTER_LOCALHOST_PORT, 10);
}

if (global.__twitter_localhost_server < 0)
{
    __twitter_error("Failed to create raw TCP server on port ", TWITTER_LOCALHOST_PORT);
    return false;
}

__twitter_message("Opened server ", global.__twitter_localhost_server, " on port ", TWITTER_LOCALHOST_PORT);
return true;