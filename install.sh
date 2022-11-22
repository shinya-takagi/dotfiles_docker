#!/bin/bash
set -e

DOTFILE_DIR="$DOT_DIR"
TARGET_DIR="$HOME"

# Git
mkdir -p "$TARGET_DIR"/.config/git
ln -sf "$DOTFILE_DIR"/.config/git/ignore "$TARGET_DIR"/.config/git/ignore

# Neovim
mkdir -p "$TARGET_DIR"/.config/nvim/ftplugin
mkdir -p "$TARGET_DIR"/.config/nvim/setting
mkdir -p "$TARGET_DIR"/.config/nvim/lua
mkdir -p "$TARGET_DIR"/.config/nvim/plugin
mkdir -p "$TARGET_DIR"/.config/lvim/
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/fish.vim "$TARGET_DIR"/.config/nvim/ftplugin/fish.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/fortran.vim "$TARGET_DIR"/.config/nvim/ftplugin/fortran.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/python.vim "$TARGET_DIR"/.config/nvim/ftplugin/python.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/sh.vim "$TARGET_DIR"/.config/nvim/ftplugin/sh.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/tex.vim "$TARGET_DIR"/.config/nvim/ftplugin/tex.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/ftplugin/zsh.vim "$TARGET_DIR"/.config/nvim/ftplugin/zsh.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/_init.vim "$TARGET_DIR"/.config/nvim/_init.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/init.lua "$TARGET_DIR"/.config/nvim/init.lua
# ln -sf "$DOTFILE_DIR"/.config/nvim/setting/minimal_plugin.vim "$TARGET_DIR"/.config/nvim/setting/minimal_plugin.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/setting/plugin.vim "$TARGET_DIR"/.config/nvim/setting/plugin.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/setting/autocommand.vim "$TARGET_DIR"/.config/nvim/setting/autocommand.vim
ln -sf "$DOTFILE_DIR"/.config/nvim/setting/general.vim "$TARGET_DIR"/.config/nvim/setting/general.vim
# Neovim plugins
for f in $(find "$DOTFILE_DIR"/.config/nvim/plugin -type f | grep -v packer_compiled.lua); do
    ln -sf "$f" "$TARGET_DIR"/.config/nvim/plugin/
done
# Main setting
for f in $(find "$DOTFILE_DIR"/.config/nvim/lua -type f); do
    ln -sf "$f" "$TARGET_DIR"/.config/nvim/lua/
done
# First packer
if [[ ! -d "$HOME"/.local/share/nvim/site/pack/packer/start/packer.nvim ]]; then
  echo "Install Packer.nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
# Lunarvim (Improved neovim)
ln -sf "$DOTFILE_DIR"/.config/lvim/config.lua "$TARGET_DIR"/.config/lvim/config.lua

# bash
ln -sf "$DOTFILE_DIR"/.bashrc "$TARGET_DIR"/.bashrc
ln -sf "$DOTFILE_DIR"/.bash_profile "$TARGET_DIR"/.bash_profile

# zsh
ln -sf "$DOTFILE_DIR"/.zshenv "$TARGET_DIR"/.zshenv
ln -sf "$DOTFILE_DIR"/.zsh/.zshrc "$TARGET_DIR"/.zsh/.zshrc
ln -sf "$DOTFILE_DIR"/.zsh/.zprofile "$TARGET_DIR"/.zsh/.zprofile
ln -sf "$DOTFILE_DIR"/.zsh/.zshenv "$TARGET_DIR"/.zsh/.zshenv 
ln -sf "$DOTFILE_DIR"/.zsh/alias.zsh "$TARGET_DIR"/.zsh/alias.zsh

# dircolors
ln -sf "$DOTFILE_DIR"/.dircolors "$TARGET_DIR"/.dircolors
