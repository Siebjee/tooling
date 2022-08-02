function tux {
    local session=$1

    if [ $(tmux list-sessions | grep ${session} | wc -l) = 1 ]; then
        tmux attach-session -t ${session} -f ${TOOLING_BASE_DIR}/tmux/tmux.conf
    else
        tmux new-session -d -s ${session} -f ${TOOLING_BASE_DIR}/tmux/tmux.conf
        if [ -f "${TOOLING_BASE_DIR}/tmux/myconfig/${session}.tmux" ]; then
            if [[ ! -x "${TOOLING_BASE_DIR}/tmux/myconfig/${session}.tmux" ]]; then
                chmod +x "${TOOLING_BASE_DIR}/tmux/myconfig/${session}.tmux"
            fi
            session=${session} . ${TOOLING_BASE_DIR}/tmux/myconfig/${session}.tmux
        fi

        tmux attach-session -t ${session}:0
    fi
}

function _tux_completions {
    COMPREPLY=($(compgen -W "$(tmux list-sessions |awk -F':' '{print $1}' | tr '\n' ' ' | xargs)" -- "${COMP_WORDS[1]}"))
}

complete -F _tux_completions tux
