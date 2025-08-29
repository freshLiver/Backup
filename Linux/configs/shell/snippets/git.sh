#!/bin/bash

alias gref="git reflog --date=iso"
alias gssno="git status --short -uno"
alias gcof='git checkout $(git branch | fzf)'
alias grbf='git rebase $(git branch | fzf)'
