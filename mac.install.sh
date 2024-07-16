#!/bin/bash

# ? +===========================================================+
# ? | GLOBAL ENVS                                               |
# ? +===========================================================+
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# ? +===========================================================+
# ? | UTILS                                                     |
# ? +===========================================================+

# ? +-----------------------------------------------------------+
# ? | is_package_installed                                      |
# ? +-----------------------------------------------------------+
# ? | Check if a Homebrew package is installed                  |
# ? | Usage: is_package_installed <package>                     |
# ? +-----------------------------------------------------------+
is_package_installed() {
  brew list | { grep -q "^$1\$"; cat > /dev/null; }
}

# ? +-----------------------------------------------------------+
# ? | install_package                                           |
# ? +-----------------------------------------------------------+
# ? | Install a given Homebrew package                          |
# ? | Usage: install_package <package>                          |
# ? +-----------------------------------------------------------+
install_package() {
  echo "Installing $1..."
  brew install "$1"
}

# ? +-----------------------------------------------------------+
# ? | command_exists                                            |
# ? +-----------------------------------------------------------+
# ? | Check if command exists                                   |
# ? | Usage: command_exists <command>                           |
# ? +-----------------------------------------------------------+
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# ? +===========================================================+
# ? | TOOLS                                                     |
# ? +===========================================================+

# ? +-----------------------------------------------------------+
# ? | Homebrew                                                  |
# ? +-----------------------------------------------------------+
install_brew() {
  if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  else
    echo "Homebrew is already installed."
    brew --version
  fi
}

# ? +-----------------------------------------------------------+
# ? | Install Homebrew packages                                 |
# ? +-----------------------------------------------------------+
install_brew_common_packages() {
  packages=(
    openssl
    openssh
    ca-certificates
    wget
    jq
    git
    awscli
    bat
    helm
    kubectl
    k9s
    tfenv
    zsh
  )

  for package in "${packages[@]}"; do
    if ! is_package_installed "$package"; then
      install_package "$package"
    else
      echo "brew: package $package is already installed."
    fi
  done
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh                                                 |
# ? +-----------------------------------------------------------+
install_oh_my_zsh() {
  if [ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]; then
    echo "omz: .oh-my-zsh is already installed."
  else
    echo "omz: Installing .oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh plugin nvm                                      |
# ? +-----------------------------------------------------------+
install_oh_my_zsh_plugin_nvm() {
  OH_ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins
  mkdir -p $OH_ZSH_PLUGINS
  if [ ! -d $OH_ZSH_PLUGINS/zsh-nvm ]; then
    echo "omz: Installing nvm plugin..."
    git clone https://github.com/lukechilds/zsh-nvm $OH_ZSH_PLUGINS/zsh-nvm
  else
    echo "omz: plugin nvm is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh theme p10k                                      |
# ? +-----------------------------------------------------------+
install_oh_my_zsh_theme_powerlevel10k() {
  OH_ZSH_THEMES=$HOME/.oh-my-zsh/custom/themes
  mkdir -p $OH_ZSH_THEMES
  if [ -f "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" ]; then
    echo "omz: powerlevel10k theme is already installed."
  else
    echo "omz: Installing powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  fi
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh plugin zsh-autosuggestions                      |
# ? +-----------------------------------------------------------+
install_oh_my_zsh_plugin_zsh_autosuggestions() {
  OH_ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins
  mkdir -p $OH_ZSH_PLUGINS
  if [ ! -d $OH_ZSH_PLUGINS/zsh-autosuggestions ]; then
    echo "omz: Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions $OH_ZSH_PLUGINS/zsh-autosuggestions
  else
    echo "omz: plugin zsh-autosuggestions is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh plugin zsh-syntax-highlighting                  |
# ? +-----------------------------------------------------------+
install_oh_my_zsh_plugin_zsh_syntax_highlighting() {
  OH_ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins
  mkdir -p $OH_ZSH_PLUGINS
  if [ ! -d $OH_ZSH_PLUGINS/zsh-syntax-highlighting ]; then
    echo "omz: Installing zsh-syntax-highlighting plugin..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OH_ZSH_PLUGINS/zsh-syntax-highlighting
  else
    echo "omz: plugin zsh-syntax-highlighting is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | oh-my-zsh plugin zsh-completions                          |
# ? +-----------------------------------------------------------+
install_oh_my_zsh_plugin_zsh_completions() {
  OH_ZSH_PLUGINS=$HOME/.oh-my-zsh/custom/plugins
  mkdir -p $OH_ZSH_PLUGINS
  if [ ! -d $OH_ZSH_PLUGINS/zsh-completions ]; then
    echo "omz: Installing zsh-completions plugin..."
    git clone https://github.com/zsh-users/zsh-completions $OH_ZSH_PLUGINS/zsh-completions
  else
    echo "omz: plugin zsh-completions is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | Install Fonts                                             |
# ? +-----------------------------------------------------------+
install_fonts() {
  echo "Installing fonts..."
  mkdir -p $HOME/Library/Fonts
  cp -r $SCRIPT_DIR/files/fonts/*.ttf $HOME/Library/Fonts
}

# ? +-----------------------------------------------------------+
# ? | Install Vault                                             |
# ? +-----------------------------------------------------------+
install_vault() {
  if ! command_exists vault; then
    echo "Installing Vault..."
    brew tap hashicorp/tap
    brew install hashicorp/tap/vault
  else
    echo "Vault is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | Install VSCode                                            |
# ? +-----------------------------------------------------------+
install_vscode() {
  # check if code is installed
  if ! command_exists code; then
    echo "Installing VSCode..."
    brew install --cask visual-studio-code
  else
    echo "VSCode is already installed."
  fi
}

# ? +-----------------------------------------------------------+
# ? | iTerm                                                     |
# ? +-----------------------------------------------------------+
install_iterm() {
  if [ -d "/Applications/iTerm.app" ]; then
    echo "iTerm is already installed."
  else
    brew install --cask iterm2
  fi
}

# ? +-----------------------------------------------------------+
# ? | Install Dracula theme                                     |
# ? +-----------------------------------------------------------+
install_iterm_theme_dracula() {
  if [ -f "$HOME/.config/iterm2/themes/dracula/Dracula.itermcolors" ]; then
    echo "Dracula is already present."
  else
    mkdir -p $HOME/.config/iterm2/themes/dracula
    git clone https://github.com/dracula/iterm.git $HOME/.config/iterm2/themes/dracula
  fi
}

install_iterm_profile() {
  if [ -f "$HOME/.config/iterm2/profile.json" ]; then
    echo "iTerm profile is already present."
  else
    mkdir -p $HOME/.config/iterm2
    cp $SCRIPT_DIR/files/iterm2/profile.json $HOME/.config/iterm2/profile.json
  fi
}

configure_iterm() {
  defaults write com.googlecode.iterm2 AlternateMouseScroll -bool true
  # defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/.config/iterm2/profile.json"
  # defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
}

# ? +-----------------------------------------------------------+
# ? | Add dotfiles secrets                                      |
# ? +-----------------------------------------------------------+
add_secrets() {
  echo "Adding dotfiles secrets..."
  
  if ! [ -f $HOME/.aws/config ]; then
    echo "Add .aws/config"
    mkdir -p $HOME/.aws
    cp $SCRIPT_DIR/secrets/.aws/config $HOME/.aws/config
  fi

  if ! [ -f $HOME/.kube/config ]; then
    echo "Add .kube/config"
    mkdir -p $HOME/.kube
    cp $SCRIPT_DIR/secrets/.kube/config $HOME/.kube/config
  fi

  if ! [ -f $HOME/.npmrc ]; then
    echo "Add .npmrc"
    cp $SCRIPT_DIR/secrets/.npmrc $HOME/.npmrc
  fi

  if ! [ -f $HOME/.ssh ]; then
    echo "Add .ssh"
    cp -r $SCRIPT_DIR/secrets/.ssh $HOME/.ssh
  fi
}

# ? +===========================================================+
# ? | CONFIGURE DOTFILES                                        |
# ? +===========================================================+
# Install .dotfiles on .zshrc by replacing file with source command to load .dotfiles/index
install_dotfiles() {
  echo "Installing .dotfiles..."
  if [ -f $HOME/.zshrc ]; then
    mv -f $HOME/.zshrc $HOME/.zshrc.bak
  fi
  # source .dotfiles/index to .zshrc
  cat <<EOF >> $HOME/.zshrc
# ? +-----------------------------------------------------------+
# ? | Sourcing my .dotfiles                                     |
# ? +-----------------------------------------------------------+
export MY_DOT_FILES="$SCRIPT_DIR"
source "\$MY_DOT_FILES/index.sh"
EOF
}

# ? +===========================================================+
# ? | RUN INSTALLATIONS                                         |
# ? +===========================================================+
install_brew
install_brew_common_packages

install_oh_my_zsh
install_oh_my_zsh_plugin_nvm
install_oh_my_zsh_plugin_zsh_autosuggestions
install_oh_my_zsh_plugin_zsh_syntax_highlighting
install_oh_my_zsh_plugin_zsh_completions
install_oh_my_zsh_theme_powerlevel10k

install_vault
install_vscode

install_fonts
install_iterm
install_iterm_theme_dracula
configure_iterm

install_dotfiles

add_secrets
