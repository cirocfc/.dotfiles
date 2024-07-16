#!/bin/bash

# ? +===========================================================+
# ? | OH-MY-ZSH CONFIGURATIONS                                  |
# ? +===========================================================+

# ? +-----------------------------------------------------------+
# ? | Theme                                                     |
# ? +-----------------------------------------------------------+
ZSH_THEME="powerlevel10k/powerlevel10k"

# ? +===========================================================+
# ? | oh-my-zsh plugins                                         |
# ? +===========================================================+
# ? | Which plugins would you like to load?                     |
# ? | Standard plugins can be found in $ZSH/plugins/            |
# ? | Custom plugins may be added to $ZSH_CUSTOM/plugins/       |
# ? | Example format: plugins=(rails git ruby)                  |
# ? | Add wisely, as too many plugins slow down shell startup.  |
# ? +===========================================================+

# ? +-----------------------------------------------------------+
# ? | zsh-users plugins                                         |
# ? +-----------------------------------------------------------+
# ? | If the plugins you would like to use are not already      |
# ? | installed, they will be cloned from the following URL.    |
# ? +-----------------------------------------------------------+
# ? | https://github.com/zsh-users                              |
# ? +-----------------------------------------------------------+
zshusersplugin=(
  zsh-autosuggestions
  zsh-syntax-highlighting
)
for i in "${zshusersplugin[@]}"; do
  if [ ! -d $HOME/.oh-my-zsh/custom/plugins/$i ]; then
    echo "Installing $i..."
    git clone https://github.com/zsh-users/$i $HOME/.oh-my-zsh/custom/plugins/$i
  fi
done

# ? +-----------------------------------------------------------+
# ? | Standard plugins                                          |
# ? +-----------------------------------------------------------+
plugins=(
  aws
  docker
  docker-compose
  git
  golang
  helm
  kubectl
  terraform
  zsh-nvm
)

# ? +-----------------------------------------------------------+
# ? | Put all plugins together                                  |
# ? +-----------------------------------------------------------+
plugins=("${plugins[@]}" "${zshusersplugin[@]}")

# ? +===========================================================+
# ? | Powerlevel10k                                             |
# ? +===========================================================+
# ? | Enable Powerlevel10k instant prompt.                      |
# ? | Should stay close to the top of $HOME/.zshrc.                 |
# ? | Initialization code that may require console input        |
# ? | (password prompts, [y/n] confirmations, etc.) must go     |
# ? | above this block; everything else may go below.           |
# ? +===========================================================+

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh                                                 |
# ? +-----------------------------------------------------------+
# ? | Path to your oh-my-zsh installation.                      |
# ? +-----------------------------------------------------------+
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
