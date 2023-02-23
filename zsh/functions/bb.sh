shopt -s progcomp
function _bb {
    BREW_FILES=$(find ${TOOLING_BASE_DIR}/brew -type f -depth 1 ! -iname "*.lock.json"| rev | cut -d '/' -f 1 | rev)
    NAMED_OPTIONS="all help show"

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    firstword=$(_bb_get_firstword)
    lastword=$(_bb_get_lastword)

    case ${lastword} in
        "show")
            complete_words=${BREW_FILES}
            ;;
        *)
            complete_words="${NAMED_OPTIONS} ${BREW_FILES}"
            ;;
    esac

    # Un-comment this for debug purposes:
    # echo -e "\nprev = $prev, cur = $cur, firstword = $firstword, lastword = $lastword\n"

    COMPREPLY=( $( compgen -W "$complete_words" -- $cur ))
    return 0
}

# Determines the first non-option word of the command line. This
# is usually the command
_bb_get_firstword() {
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
_bb_get_lastword() {
    local lastword i

    lastword=
    for ((i = 1; i < ${#COMP_WORDS[@]}; ++i)); do
        if [[ ${COMP_WORDS[i]} != -* ]] && [[ -n ${COMP_WORDS[i]} ]] && [[ ${COMP_WORDS[i]} != $cur ]]; then
            lastword=${COMP_WORDS[i]}
        fi
    done

    echo $lastword
}

complete -F _bb bb
