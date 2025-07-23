# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an AstroNvim v4+ configuration repository that extends the base AstroNvim framework with specialized plugins and configurations for data science, Python development, and AI-assisted coding.

## Architecture

### Core Structure
- **Base Framework**: AstroNvim v4 with Lazy.nvim plugin manager
- **Entry Point**: `init.lua` bootstraps Lazy.nvim and calls `lazy_setup.lua` and `polish.lua`
- **Plugin Organization**: 
  - `lua/lazy_setup.lua`: Main Lazy configuration importing AstroNvim, community plugins, and local plugins
  - `lua/community.lua`: AstroCommunity module imports (language packs, recipes, colorschemes)
  - `lua/plugins/`: Individual plugin configurations (50+ specialized plugins)
  - `lua/user/`: User-specific configurations including LSP, mappings, and initialization

### Key Configuration Files
- `lua/user/init.lua`: Main user configuration with colorscheme, options, mappings, and plugin settings
- `lua/user/lsp/servers.lua`: LSP server configurations (primarily Pyright for Python)
- `lua/user/mappings.lua`: Custom key mappings for Python execution and debugging
- `lua/plugins/astrolsp.lua`: LSP feature configuration with formatting settings
- `lua/plugins/treesitter.lua`: Syntax highlighting for multiple languages

## Development Environment

### Python Configuration
- **Python Path**: Uses Homebrew Python (`/opt/homebrew/bin/python3`)
- **Virtual Environment**: Pyright automatically detects and uses `VIRTUAL_ENV`
- **LSP**: Pyright configured for Python development with virtual environment support
- **Databricks Connect**: Configured for local execution against Databricks clusters

### Jupyter/Notebook Support
- **Jupytext**: Seamless .ipynb file editing as Python files with # %% cells
- **Molten**: Primary Jupyter notebook interface with image support via kitty terminal
- **Auto-conversion**: .ipynb files automatically converted to/from Python percent format
- **Cell Execution**: Support for # %% style cells compatible with Databricks notebooks
- **Image Backend**: Configured for kitty terminal with image.nvim integration

### File Format Support
- **.py files**: Standard Python files with # %% cell markers for notebook-style development
- **.ipynb files**: Jupyter notebooks auto-converted to Python format for editing
- **Databricks notebooks**: Full support for percent-style cell markers
- **Mixed workflows**: Seamless switching between .py and .ipynb formats

### AI Coding Assistants
- **Avante**: AI coding assistant with multiple provider support (Ollama, Bedrock, Gemini)
- **Claude Code**: Integrated Claude Code terminal interface with git root detection
- **Configuration**: Endpoints and models configured for external AI services

## Essential Commands

### Plugin Management
```bash
# Start Neovim (will install plugins on first run)
nvim

# Update plugins
:Lazy update

# Check plugin status
:Lazy
```

### Python Development
```bash
# Run current Python/Notebook file
<leader>rf   # Auto-detects .py or .ipynb and runs appropriately

# Databricks Connect execution
<leader>rdf  # Run current file with Databricks Connect environment

# Cell execution (for # %% style cells)
<leader>rc   # Execute current cell and send to Iron REPL

# Toggle debugging breakpoint
<leader>db

# Debug controls
F5    # Start debugging
F10   # Step over
F11   # Step into  
F12   # Step out
```

### Jupyter/Molten Commands
```bash
<leader>mi   # Initialize Molten
<leader>ml   # Molten evaluate line
<leader>mr   # Molten re-evaluate cell
<leader>mv   # Molten evaluate visual selection (visual mode)
<leader>md   # Molten delete cell
<leader>mh   # Molten hide output
<leader>ms   # Molten show output
<leader>me   # Molten evaluate operator
```

### Iron REPL Commands
```bash
<leader>itr  # Toggle REPL
<leader>isl  # Send line to REPL
<leader>isf  # Send file to REPL
<leader>if   # Focus REPL
<leader>ih   # Hide REPL
<leader>icl  # Clear REPL
```

### Claude Code Integration
```bash
<C-,>        # Toggle Claude Code terminal
<leader>cC   # Claude Code with continue flag
<leader>cV   # Claude Code with verbose flag
```

## Language Support

### Configured Languages
- **Python**: Full LSP support with Pyright, debugging with nvim-dap
- **JavaScript/TypeScript**: ESLint integration, Vue.js support
- **Vue.js**: Dedicated language pack and LSP configuration
- **Lua**: Built-in support for Neovim configuration
- **Markdown**: Enhanced with Quarto support for data science notebooks
- **CSV**: Specialized support via rainbow-csv plugin

### Treesitter Parsers
Automatically installs parsers for: lua, vim, python, markdown, javascript, typescript, css, vue, html, vimdoc, markdown_inline

## Notable Features

### Formatting and Linting
- **Disabled Auto-format**: Format on save disabled by default except for specific filetypes (ts, json, yaml)
- **ESLint**: Available via `<leader>le` for JavaScript/TypeScript files
- **Conform**: Additional formatting support configured

### Terminal and Shell Integration
- **Git Integration**: Automatically sets working directory to git root
- **Shell Commands**: Configured for bash/zsh with proper command separation
- **File Watching**: Automatic file refresh detection with notifications

### Data Science Workflow
- **Databricks**: Custom plugin for Databricks integration
- **Database**: vim-dadbod for SQL database interactions
- **Testing**: Neotest integration for Python testing workflows
- **Coverage**: nvim-coverage for test coverage visualization

### Coverage Commands
```bash
<leader>ccl  # Coverage load
<leader>ccs  # Coverage summary
<leader>cct  # Coverage toggle
```

### Databricks Commands (disabled by default)
```bash
<leader>du   # Upload to Databricks
<leader>dd   # Download from Databricks
<leader>dl   # List Databricks files
<leader>dcl  # Clear Databricks context
```

## Important Notes

- The configuration uses Catppuccin colorscheme by default
- Polish.lua is currently disabled (line 1 returns early)
- Python host program is set to use Homebrew Python (`/opt/homebrew/bin/python3`)
- Many specialized plugins for data science and AI development workflows
- Configuration optimized for terminal usage with kitty terminal emulator
- Keymap conflicts have been resolved with plugin-specific prefixes:
  - `<leader>m*` for Molten commands
  - `<leader>i*` for Iron REPL commands
  - `<leader>cc*` for Coverage commands
  - `<leader>d*` for Databricks commands