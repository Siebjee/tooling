#!/usr/bin/env bash

function flux_rhr {
    local hr=${1:?"Please specify the HelmRelease name."}
    flux suspend hr ${hr} && flux resume hr ${hr}
}
