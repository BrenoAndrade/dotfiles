#/bin/bash

# should show if threshold is reached  
min_threshold_seconds=$1
max_threshold_seconds=$2

# this script is used to show the remaining time of the current AWS session.

remaining_seconds=$(~/.dotfiles/scripts/get_aws_session_expires_in_seconds.sh)

if [ $remaining_seconds -lt $min_threshold_seconds ]; then
    exit 1
fi

if [ $remaining_seconds -gt $max_threshold_seconds ]; then
    exit 1
fi

hours=$((remaining_seconds / 3600))
minutes=$((remaining_seconds % 3600))
seconds=$((remaining_seconds % 60))    

if [ $remaining_seconds -lt 0 ]; then
    echo " [EXPIRED]"

elif [ $hours -gt 0 ]; then
    echo "[${hours}h]"

elif [ $minutes -gt 0 ]; then
    echo " [${minutes}m]"

else
    echo " [${seconds}s]"
fi
