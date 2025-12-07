#!/usr/bin/env bash

set -euo pipefail

# 如果未安装 Xcode 命令行工具 (Command Line Tools)，则进行安装
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  # 循环检查直到安装完成
  until xcode-select -p &>/dev/null; do
    sleep 5
  done
fi

# 如果未安装 Homebrew，则进行安装
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
  # 将 Homebrew 环境配置写入 .zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 通过 Brewfile 安装应用程序
if [[ -f ./Brewfile ]]; then
  echo "Installing applications from Brewfile..."
  brew bundle --file=./Brewfile
else
  echo "Warning: Brewfile not found in current directory"
fi

# 安装 Zap ZSH 插件管理器
if [[ ! -d "${XDG_DATA_HOME:-$HOME/.local/share}/zap" ]]; then
  echo "Installing Zap ZSH plugin manager..."
  zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
  # 删除安装 Zap 时生成的默认 .zshrc，以便后续用 stow 进行管理
  echo "Removing .zshrc so stow can manage it..."
  rm -f ~/.zshrc
fi

# 重新加载 Homebrew 环境变量以防万一
eval "$(/opt/homebrew/bin/brew shellenv)"

# 使用 GNU Stow 创建 dotfiles 的软链接
echo "Setting up dotfiles with GNU Stow..."
stow --target="$HOME" --dir=./dotfiles zsh vim aerospace tabby

# 重启 shell 以应用更改
exec zsh -l
