# Dotfiles

This repository contains my personal dotfiles for setting up and maintaining my development environment.

## Overview

These dotfiles include configurations for:
- Fish shell
- Neovim
- Development tools
- Other system configurations

## Directory Structure

```
.
├── fish/       # Fish shell configuration
├── nvim/       # Neovim configuration
├── git/        # Git configuration
└── scripts/    # Utility scripts
```

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. Create symbolic links:
   ```bash
   # For Fish shell configuration
   ln -s ~/.dotfiles/fish ~/.config/fish

   # For Neovim configuration
   ln -s ~/.dotfiles/nvim ~/.config/nvim

   # For Git configuration
   ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
   ```

Note: Before creating symlinks, make sure to backup your existing configurations.

## Components

### Fish Shell Configuration
- Custom functions and aliases
- Environment variables
- Path configurations
- Shell prompt customization

### Neovim Setup
- LazyVim configuration
- Custom plugins including:
  - ESLint integration
  - Prettier formatting
  - TypeScript support
  - Rust support
  - Tailwind CSS support
  - GitHub Copilot
  - Additional utility plugins

### Development Tools
- Git configuration
- Node.js tools
- Development environment setup

## Maintenance and Updates

To update the configurations:

1. Pull the latest changes:
   ```bash
   cd ~/.dotfiles
   git pull
   ```

2. If there are new configuration files, create their symbolic links as shown in the Installation section.

3. Reload your shell or restart your editor to apply any new changes:
   ```bash
   # For Fish shell
   source ~/.config/fish/config.fish

   # For Neovim, restart or run
   :source $MYVIMRC
   ```

## Contributing

Feel free to submit issues and enhancement requests.

## License

[MIT License](LICENSE)

# Dotfiles\n\nPersonal configuration files for development environment.
