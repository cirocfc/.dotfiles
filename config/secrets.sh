#!/bin/bash

# ? +===========================================================+
# ? | SECRETS                                                   |
# ? +===========================================================+


# ? +-----------------------------------------------------------+
# ? | Add dotfile secrets                                       |
# ? +-----------------------------------------------------------+
mkdir -p $MY_DOTFILES/.secrets

BW_SESSION_FILE="${MY_DOTFILES}/.secrets/.bw_session"

if ! [ -f "$BW_SESSION_FILE" ]; then
  echo "$(bw unlock --raw)" > "$BW_SESSION_FILE"
fi

export BW_SESSION="$(cat "$BW_SESSION_FILE")"

if ! [ -f $HOME/.aws/credentials ]; then
  mkdir -p $HOME/.aws
  echo "$(bw get notes dotfiles_file_aws_credentials --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.file_aws_credentials
  ln -sf $MY_DOTFILES/.secrets/.file_aws_credentials $HOME/.aws/credentials
fi

if ! [ -f $HOME/.gitconfig ]; then
  echo "$(bw get notes dotfiles_file_gitconfig --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.file_gitconfig
  ln -sf $MY_DOTFILES/.secrets/.file_gitconfig $HOME/.gitconfig
fi

if ! [ -f $HOME/.kube/config ]; then
  mkdir -p $HOME/.kube
  ln -sf $MY_DOTFILES/.secrets/.file_kube_config $HOME/.kube/config
fi

if ! [ -f $HOME/.npmrc ]; then
  echo "$(bw get notes dotfiles_file_npmrc --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.file_npmrc
  ln -sf $MY_DOTFILES/.secrets/.file_npmrc $HOME/.npmrc
fi

if ! [ -f $HOME/.ssh ]; then
  mkdir -p $HOME/.ssh
  ln -sf $MY_DOTFILES/.secrets/.ssh/config $HOME/.ssh/config
  ln -sf $MY_DOTFILES/.secrets/.ssh/id_rsa $HOME/.ssh/id_rsa
  ln -sf $MY_DOTFILES/.secrets/.ssh/id_rsa.pub $HOME/.ssh/id_rsa.pub
  ln -sf $MY_DOTFILES/.secrets/.ssh/known_hosts $HOME/.ssh/known_hosts
fi

if ! [ -f $HOME/.terraform.d/credentials.tfrc.json ]; then
  mkdir -p $HOME/.terraform.d
  echo "$(bw get notes dotfiles_file_terraform_credentials --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.file_terraform_credentials
  ln -sf $MY_DOTFILES/.secrets/.file_terraform_credentials $HOME/.terraform.d/credentials.tfrc.json
fi

# ? +-----------------------------------------------------------+
# ? | Add environment secrets                                   |
# ? +-----------------------------------------------------------+
if ! [ -f $MY_DOTFILES/.secrets/.token_dockerhub_personal ]; then
  echo "$(bw get notes dotfiles_token_dockerhub_personal --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.token_dockerhub_personal
fi

if ! [ -f $MY_DOTFILES/.secrets/.token_github_personal ]; then
  echo "$(bw get notes dotfiles_token_github_personal --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.token_github_personal
fi

if ! [ -f $MY_DOTFILES/.secrets/.token_npmjs ]; then
  echo "$(bw get notes dotfiles_token_npmjs --raw | base64 --decode)" > $MY_DOTFILES/.secrets/.token_npmjs
fi

export PERSONAL_DOCKER_USERNAME="cirocfc"
export PERSONAL_DOCKER_TOKEN="$(cat $MY_DOTFILES/.secrets/.token_dockerhub_personal)"
export PERSONAL_GITHUB_TOKEN="$(cat $MY_DOTFILES/.secrets/.token_github_personal)"
export PERSONAL_NPM_TOKEN_NPMJS="$(cat $MY_DOTFILES/.secrets/.token_npmjs)"
