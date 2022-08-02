#!/usr/bin/env bash

# This will ignore the aliasses under commands ls and l
if command rg --version > /dev/null 2>&1; then
    GLOBALIAS_FILTER_VALUES=(ls l)
    alias grep="rg"
    alias _grep="/usr/bin/grep"
else
    GLOBALIAS_FILTER_VALUES=(ls l grep)
fi

# This will expand aliasses
GLOBALIAS_EXPAND_ALIAS=true

# This will not expand words, therefor also not your variables :)
GLOBALIAS_EXPAND_WORD=false
