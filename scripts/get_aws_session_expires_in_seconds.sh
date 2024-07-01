#/bin/bash

# this script will return the time remaining until the current AWS SSO session expires.

expires=$(ls -t ~/.aws/sso/cache/*.json | head -n 1 | xargs cat | jq -r .expiresAt | sed -e 's/T/ /' -e 's/Z//') 
current_time=$(date -u "+%Y-%m-%d %H:%M:%S")
expires_epoch=$(date -j -f "%Y-%m-%d %H:%M:%S" "$expires" "+%s")
current_epoch=$(date -j -u -f "%Y-%m-%d %H:%M:%S" "$current_time" "+%s")
remaining_seconds=$((expires_epoch - current_epoch))

echo $remaining_seconds
