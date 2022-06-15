#!/usr/bin/env bash
function gitopen() {
    local remote=$(git remote -v |grep push | awk '{print $2}')

    case ${remote} in
        "https://"*)
            remote_url=${remote}
        ;;
        "git@"*)
            remote_url="https://$(echo ${remote} |sed -e 's/git@//g' -e 's/:/\//g')"
        ;;
        *)
            return 127
        ;;
    esac

    open ${remote_url}
}
