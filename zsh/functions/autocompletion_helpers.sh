# Determines the first non-option word of the command line. This
# is usually the command
_get_firstword() {
    local firstword i

    firstword=
    for ((i = 1; i < ${#COMP_WORDS[@]}; ++i)); do
        if [[ ${COMP_WORDS[i]} != -* ]]; then
            firstword=${COMP_WORDS[i]}
            break
        fi
    done

    echo $firstword
}

# Determines the last non-option word of the command line. This
# is usally a sub-command
_get_lastword() {
    local lastword i

    lastword=
    for ((i = 1; i < ${#COMP_WORDS[@]}; ++i)); do
        if [[ ${COMP_WORDS[i]} != -* ]] && [[ -n ${COMP_WORDS[i]} ]] && [[ ${COMP_WORDS[i]} != $cur ]]; then
            lastword=${COMP_WORDS[i]}
        fi
    done

    echo $lastword
}

