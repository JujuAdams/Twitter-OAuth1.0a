/// @description scr_juju_oauth1_map_to_http_header_string( map )
/// @param  map

var str = "";
var map = argument0;

var size = ds_map_size( map );
if ( size <= 0 ) return str;

var list = ds_list_create();
var last = ds_map_find_last( map );



var key = ds_map_find_first( map );
ds_list_add( list, string( key ) );

while( key != last ) {
    var key = ds_map_find_next( map, key );
    ds_list_add( list, __twitter_percent_encode( key ) );
}

ds_list_sort( list, true );



for( var i = 0; i < size; i++ ) {
    key = ds_list_find_value( list, i );
    str += key + "=\"" + __twitter_percent_encode( ds_map_find_value( map, key ) ) + "\"";
    if ( i < size - 1 ) str += ",";
}



ds_list_destroy( list );

return str;
