#!/bin/bash

# ? +-----------------------------------------------------------+
# ? | AUTOCOMPLETES                                             |
# ? +-----------------------------------------------------------+


if [[ ! -f $HOME/.dotfiles/argocd/completion ]]; then
  argocd completion zsh > $HOME/.dotfiles/argocd/completion
fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/vault vault
complete -o nospace -C /usr/local/bin/terragrunt terragrunt

autoload -U compinit && compinit
source $HOME/.dotfiles/argocd/completion
