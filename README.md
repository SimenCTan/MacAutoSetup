# 🛠️ MacAutoSetup

一个精简、现代的 macOS 开发环境，将 Linux 平铺式窗口管理器的体验带到 Mac 上 —— 极其省心。

## ✨ 核心功能

- 🚀 Zsh (搭配 Zap) — 插件管理器，打造干净、快速的 Shell
- 🧠 Raycast — 快速启动器与自动化工具
- 🪟 Aerospace — 平铺式窗口管理 (Mac 版的 i3)
- 🧘 极简 Vim 配置 — 如果你想保持轻量
- 🖋️ GNU Stow — 简单、模块化的 dotfile 管理
- 🧰 基础 GNU 工具 — sed, coreutils, gawk 等


## 🎯 设计理念

- 终端优先，键盘驱动的工作流
- 快速上手
- 模块化、易懂的配置 —— 没有隐藏的魔法
- 低配置（我经常使用 tmux，但对它几乎是 0 配置）以提高可移植性
- Dotfile 卫生 - 我从一个 YouTube 视频里借用了 .zsh.d 的想法，但我忘了是哪个视频了，非常希望能注明出处。如果有人知道关于 "the dot problem" 或类似的视频，请指出来并告诉我！



## 🔧 安装

### ✅ 如果你已经安装了 Git

```sh
git clone https://github.com/NLaundry/MacAutoSetup.git ~/Projects/MacAutoSetup
cd ~/Projects/MacAutoSetup
./bootstrap.sh
```


## 📦 安装内容

Brewfile 涵盖了所有必需品：

### 🧰 CLI 工具

git, fzf, ripgrep, bat, htop, lazygit, lazysql, awscli, jq, gh, tmux, stow, neovim, kubectl, tailscale, coreutils, gnu-sed, findutils, gawk

### 💻 GUI 应用

raycast, aerospace, tabby, visual-studio-code, docker, caffeine

### 🖥️ 字体

JetBrains Mono Nerd Font (用于漂亮的图标和代码连字)

### 🧪 开发环境

python, uv, node, nvm


## 📁 Dotfiles 与配置

Dotfiles 使用 GNU Stow 进行管理。

目录结构：

```
dotfiles/
├── zsh/
├── vim/         # 经典 Vim 配置 (可选)
├── aerospace/   # 平铺式窗口管理器配置
├── tabby/
└── …
```

每个文件夹都映射到 `$HOME`。例如：

```
stow --target=$HOME zsh tabby
```

这会在你的主目录下创建配置文件的符号链接。

## ✅ 结果

- 感觉像装了 i3 的 Arch 或 Debian，但针对 Mac 进行了打磨
- 极简 Vim：选择你的工作流
- 平铺式窗口控制和快捷键
- 带有 Nerd Font 和现代 CLI 工具的干净终端
- 为 Python, Node, AWS 和 Kubernetes 准备就绪的 Shell 和开发工具
