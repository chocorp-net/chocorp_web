#!/bin/bash

data=`cat twitch_credentials.json`
token=`echo $data | jq '.access_token' | cut -d\" -f2`
echo $token
client_id=9vzpf9ub3g17t44dqyadn321xjfssb
client_secret=yiw3vsieg9rayquvbzztgpbqhrx3tk
curl -s -H "Authorization: Bearer $token" -XPOST -F grant_type=refresh_token -F refresh_token=$token -F client_id=$client_id -F client_secret=$client_secret https://id.twitch.tv/oauth2/token > credentials.json

