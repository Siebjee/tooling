#!/usr/bin/env bash

function b64d {
    local string=$@

    echo "${string}" | base64 -d
}

function b64 {
    local string=$@

    echo "${string}" | base64 -d
}

