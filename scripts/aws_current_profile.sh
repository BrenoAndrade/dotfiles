#/bin/bash

# this script is used to store the current AWS profile in a file and load it when the aws command is executed.

if AWS_BIN=$(which aws); then
    # load the current profile from the file
    if [[ -f ~/.aws/current_profile ]]; then
        export AWS_PROFILE=$(cat ~/.aws/current_profile)
    fi

    function aws() {
        $AWS_BIN $@

        if [[ $1 == "sso" && $2 == "login" ]]; then
            profile=$(echo $@ | awk '{for(i=1;i<=NF;i++) if($i == "--profile") print $(i+1)}')

            echo $profile > ~/.aws/current_profile
            export AWS_PROFILE=$profile
        fi
    }
fi