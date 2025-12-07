# 📁 Dotfiles 配置说明

本目录包含由 GNU Stow 管理的各类工具配置文件。Stow 会将这些文件符号链接到你的 `$HOME` 目录，从而生效。

## 🗂 目录结构

### 1. 🚀 `zsh/` (Z Shell 配置)
这是主要的 Shell 配置，采用模块化设计。
- **`.zshrc`**: Zsh 的入口文件。它会加载 `.zsh.d/` 目录下的所有模块。
- **`.zsh.d/`**: 模块化配置目录：
  - `aliases.sh`: 常用命令的快捷别名（如 `g` 代替 `git`）。
  - `env.sh`: 环境变量设置（如 `PATH`, `EDITOR` 等）。
  - `plugins.sh`: 插件管理配置（这里使用的是 Zap）。
  - `prompt.sh`: 终端提示符配置。
  - `completions.sh`: 自动补全相关的设置。
  - `commands.sh`: 自定义的 Shell 函数和工具命令。

### 2. 🪟 `aerospace/` (平铺式窗口管理器)
macOS 的平铺式窗口管理器配置。
- **`.config/aerospace/aerospace.toml`**: 核心配置文件。定义了快捷键绑定、窗口布局规则、间距等。类似于 i3wm 的配置。

### 3. 🧘 `vim/` (经典 Vim 配置)
极简主义的 Vim 配置，适用于不需要 IDE 功能的快速编辑。
- **`.vimrc`**: Vim 的核心配置文件，包含基本的键位映射、显示设置等。
- **`.vimrc_hidden_message`**: 一个包含 Vim 哲学或提示的隐藏文件（纯属娱乐或教育用途）。

### 4. 🐱 `tabby/` (终端模拟器)
现代化的终端模拟器配置。
- 如果此目录为空，说明使用 Tabby 的默认配置或配置尚未通过 Stow 管理。

## 🔧 如何部署

在项目根目录下运行以下命令：

```bash
stow --target=$HOME --dir=dotfiles zsh vim aerospace
```

这将自动在你的主目录下创建对应的符号链接。例如，`dotfiles/zsh/.zshrc` 会链接到 `~/.zshrc`。

