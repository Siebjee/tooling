function tux {
    local arg=$1

    case $arg in
        *)
            tmux attach-session -t $1 -f ${TOOLING_ZSH_DIR}/tmux/tmux.conf \
            || tmux new-session -s $1 -f ${TOOLING_ZSH_DIR}/tmux/tmux.conf
        ;;
    esac
}

function _tux_completions {
    COMPREPLY=($(compgen -W "$(tmux list-sessions |awk -F':' '{print $1}' | tr '\n' ' ' | xargs)" -- "${COMP_WORDS[1]}"))
}

complete -F _tux_completions tux
