#/bin/bash

# this script is used to show the remaining time of the current AWS session.

# should show if threshold is reached  
min_threshold=$1
max_threshold=$2

remaining_seconds=$("$HOME/.dotfiles/scripts/get_aws_session_expires_in_seconds.sh")

if [ $remaining_seconds -gt 0 ]; then
    if [ $remaining_seconds -lt $min_threshold ]; then
        exit 1
    fi

    if [ -n $max_threshold ] && [ $remaining_seconds -gt $max_threshold ]; then
        exit 1
    fi

elif [ $min_threshold -eq 0 ]; then
    echo "[EXPIRED]"
    exit 0
else
    exit 1
fi

# show the remaining time

hours=$((remaining_seconds / 3600))
minutes=$((remaining_seconds % 3600 / 60))
seconds=$((remaining_seconds % 60))    

if [ $hours -eq 0 ]; then
    if [ $minutes -eq 0 ]; then
        echo "${seconds}s"
        exit 0
    fi

    echo "${minutes}m${seconds}s"
    exit 0
fi

# echo "[AWS Session Expires in: $hours hours $minutes minutes $seconds seconds]"
echo "${hours}h${minutes}m${seconds}s"
exit 0