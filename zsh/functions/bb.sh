function _bb {
    BREW_FILES=$(find ${TOOLING_BASE_DIR}/brew -type f -depth 1 ! -iname "*.lock.json"| rev | cut -d '/' -f 1 | rev)
    NAMED_OPTIONS="all help show"

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    firstword=$(_get_firstword)
    lastword=$(_get_lastword)

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


complete -F _bb bb
