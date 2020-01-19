/// @param  method
/// @param  url
/// @param  paramsArray

var _method       = string_upper(argument0);
var _url          = argument1;
var _params_array = argument2;

var _header_map = ds_map_create();
_header_map[? "oauth_consumer_key"    ] = global.__twitter_consumer_key;
_header_map[? "oauth_nonce"           ] = __twitter_nonce();
_header_map[? "oauth_signature_method"] = "HMAC-SHA1";
_header_map[? "oauth_timestamp"       ] = string(__twitter_unix_time());
_header_map[? "oauth_token"           ] = global.__twitter_token;
_header_map[? "oauth_version"         ] = "1.0";

var _url_full = _url;
var _param_count = array_length_1d(_params_array) div 2;
if (_param_count > 0)
{
    _url_full += "?";
    
    var _i = 0;
    repeat(_param_count)
    {
        var _key   = _params_array[2*_i  ];
        var _value = _params_array[2*_i+1];
        
        _url_full += _key + "=";
        _url_full += __twitter_percent_encode(_value);
        
        if (_i < _param_count-1) _url_full += "&";
        
        if (!ds_map_exists(_header_map, _key)) _header_map[? _key] = _value;
        
        ++_i;
    }
}

var _signature = __twitter_hex_string_base64(__twitter_signature(_method, _url, __twitter_map_to_param_string(_header_map), global.__twitter_consumer_secret, global.__twitter_token_secret));
_header_map[? "oauth_signature"] = _signature;

var _i = 0;
repeat(_param_count)
{
    //ds_map_delete(_header_map, _params_array[2*_i]);
    ++_i;
}

var _header_string = __twitter_map_to_header_string(_header_map);

ds_map_clear(_header_map);
_header_map[? "Authorization"] = "OAuth " + _header_string;
var _result = http_request(_url_full, _method, _header_map, "");
ds_map_destroy(_header_map);

return _result;
