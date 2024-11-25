#!/bin/bash

# Count the number of tun adapters, e.g. tun0, tun1, etc
TUNTAPS=$(ip -j tuntap list | jq -r '.[].ifname' | grep -c '^tun' )
NORD=$(ip -j a | jq -r '.[].ifname' | grep -c 'nordlynx')

if [[ "$TUNTAPS" != "0" || "$NORD" != "0" ]]; then
    # This filters the JSON output from ip to show "name ip.ip.ip.ip" for each adapter
    MESSAGE_UP=$(\
        ip -4 -j addr show \
        | ip -4 -j addr show | jq '[ .[] | select( .ifname | (startswith("nord") or startswith("tun")) ) | .addr_info[0].local ]' \
        | jq -r 'join(", ")'\
    )
    echo "🔐 %{u#55aa55}${MESSAGE_UP}%{u-}"
else
    echo "🔓️ %{F#FF0000}%{u#FF0000}-%{u-}%{F-}"
fi
