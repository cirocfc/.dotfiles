#!/bin/bash

# ? +===========================================================+
# ? | ALIASES                                                   |
# ? +===========================================================+
# ? | Set personal aliases, overriding those provided by        |
# ? | oh-my-zsh libs, plugins, and themes.                      |
# ? | Aliases can be placed here, though oh-my-zsh users are    |
# ? | encouraged to define aliases within the ZSH_CUSTOM folder.|
# ? |                                                           |
# ? | For a full list of active aliases, run `alias`.           |
# ? +===========================================================+


# ? +-----------------------------------------------------------+
# ? | cat                                                       |
# ? +-----------------------------------------------------------+
# ? | Use bat instead of cat.                                   |
# ? +-----------------------------------------------------------+
alias cat='bat'

# ? +-----------------------------------------------------------+
# ? | k                                                         |
# ? +-----------------------------------------------------------+
# ? | Alias to kubectl.                                         |
# ? +-----------------------------------------------------------+
alias k='kubectl'

# https://krew.sigs.k8s.io/
# Krew is the plugin manager for kubectl command-line tool.
# alias kk='k krew'

# https://github.com/zegl/kube-score
# kube-score is a tool that performs static code analysis of your Kubernetes object definitions.
# alias kk.score='kubectl api-resources --verbs=list --namespaced -o name | \
#   xargs -n1 -I{} bash -c "kubectl get {} --all-namespaces -oyaml && echo ---" | \
#   k score score -'

# ? +-----------------------------------------------------------+
# ? | g                                                         |
# ? +-----------------------------------------------------------+
# ? | Alias to git.                                             |
# ? +-----------------------------------------------------------+
alias gco="git checkout"
alias gs="git status"
alias gd="git diff"

alias g.push="git push"
alias g.pull="git pull origin master --force"
alias g.fetch="git fetch origin --prune --prune-tags --force"
alias g.rebase="git rebase origin/master -i"
alias g.update="g.fetch && g.pull"

# ? +-----------------------------------------------------------+
# ? | ContaAzul Paths                                           |
# ? +-----------------------------------------------------------+
alias ca_erp="cd $HOME/Workspace/ContaAzul"
alias ca_ip="cd $HOME/Workspace/contaazul-ip"
