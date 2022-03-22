#!/usr/bin/env bash

# This will ignore the aliasses under commands ls, l and grep
GLOBALIAS_FILTER_VALUES=(ls l grep)

# This will expand aliasses
GLOBALIAS_EXPAND_ALIAS=true

# This will not expand words, therefor also not your variables :)
GLOBALIAS_EXPAND_WORD=false
