#!/usr/bin/env bash
function gitopen() {
    local remote=$(git remote -v |grep push | awk '{print $2}')
    local browser=${1:="default"}

    case ${remote} in
        "https://"*)
            remote_url=${remote}
        ;;
        "git@ssh.dev.azure.com"*)
            remote_url=$(echo ${remote} |sed -e 's/git@//g' -e 's/:v3//g' -e 's/ssh.//g')
            repo=$(echo ${remote_url} |rev | cut -d '/' -f 1 | rev)
            remote_url=$(echo ${remote_url/${repo}/_git\/${repo}})
            remote_url="https://${remote_url}"
            browser="Google Chrome"
        ;;
        "git@"*)
            remote_url="https://$(echo ${remote} |sed -e 's/git@//g' -e 's/:/\//g')"
        ;;
        *)
            return 127
        ;;
    esac

    if [ "${browser}" = "default" ]; then
        open ${remote_url}
    else
        open ${remote_url} -a "${browser}"
    fi
}

function gpo {
    local git_branch=$(git branch | awk '/^[*]/{print $2}')
    git push origin ${git_branch}
}
