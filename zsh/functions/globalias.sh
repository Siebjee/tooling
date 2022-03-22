#!/usr/bin/env bash

globalias() {
   # Get last word to the left of the cursor:
   # (z) splits into words using shell parsing
   # (A) makes it an array even if there's only one element
   local word=${${(Az)LBUFFER}[-1]}
   if [[ $GLOBALIAS_FILTER_VALUES[(Ie)$word] -eq 0 ]]; then
      if [[ $GLOBALIAS_EXPAND_ALIAS = "true" ]]; then
        zle _expand_alias
      fi
      if [[ $GLOBALIAS_EXPAND_WORD = "true" ]]; then
        zle expand-word
      fi
   fi
   zle self-insert
}
