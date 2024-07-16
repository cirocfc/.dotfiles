#!/bin/bash

# ? +===========================================================+
# ? | PRELOAD CONFIGURATIONS                                    |
# ? +===========================================================+

# ? +-----------------------------------------------------------+
# ? | Load Homebrew                                             |
# ? +-----------------------------------------------------------+
eval "$(/opt/homebrew/bin/brew shellenv)"

# Fix ZSH compdef error
autoload -Uz compinit && compinit

# ? +-----------------------------------------------------------+
# ? | Load Powerlevel10k confing if exists.                     |
# ? +-----------------------------------------------------------+
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
