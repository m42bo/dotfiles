# Dotfiles

This repository contains my personal dotfiles for managing my development environment. It includes configurations for Fish shell, Neovim (with LazyVim), and various development tools.

## Prerequisites

Before you begin, ensure you have the following installed:
- Git
- Fish shell
- Node.js and npm
- Neovim (latest version)
- Rust (for some development tools)

## Installation Guide

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

### 2. Install Required Packages

#### On Ubuntu/Debian:
```bash
# Update package list
sudo apt update

# Install essential tools
sudo apt install -y \
    fish \
    neovim \
    curl \
    wget \
    git \
    build-essential \
    unzip

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

#### On macOS:
```bash
# Install Homebrew if not installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required packages
brew install fish neovim node rust git
```

### 3. Set Up Fish Shell

1. Set Fish as your default shell:
   ```bash
   # Add Fish to available shells
   echo $(which fish) | sudo tee -a /etc/shells
   
   # Set as default shell
   chsh -s $(which fish)
   ```

2. Create Fish configuration directory:
   ```bash
   mkdir -p ~/.config/fish
   ```

3. Link Fish configuration:
   ```bash
   ln -sf ~/.dotfiles/fish/* ~/.config/fish/
   ```

### 4. Set Up Neovim

1. Create Neovim configuration directory:
   ```bash
   mkdir -p ~/.config/nvim
   ```

2. Link Neovim configuration:
   ```bash
   ln -sf ~/.dotfiles/nvim/* ~/.config/nvim/
   ```

3. Install LazyVim and plugins:
   - Launch Neovim: `nvim`
   - Wait for LazyVim to install automatically
   - Install all plugins by running `:Lazy sync`

### 5. Development Tools Setup

1. Configure Git:
   ```bash
   ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
   ```

2. Install global Node.js packages:
   ```bash
   npm install -g \
       typescript \
       eslint \
       prettier \
       @tailwindcss/language-server
   ```

3. Install Rust tools:
   ```bash
   rustup update
   rustup component add rust-analyzer
   ```

### 6. Final Steps

1. Reload Fish configuration:
   ```bash
   source ~/.config/fish/config.fish
   ```

2. Verify installations:
   ```bash
   # Check Fish shell
   fish --version
   
   # Check Neovim
   nvim --version
   
   # Check Node.js
   node --version
   npm --version
   
   # Check Rust
   rustc --version
   ```

## Directory Structure

```
.
├── fish/                  # Fish shell configuration
│   ├── config.fish        # Main Fish configuration
│   ├── functions/         # Custom Fish functions
│   └── conf.d/           # Auto-loaded Fish configs
├── nvim/                  # Neovim configuration
│   ├── init.lua          # Main Neovim configuration
│   └── lua/              # Lua configurations
├── git/                   # Git configuration
│   └── .gitconfig        # Global Git config
└── scripts/              # Utility scripts
```

## Customization

### Fish Shell
- Custom functions are in `~/.config/fish/functions/`
- Environment variables are set in `~/.config/fish/conf.d/`
- Aliases and key bindings in `~/.config/fish/config.fish`

### Neovim
- LazyVim configuration in `~/.config/nvim/`
- Custom plugins include:
  - ESLint for linting
  - Prettier for formatting
  - TypeScript support
  - Rust support
  - Tailwind CSS support
  - GitHub Copilot
  - Additional utility plugins

## Updating

To update your configurations:

1. Pull the latest changes:
   ```bash
   cd ~/.dotfiles
   git pull
   ```

2. Update tools and plugins:
   ```bash
   # Update Node.js packages
   npm update -g

   # Update Rust
   rustup update

   # Update Neovim plugins
   nvim --headless "+Lazy sync" +qa
   ```

## Troubleshooting

### Common Issues

1. **Fish shell not found in /etc/shells**
   ```bash
   echo $(which fish) | sudo tee -a /etc/shells
   ```

2. **Neovim plugins not installing**
   ```bash
   rm -rf ~/.local/share/nvim
   rm -rf ~/.config/nvim/lazy-lock.json
   nvim # Reinstall everything
   ```

3. **Git configuration conflicts**
   ```bash
   # Backup existing config
   mv ~/.gitconfig ~/.gitconfig.backup
   # Link new config
   ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
   ```

## Contributing

Feel free to submit issues and enhancement requests.

## License

[MIT License](LICENSE)
