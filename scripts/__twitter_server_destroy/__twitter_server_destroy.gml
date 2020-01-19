/// @jujuadams 2020-01-19

if (global.__twitter_localhost_server >= 0)
{
    __twitter_message("Shutting server ", global.__twitter_localhost_server);
    network_destroy(global.__twitter_localhost_server);
    global.__twitter_localhost_server = -1;
}