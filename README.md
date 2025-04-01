# Development Environment Setup Guide

This guide provides comprehensive instructions for setting up a complete development environment with Fish shell, Neovim, and essential development tools.

# Table of Contents

1. [Overview & System Requirements](#overview--system-requirements)
   - [Supported Operating Systems](#supported-operating-systems)
   - [Prerequisites](#prerequisites)
   - [What You'll Get](#what-youll-get)

2. [Installing Fish Shell](#installing-fish-shell)
   - [Windows (WSL)](#windows-wsl)
   - [macOS](#macos)
   - [Linux](#linux)
   - [Setting Fish as Default Shell](#setting-fish-as-default-shell)

3. [Configuring Fisher & Tide Theme](#configuring-fisher--tide-theme)
   - [Installing Fisher](#installing-fisher)
   - [Installing and Configuring Tide Theme](#installing-and-configuring-tide-theme)
   - [Additional Fisher Plugins](#additional-fisher-plugins-recommended)

4. [Installing Homebrew](#installing-homebrew)
   - [Prerequisites](#prerequisites-1)
   - [Installation Steps](#installation-steps)
   - [Verify Installation](#verify-installation)

5. [Installing Essential Packages](#installing-essential-packages-with-homebrew)
   - [Core Development Tools](#core-development-tools)
   - [Language Support and Tools](#additional-language-support-and-tools)
   - [Configuring the Tools](#configuring-the-installed-tools)

6. [Neovim Setup and Configuration](#neovim-setup-and-configuration)
   - [Setting Up LazyVim](#setting-up-lazyvim)
   - [Essential Plugins](#essential-plugins-and-configuration)
   - [Verifying Setup](#verifying-neovim-setup)

7. [Additional Neovim Configuration Details](#additional-neovim-configuration-details)
   - [Plugin-Specific Settings](#plugin-specific-settings-and-keybindings)
   - [Custom Configuration Tips](#custom-configuration-tips)
   - [Debugging Setup](#debugging-setup)

8. [Additional Tools Usage Guide](#additional-tools-usage-guide)
   - [fzf](#fzf-fuzzy-finder)
   - [ghq](#ghq-repository-manager)
   - [eza](#eza-modern-ls-replacement)
   - [z for Fish](#z-for-fish-directory-jumping)

9. [System-Specific Configurations](#system-specific-configurations)
   - [Windows with WSL Setup](#windows-with-wsl-setup)
   - [macOS Setup](#macos-setup)
   - [Linux Setup](#linux-setup)
   - [Cross-Platform Considerations](#cross-platform-considerations)

10. [Post-Installation Verification](#post-installation-verification)
    - [Shell Environment](#shell-environment)
    - [Development Tools](#development-tools)
    - [Common Issues Checklist](#common-issues-checklist)
    - [Troubleshooting Steps](#troubleshooting-steps)

11. [Maintenance & Updates](#maintenance--updates)
    - [Updating Core Components](#updating-core-components)
    - [Automated Updates](#automated-updates)
    - [Regular Maintenance Checklist](#regular-maintenance-checklist)
    - [Backup Important Configurations](#backup-important-configurations)

## Overview & System Requirements

### Supported Operating Systems
- **Windows** (Primary)
  - Windows Subsystem for Linux (WSL) recommended for Unix-like environment
- **macOS**
- **Linux**

### Prerequisites
Before proceeding with the setup, ensure you have the following:

- Git (version 2.45.0 or higher)
- A modern terminal emulator
  - Windows Terminal (recommended for Windows)
  - iTerm2 (recommended for macOS)
  - Any standard terminal emulator (Linux)
- Administrator privileges
- Basic command-line knowledge
- Node.js and npm (if working with JavaScript/TypeScript projects)
  - Node.js version 22.13.0 or higher
  - npm version 10.9.2 or higher

### What You'll Get
This setup guide will help you configure:

- Fish shell with Fisher plugin manager and Tide theme
- Homebrew package manager
- Essential development tools (ripgrep, fzf, lazygit, etc.)
- Neovim with LazyVim configuration
  - TypeScript/JavaScript support
  - ESLint and Prettier integration
  - Git integration
  - File exploration and fuzzy finding
  - GitHub Copilot support
  - And more!

## Installing Fish Shell

### Windows (WSL)
```bash
# Update package list
sudo apt update

# Install Fish shell
sudo apt install fish

# Verify installation
fish --version
```

### macOS
```bash
# Using Homebrew
brew install fish
```

### Linux
#### Ubuntu/Debian
```bash
sudo apt update
sudo apt install fish
```

#### Fedora
```bash
sudo dnf install fish
```

### Setting Fish as Default Shell
To make Fish your default shell:

1. Add Fish to the list of allowed shells:
```bash
# Add Fish to /etc/shells if it's not already there
echo $(which fish) | sudo tee -a /etc/shells
```

2. Change your default shell:
```bash
chsh -s $(which fish)
```

3. Restart your terminal or log out and back in for changes to take effect.

Note: On Windows with WSL, you can set Fish as the default shell by:
1. Open your WSL distribution's configuration file
2. Add or modify the "command" line to:
```json
{
    "command": "fish",
    "startingDirectory": "~"
}
```

Verify the installation by running:
```bash
echo $SHELL
# Should output: /usr/bin/fish or similar path
```

## Configuring Fisher & Tide Theme

### Installing Fisher
First, install Fisher (the Fish plugin manager):

```fish
# Launch fish shell if you haven't already
fish

# Install Fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

### Installing and Configuring Tide Theme
Tide is a modern, powerful prompt manager for Fish:

```fish
# Install Tide
fisher install IlanCosman/tide@v5

# Start the interactive configuration wizard
tide configure
```

During the configuration wizard, you'll be prompted to:
1. Choose a prompt style (Lean, Classic, or Rainbow)
2. Display the current time
3. Show the prompt on one or two lines
4. Display the OS icon
5. Configure git status display
6. And more...

You can always reconfigure Tide later by running:
```fish
tide configure
```

### Additional Fisher Plugins (Recommended)
Install these useful plugins to enhance your Fish shell experience:

```fish
# z for directory jumping
fisher install jethrokuan/z

# Fish integration for fzf
fisher install PatrickF1/fzf.fish

# Useful Fish functions and completions
fisher install jorgebucaran/nvm.fish
fisher install meaningful-ooo/sponge
```

### Verifying the Setup
After installation, restart your shell and verify that:
- Your prompt shows the Tide theme
- Git status is displayed in repositories
- Basic Fish features work (autocompletion, syntax highlighting)
- Installed plugins are working

You can list all installed plugins with:
```fish
fisher list
```

## Installing Homebrew

Homebrew is a package manager that will help us install and manage various development tools.

### Prerequisites
Before installing Homebrew, ensure you have the following:
- For WSL/Linux: build-essential, procps, curl, file, git
- For macOS: Command Line Tools for Xcode

### Installation Steps

#### For Linux/WSL:
```bash
# Install required packages (Ubuntu/Debian)
sudo apt update
sudo apt install build-essential procps curl file git

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH in Fish
# For WSL/Linux
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.config/fish/config.fish
```

#### For macOS:
```bash
# Install Xcode Command Line Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to your PATH in Fish (macOS)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.config/fish/config.fish
```

### Verify Installation
After installation, restart your terminal and verify Homebrew is working:

```bash
# Check Homebrew version
brew --version

# Check system for potential problems
brew doctor
```

### Update Homebrew
It's good practice to update Homebrew before installing packages:

```bash
brew update
```

If you see any issues with permissions in WSL, you might need to fix the ownership:
```bash
sudo chown -R $(whoami) /home/linuxbrew/.linuxbrew/*
```

## Installing Essential Packages with Homebrew

After setting up Homebrew, install these essential development tools and packages:

### Core Development Tools
```bash
# Install core development tools
brew install \
    ripgrep \        # Fast text search
    fzf \            # Fuzzy finder
    lazygit \        # Terminal UI for git
    ghq \            # Repository manager
    eza \            # Modern replacement for ls
    fd \             # Fast find alternative
    bat \            # Cat clone with syntax highlighting
    delta \          # Better git diff
    gh \             # GitHub CLI
    tmux \           # Terminal multiplexer
    neovim          # Modern vim editor
```

### Install fzf Shell Extensions
After installing fzf, you should install its shell extensions:
```bash
# Install fzf key bindings and fuzzy completion
$(brew --prefix)/opt/fzf/install
```

### Additional Language Support and Tools
```bash
# Install Node.js (if not already installed)
brew install node

# Install Python tools
brew install python pyenv

# Install Rust tools (optional)
brew install rust-analyzer
```

### Configuring the Installed Tools

#### Setup ghq for Repository Management
Add this to your Fish configuration (~/.config/fish/config.fish):
```fish
# Set GHQ_ROOT to your preferred location
set -x GHQ_ROOT ~/Development
```

#### Configure fzf with Fish
Add these settings to your Fish configuration:
```fish
# Set fzf to use ripgrep
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_DEFAULT_OPTS '--height 40% --layout=reverse --border'
```

#### Set up eza Aliases
Add these aliases to your Fish configuration:
```fish
# Modern ls aliases using eza
alias ls='eza'
alias ll='eza -l'
alias la='eza -la'
alias lt='eza --tree'
alias l='eza -l'
```

### Verify Installations
Check that all tools are properly installed:
```bash
# Verify core tools
ripgrep --version
fzf --version
lazygit --version
ghq --version
eza --version
fd --version
bat --version
delta --version
gh --version
tmux -V
nvim --version
```

### Updating Packages
Regularly update your Homebrew packages with:
```bash
brew update        # Update Homebrew itself
brew upgrade       # Upgrade all packages
brew cleanup       # Remove old versions
```

## Neovim Setup and Configuration

### Installing Neovim with Homebrew

The recommended way to install Neovim is through Homebrew, which provides the latest stable version:

```bash
# Install Neovim
brew install neovim

# Verify the installation
nvim --version
```

### Creating a Vim Symlink

For better compatibility with systems that might look for the standard `vim` command, create a symlink from Neovim to Vim:

```bash
# Create a symlink from nvim to vim
ln -s $(which nvim) /home/linuxbrew/.linuxbrew/bin/vim

# Verify the symlink works
vim --version  # Should show Neovim version information
```

### Clone and Setup Dotfiles

To use this Neovim configuration:

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Create symbolic links to the Neovim configuration:
   ```bash
   # First, backup existing configuration if needed
   mv ~/.config/nvim{,.bak} 2>/dev/null
   mv ~/.local/share/nvim{,.bak} 2>/dev/null
   mv ~/.local/state/nvim{,.bak} 2>/dev/null
   mv ~/.cache/nvim{,.bak} 2>/dev/null
   
   # Create symbolic links
   ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
   ```

### Setting Up LazyVim

This configuration uses LazyVim as the base Neovim configuration framework. When you first launch Neovim, LazyVim will automatically install:

1. Launch Neovim:
   ```bash
   nvim
   ```

2. LazyVim will automatically install itself and all configured plugins. Wait for this process to complete.

3. Install all configured packages:
   ```
   # Within Neovim, run:
   :Lazy sync
   ```

4. Install LSP servers and tools:
   ```
   # Within Neovim, run:
   :Mason
   # Use the interface to ensure all servers are installed
   ```

5. Verify health status:
   ```
   :checkhealth
   ```

### Essential Plugins and Configuration

This configuration includes the following essential plugins and configurations:

1. LSP Support:
   - TypeScript/JavaScript
   - ESLint 
   - Prettier for formatting
   - Rust analyzer
   - Tailwind CSS
   - JSON

2. Editor Enhancements:
   - GitHub Copilot integration
   - Telescope for fuzzy finding
   - Which-key for keybinding help
   - Neo-tree file explorer
   - Git integration

3. Custom Configuration Files:
   - `~/.config/nvim/lua/plugins/coding.lua` - Coding and completion plugins
   - `~/.config/nvim/lua/plugins/lsp.lua` - Language server configurations
   - `~/.config/nvim/lua/plugins/formatting.lua` - Code formatting settings

### Deployment Steps

To deploy this Neovim configuration to a new system:

1. Ensure prerequisites are installed:
   ```bash
   # Install Homebrew if not installed
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   
   # Install Neovim
   brew install neovim
   
   # Create vim symlink if desired
   ln -s $(which nvim) /home/linuxbrew/.linuxbrew/bin/vim
   
   # Install Node.js (required for many LSP servers)
   brew install node
   
   # Install global Node packages for LSP
   npm install -g typescript typescript-language-server prettier eslint
   ```

2. Clone the dotfiles repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   ```

3. Create symbolic links:
   ```bash
   ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
   ```

4. Launch Neovim and wait for automatic installation:
   ```bash
   nvim
   ```

5. Verify the installation:
   ```
   # Within Neovim:
   :checkhealth
   :Lazy sync
   :Mason
   ```

### Common Keybindings
LazyVim comes with many useful keybindings:
- `<Space>` is the leader key
- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>e` - File explorer
- `gcc` - Comment line
- `gd` - Go to definition
- `K` - Show hover documentation
- `<leader>ca` - Code actions
- `<leader>cf` - Format document

For a complete list of keybindings:
```
:help lazyvim-keymaps
```

## Additional Neovim Configuration Details

### Plugin-Specific Settings and Keybindings

#### Telescope (Fuzzy Finder)
Additional useful Telescope commands:
- `<leader>ff` - Find files in current directory
- `<leader>fg` - Live grep in current directory
- `<leader>fb` - Browse buffers
- `<leader>fh` - Search help tags
- `<leader>fs` - Search git status
- `<leader>fc` - Search command history

#### Neo-tree File Explorer
- `<leader>e` - Toggle file explorer
- `<leader>o` - Focus file explorer
- In the explorer:
  - `a` - Add new file/directory
  - `d` - Delete file/directory
  - `r` - Rename file/directory
  - `y` - Copy file name
  - `Y` - Copy relative path
  - `gy` - Copy absolute path

#### LSP Features
- Code Navigation:
  - `gd` - Go to definition
  - `gr` - Go to references
  - `gI` - Go to implementation
  - `gy` - Go to type definition
- Code Understanding:
  - `K` - Hover documentation
  - `<leader>cl` - Code lens
- Code Actions:
  - `<leader>ca` - Code actions
  - `<leader>cr` - Rename symbol
  - `<leader>cf` - Format document
  - `<leader>cF` - Format selection

#### Git Integration (LazyGit)
- `<leader>gg` - Open LazyGit
- `<leader>gj` - Next hunk
- `<leader>gk` - Previous hunk
- `<leader>gs` - Stage hunk
- `<leader>gu` - Undo stage hunk
- `<leader>gp` - Preview hunk

### Custom Configuration Tips

#### Customizing Theme
Add to `~/.config/nvim/lua/plugins/colorscheme.lua`:
```lua
return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
```

#### Persistent Editor Settings
Add to `~/.config/nvim/lua/config/options.lua`:
```lua
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Window splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
```

#### Additional Key Mappings
Add to `~/.config/nvim/lua/config/keymaps.lua`:
```lua
-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Buffer navigation
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
```

### Debugging Setup

If you encounter any issues:

1. Check plugin health:
```
:checkhealth
```

2. Update all plugins:
```
:Lazy update
```

3. Sync plugin installations:
```
:Lazy sync
```

4. Install/Update LSP servers:
```
:Mason
```

5. Check LSP status:
```
:LspInfo
```

## Additional Tools Usage Guide

### fzf (Fuzzy Finder)
fzf provides powerful fuzzy finding capabilities across your system:

#### Common Use Cases
```fish
# Search command history
<Ctrl-R>

# Directory navigation (requires fzf.fish plugin)
<Alt-C>

# File navigation
<Ctrl-T>

# Find and cd into subdirectories
fd

# Search for files and preview content
fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
```

#### Custom fzf Functions
Add to your Fish configuration (`~/.config/fish/functions/`):
```fish
# Search and edit file
function fe
    set file (fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if test -n "$file"
        nvim $file
    end
end

# Search git branches
function fbr
    git branch | fzf --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" {1}' | sed 's/^..//' | xargs git checkout
end
```

### ghq (Repository Manager)
ghq helps manage your Git repositories in a consistent way:

```fish
# Clone a repository
ghq get username/repository

# List local repositories
ghq list

# Change to a repository directory
cd (ghq list | fzf)

# Open repository in browser
ghq browse username/repository
```

#### Custom ghq Functions
Add to your Fish configuration:
```fish
# Quick repository access
function repo
    cd (ghq root)/(ghq list | fzf)
end
```

### eza (Modern ls Replacement)
eza provides enhanced file listing capabilities:

```fish
# List files with git status
eza --git --long

# Show directory tree
eza --tree --level=2

# List files by modification time
eza --long --sort=modified

# Show file permissions and ownership
eza --long --group

# Color output by file type
eza --long --color-scale
```

### z for Fish (Directory Jumping)
z learns your most frequently used directories:

```fish
# Jump to most frecent directory matching 'work'
z work

# List all directories in z database
z -l

# Jump to most frecent directory matching multiple terms
z development src

# Add current directory to z database
z --add $PWD
```

### Integrating Tools Together
Example of combining multiple tools:

```fish
# Find repository and open in Neovim
function dev
    set repo (ghq list | fzf)
    if test -n "$repo"
        cd (ghq root)/$repo
        nvim
    end
end

# Search files in repository and open in Neovim
function pf
    set file (rg --files | fzf --preview 'bat --style=numbers --color=always --line-range :500 {}')
    if test -n "$file"
        nvim $file
    end
end
```

### Maintenance Tips
Regular maintenance helps keep your tools running smoothly:

```fish
# Update Homebrew and all packages
brew update && brew upgrade

# Clean up old versions
brew cleanup

# Update Fisher plugins
fisher update

# Clean z database
z --clean
```

## System-Specific Configurations

### Windows with WSL Setup

#### WSL Installation and Setup
1. Enable WSL in Windows:
```powershell
# Run in PowerShell as Administrator
wsl --install
```

2. Install Ubuntu from Microsoft Store or command line:
```powershell
wsl --install -d Ubuntu
```

3. Configure WSL memory and CPU usage in `%UserProfile%\.wslconfig`:
```ini
[wsl2]
memory=8GB
processors=4
```

#### Terminal Integration
1. Install Windows Terminal from Microsoft Store
2. Configure Windows Terminal settings:
```jsonc
{
    "profiles": {
        "defaults": {
            "font": {
                "face": "CaskaydiaCove Nerd Font",
                "size": 11
            },
            "opacity": 85,
            "useAcrylic": true
        }
    }
}
```

#### Path Integration
Add to your Fish configuration (`~/.config/fish/config.fish`):
```fish
# Windows Path Integration
if test -d /mnt/c/Windows
    # Add Windows Path if needed
    set -gx PATH $PATH /mnt/c/Windows/System32 /mnt/c/Windows
    
    # Set BROWSER to Windows default
    set -gx BROWSER "wslview"
end
```

#### Git Configuration
```bash
# Configure Git to handle line endings
git config --global core.autocrlf input

# Use Windows Credential Manager
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
```

### macOS Setup

#### Command Line Tools
```bash
# Install Xcode Command Line Tools
xcode-select --install
```

#### Terminal Configuration
1. Install iTerm2
2. Configure iTerm2 profile to use:
   - Font: Any Nerd Font
   - Enable shell integration
   - Configure hotkey window

### Linux Setup

#### Dependencies
For Ubuntu/Debian:
```bash
sudo apt update
sudo apt install -y \
    build-essential \
    pkg-config \
    libssl-dev
```

For Fedora:
```bash
sudo dnf groupinstall "Development Tools"
sudo dnf install openssl-devel
```

### Cross-Platform Considerations

#### Environment Variables
Add to your Fish configuration based on OS:
```fish
# OS-specific configurations
switch (uname)
    case Darwin
        set -gx HOMEBREW_PREFIX "/opt/homebrew"
    case Linux
        if test -d /home/linuxbrew/.linuxbrew
            set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew"
        end
end

# Add Homebrew to PATH
if test -n "$HOMEBREW_PREFIX"
    fish_add_path "$HOMEBREW_PREFIX/bin"
    fish_add_path "$HOMEBREW_PREFIX/sbin"
end
```

#### Shell Integration
```fish
# Terminal integration
if test -e {$HOME}/.iterm2_shell_integration.fish
    source {$HOME}/.iterm2_shell_integration.fish
end
```

#### Common Issues and Solutions

1. **WSL File Permissions**:
```bash
# Fix permissions in WSL
sudo chmod -R 755 /home/username/.config
```

2. **Homebrew Permissions**:
```bash
# Fix Homebrew permissions
sudo chown -R $(whoami) $(brew --prefix)/*
```

3. **Git Line Endings**:
```bash
# Windows/WSL
git config --global core.autocrlf input

# macOS/Linux
git config --global core.autocrlf input
```

4. **Font Issues**:
- Install Nerd Fonts
- Configure terminal to use the installed font
- Verify font rendering in Neovim

5. **PATH Issues**:
```fish
# Print current PATH for debugging
echo $PATH | tr ' ' '\n'

# Reload Fish configuration
source ~/.config/fish/config.fish
```

## Maintenance & Updates

Regular maintenance ensures your development environment remains secure and efficient.

### Updating Core Components

#### System Updates (WSL/Ubuntu)
```bash
# Update package list and upgrade packages
sudo apt update && sudo apt upgrade

# Remove unnecessary packages
sudo apt autoremove
```

#### Fish Shell and Plugins
```fish
# Update Fisher
fisher update

# Update Tide theme
fisher update IlanCosman/tide

# List all installed plugins
fisher list
```

#### Homebrew and Packages
```bash
# Update Homebrew itself
brew update

# Upgrade all packages
brew upgrade

# Remove old versions
brew cleanup

# Check for issues
brew doctor
```

#### Neovim and Plugins
```bash
# Update Neovim (via Homebrew)
brew upgrade neovim

# In Neovim:
:Lazy update  # Update all plugins
:Mason       # Update LSP servers
```

### Automated Updates

#### Create Update Script
Create `~/.config/fish/functions/update-all.fish`:
```fish
function update-all
    # Update system packages
    echo "Updating system packages..."
    sudo apt update
    and sudo apt upgrade -y
    and sudo apt autoremove -y

    # Update Homebrew
    echo "Updating Homebrew..."
    brew update
    and brew upgrade
    and brew cleanup

    # Update Fisher plugins
    echo "Updating Fisher plugins..."
    fisher update

    # Update Neovim plugins (headless)
    echo "Updating Neovim plugins..."
    nvim --headless "+Lazy! sync" "+qa"

    # Update Node.js packages
    echo "Updating global Node.js packages..."
    npm update -g

    echo "All updates completed!"
end
```

### Regular Maintenance Checklist

#### Weekly Tasks
- [ ] Run system updates
- [ ] Update Homebrew packages
- [ ] Update Fisher plugins
- [ ] Update Neovim plugins
- [ ] Clean up unused packages

#### Monthly Tasks
- [ ] Review installed packages (`brew list`)
- [ ] Check Neovim health (`:checkhealth`)
- [ ] Update global Node.js packages
- [ ] Clean up old files and configs

#### Quarterly Tasks
- [ ] Review and update Git configurations
- [ ] Check for major version updates
- [ ] Backup important configurations
- [ ] Clean up unused repositories

### Backup Important Configurations

Create a backup script `~/.config/fish/functions/backup-configs.fish`:
```fish
function backup-configs
    set backup_dir ~/config-backup/(date +%Y%m%d)
    mkdir -p $backup_dir

    # Backup Fish configurations
    cp -r ~/.config/fish $backup_dir/
    
    # Backup Neovim configurations
    cp -r ~/.config/nvim $backup_dir/
    
    # Backup Git configurations
    cp ~/.gitconfig $backup_dir/
    
    # Backup WSL configurations (if exists)
    if test -f /mnt/c/Users/$USER/.wslconfig
        cp /mnt/c/Users/$USER/.wslconfig $backup_dir/
    end

    echo "Configurations backed up to $backup_dir"
end
```

### Version Management

Keep track of core tool versions:
```fish
function versions
    echo "Fish: "(fish --version)
    echo "Neovim: "(nvim --version | head -n1)
    echo "Node: "(node --version)
    echo "npm: "(npm --version)
    echo "Git: "(git --version)
    echo "Homebrew: "(brew --version | head -n1)
end
```
