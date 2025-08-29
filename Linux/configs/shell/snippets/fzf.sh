#!/bin/bash

alias fzf='fzf --walker-skip="$(cat $HOME/.fzfignore 2>/dev/null)"'

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
    cd $(find -type d $@ | fzf)
}
function fzfq () {
    fzf --query "$1"
}
function hfzf () {
    history | fzf
}

alias gcof='git checkout $(git branch | fzf)'
alias grbf='git rebase $(git branch | fzf)'
