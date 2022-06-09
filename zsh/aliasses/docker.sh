#!/usr/bin/env bash

## Basic docker commands
alias d="docker"
alias dps="docker ps"
alias dpsa="docker ps -a"

## Docker image commands
alias dls="docker container ls"
alias dlsa="docker container ls -a"

## Docker image commands
alias dils="docker image ls"

## Docker volume commands
alias dvls="docker volume ls"

## Docker network commands
alias dnls="docker network ls"

## Docker build commands
alias db="docker build"
alias dbf="docker build --progress=plain"

## Debug
alias ddbg="docker run --rm --name debug -ti --entrypoint=\"\""
