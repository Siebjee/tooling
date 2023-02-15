function _bb_completions {
    COMPREPLY=($(find ${TOOLING_BASE_DIR}/brew -type f -depth 1 | rev | cut -d '/' -f 1 | rev))
    COMPREPLY+=("all" "help")
}

complete -F _bb_completions bb
