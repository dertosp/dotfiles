#!/bin/bash
# fnm, rg, fd, fzf, git, neovim, tmux, zsh, oh-my-zsh
# alacritty, docker

log() {
  echo "${FUNCNAME[1]}: ${1}"
}

make_home_symlink() {
  if [[ -z "$1" ]]; then
    log "missing path to the file"
    exit 1
  fi
  local dotfile_path="$PWD/$1"
  local home_dotfile_path="$HOME/$1"

  if [[ ! -z "$2" ]]; then
    home_dotfile_path="$HOME/$2"
  fi

  if [[ -L "$home_dotfile_path" ]]; then
    log "$home_dotfile_path is already a symlink, skipping"
    return
  fi

  if [[ -e "$home_dotfile_path" ]]; then
    log "$home_dotfile_path file/dir already exists, do you want to replace it?(y/n)"
    read -N 1 response
    if [[ "$response" = "y" ]]; then
      log "removing $home_dotfile_path"
      rm -rf $home_dotfile_path
    else
      return
    fi
  fi

  ln -s "$dotfile_path" "$home_dotfile_path" 2>/dev/null
  log "symlink for $dotfile_path has been created!"
}

mkdir $HOME/.config

dotfiles=".gitconfig .zshenv .config/alacritty .config/tmux .config/nvim .config/zsh"
for dotfile in $dotfiles; do
    make_home_symlink "$dotfile"
done

if [[ ! -f ~/.gitcredentials ]]; then
  echo "Please don't forget to create and update your .gitcredentials file"
  echo "Example:"
  echo "git config --file ~/.gitcredentials user.name \"your_name\""
  echo "git config --file ~/.gitcredentials user.email \"your@email.com\""
fi
