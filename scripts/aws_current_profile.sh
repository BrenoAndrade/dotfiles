#!/bin/zsh

# ---------------------------------------------------------
#  Restore last AWS profile on shell startup
# ---------------------------------------------------------
if [[ -f ~/.aws/current_profile ]]; then
    export AWS_PROFILE="$(cat ~/.aws/current_profile)"
fi

# ---------------------------------------------------------
#  AWS CLI wrapper
#  Captures AWS SSO login profile:
#     aws sso login --profile prod
#     aws sso login --profile=prod
# ---------------------------------------------------------
function aws() {
    # call the real AWS binary
    command aws "$@"

    # Check for SSO login
    if [[ "$1" == "sso" && "$2" == "login" ]]; then
        local profile=""

        # Detect --profile=NAME
        for arg in "$@"; do
            if [[ "$arg" == --profile=* ]]; then
                profile="${arg#--profile=}"
                break
            fi
        done

        # Detect --profile NAME
        if [[ -z "$profile" ]]; then
            for ((i=1; i<=$#; i++)); do
                if [[ ${@[$i]} == "--profile" ]]; then
                    profile="${@[$((i+1))]}"
                    break
                fi
            done
        fi

        # Save + export profile
        if [[ -n "$profile" ]]; then
            echo "$profile" > ~/.aws/current_profile
            export AWS_PROFILE="$profile"
            echo "AWS_PROFILE set to: $profile"
        else
            echo "No profile found in command."
        fi
    fi
}

# ---------------------------------------------------------
#  Ensure Homebrew bin is included (M1/M2/M3 Macs)
# ---------------------------------------------------------
export PATH="$PATH:/opt/homebrew/bin"
