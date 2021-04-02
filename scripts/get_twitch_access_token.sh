#!/bin/bash

function read_resp() {
    echo $2 | jq ".$1"
}

res=../private/twitch


access_token_resp=`curl -s -XPOST -F client_id=9vzpf9ub3g17t44dqyadn321xjfssb -F client_secret=yiw3vsieg9rayquvbzztgpbqhrx3tk -F grant_type=client_credentials -F scope="channel:manage:broadcast channel:read:stream_key clips:edit user:edit user:read:broadcast" https://id.twitch.tv/oauth2/token`
echo $access_token_resp | jq '.' > twitch_credentials.json

