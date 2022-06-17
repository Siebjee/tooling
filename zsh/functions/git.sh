#!/usr/bin/env bash
function gitopen() {
    local remote=$(git remote -v |grep push | awk '{print $2}')

    case ${remote} in
        "https://"*)
            remote_url=${remote}
        ;;
        "git@ssh.dev.azure.com"*)
            remote_url=$(echo ${remote} |sed -e 's/git@//g' -e 's/:v3//g' -e 's/ssh.//g')
            repo=$(echo ${remote_url} |rev | cut -d '/' -f 1 | rev)
            remote_url=$(echo ${remote_url/${repo}/_git\/${repo}})
            remote_url="https://${remote_url}"
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
