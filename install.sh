#!/bin/bash
set -e

TARGET_DIR="$HOME"

# Git
mkdir -p "$TARGET_DIR"/.config/git
ln -sf .config/git/ignore "$TARGET_DIR"/.config/git/ignore

# Neovim
mkdir -p "$TARGET_DIR"/.config/nvim/ftplugin
mkdir -p "$TARGET_DIR"/.config/nvim/setting
mkdir -p "$TARGET_DIR"/.config/lvim/
ln -sf .config/nvim/ftplugin/fish.vim "$TARGET_DIR"/.config/nvim/ftplugin/fish.vim
ln -sf .config/nvim/ftplugin/fortran.vim "$TARGET_DIR"/.config/nvim/ftplugin/fortran.vim
ln -sf .config/nvim/ftplugin/python.vim "$TARGET_DIR"/.config/nvim/ftplugin/python.vim
ln -sf .config/nvim/ftplugin/sh.vim "$TARGET_DIR"/.config/nvim/ftplugin/sh.vim
ln -sf .config/nvim/ftplugin/tex.vim "$TARGET_DIR"/.config/nvim/ftplugin/tex.vim
ln -sf .config/nvim/ftplugin/zsh.vim "$TARGET_DIR"/.config/nvim/ftplugin/zsh.vim
ln -sf .config/nvim/init.vim "$TARGET_DIR"/.config/nvim/init.vim
ln -sf .config/nvim/setting/minimal_plugin.vim "$TARGET_DIR"/.config/nvim/setting/minimal_plugin.vim
ln -sf .config/nvim/setting/plugin.vim "$TARGET_DIR"/.config/nvim/setting/plugin.vim
ln -sf .config/nvim/setting/autocommand.vim "$TARGET_DIR"/.config/nvim/setting/autocommand.vim
ln -sf .config/nvim/setting/general.vim "$TARGET_DIR"/.config/nvim/setting/general.vim
# Lunarvim (Improved neovim)
ln -sf .config/lvim/config.lua "$TARGET_DIR"/.config/lvim/config.lua

# bash
ln -sf .bashrc "$TARGET_DIR"/.bashrc
ln -sf .bash_profile "$TARGET_DIR"/.bash_profile

# zsh
ln -sf .zshenv "$TARGET_DIR"/.zshenv
ln -sf .zsh/.zshrc "$TARGET_DIR"/.zsh/.zshrc
ln -sf .zsh/.zprofile "$TARGET_DIR"/.zsh/.zprofile
ln -sf .zsh/.zshenv "$TARGET_DIR"/.zsh/.zshenv 
ln -sf .zsh/alias.zsh "$TARGET_DIR"/.zsh/alias.zsh

