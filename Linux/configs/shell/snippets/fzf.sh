#!/bin/bash

alias fzf='fzf --walker-skip="$(cat $HOME/.fzfignore 2>/dev/null)" --no-sort'

function fzfd () {
    fzf --walker=dir
}

function fzff () {
    fzf --walker-root="$1"
}
function ffzf () {
    find $@ | fzf
}
function ffcd () {
    cd "$(find $@ -type d | fzf)"
}
function ffcdq () {
    root="$(realpath $1)"
    shift 1
    cd "$(find $root -type d | fzf -f $@ | sort -V | head -1)"
}
function fzfq () {
    fzf --query "$1"
}
function hfzf () {
    history | fzf
}
function fffq () {
    root="$(realpath $1)"
    shift 1
    find $root -type f | fzf -f $@ | sort -V | head -1
}

alias gcof='git checkout $(git branch | fzf)'
alias grbf='git rebase $(git branch | fzf)'

alias dk='docker stop $(docker ps -a | tail +2 | fzf | cut -d" " -f1)'

function dc () {
    docker commit $(docker ps -a | tail +2 | fzf | cut -d" " -f1) $@

}
