/// @description scr_juju_nonce( [length] )
/// @param  [length] 

if (argument_count < 1) var length = 32 else length = argument[0];

//This is *not* crypto-quality RNG but it'll do for now.
randomize();
var nonce = "";
repeat( length ) nonce += choose("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");

return nonce;