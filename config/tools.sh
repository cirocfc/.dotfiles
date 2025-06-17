#!/bin/bash

# ? +===========================================================+
# ? | TOOLS                                                     |
# ? +===========================================================+

# TOOLS_DIR="$MY_DOTFILES/_tools"

# if [ -d "$TOOLS_DIR" ]; then
#   for file in "$TOOLS_DIR"/*; do
#     if [ -f "$file" ]; then
#       source "$file"
#     fi
#   done
# else
#     echo "Directory $TOOLS_DIR does not exist."
# fi

# ? +-----------------------------------------------------------+
# ? | nvm                                                       |
# ? +-----------------------------------------------------------+
# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# [[ -r $NVM_DIR/bash_completion ]] && \. $NVM_DIR/bash_completion

# ? +-----------------------------------------------------------+
# ? | ArgoCD                                                    |
# ? +-----------------------------------------------------------+
# ? | Environment variables to be used in argocd commands.      |
# ? +-----------------------------------------------------------+
# export ARGOCD_APPLICATION_CONTROLLER_NAME=core-argocd-application-controller

# ? +-----------------------------------------------------------+
# ? | Krew Kubernetes Plugin                                    |
# ? +-----------------------------------------------------------+
# ? | PATH configuration                                        |
# ? +-----------------------------------------------------------+
# ? | https://krew.sigs.k8s.io/docs/user-guide/setup/install/   |
# ? +-----------------------------------------------------------+
# export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# ? +-----------------------------------------------------------+
# ? | Golang                                                    |
# ? +-----------------------------------------------------------+
# ? | PATH configuration                                        |
# ? +-----------------------------------------------------------+
# ? | https://go.dev/doc/install                                |
# ? +-----------------------------------------------------------+
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:/usr/local/go/bin
