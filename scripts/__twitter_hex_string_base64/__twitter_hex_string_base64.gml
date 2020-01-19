/// @param  hex string 

var hexRef = "0123456789abcdef";

var str = argument0;

var size = string_length( str );
if ( ( size / 2 ) != floor( size / 2 ) ) str = "0" + str;

var buf = buffer_create( ceil( size / 2 ), buffer_u8, 1 );

for( var n = 1; n <= size; n += 2 ) buffer_write( buf, buffer_u8,
        string_pos( string_char_at( str, n+1 ), hexRef )
    + ( string_pos( string_char_at( str, n   ), hexRef ) * 16 ) - 17 );
    
var result = buffer_base64_encode( buf, 0, buffer_tell( buf ) );

buffer_delete( buf );

return result;
