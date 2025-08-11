# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is an AstroNvim v4+ configuration repository - a feature-rich Neovim distribution built on top of the Lazy.nvim plugin manager. The configuration is structured as a template that can be customized for personal use.

## Key Commands

### Package Management
- `nvim` - Start Neovim and automatically install plugins via Lazy.nvim
- `:Lazy` - Open Lazy.nvim plugin manager interface
- `:Lazy update` - Update all plugins
- `:Lazy sync` - Synchronize plugins (install missing, update existing)

### LSP and Development Tools
- `:LspInstall <server>` - Install language server via Mason
- `:MasonInstall <tool>` - Install formatter/linter/debugger via Mason
- `:Mason` - Open Mason package manager interface
- No explicit build/test commands - this is a Neovim configuration, not a development project

## Architecture and Structure

### Core Configuration Files
- `init.lua` - Bootstrap file that loads Lazy.nvim and calls other modules
- `lua/lazy_setup.lua` - Main Lazy.nvim configuration and plugin specifications
- `lua/community.lua` - AstroCommunity pack imports (Lua, Rust, TypeScript, Catppuccin theme)
- `lua/polish.lua` - Custom filetypes and final configuration tweaks

### Plugin Configuration Structure
All custom plugin configurations are in `lua/plugins/` with each file containing a LazySpec table:

- **Core AstroNvim plugins**: `astrocore.lua`, `astrolsp.lua`, `astroui.lua` - Core functionality, LSP setup, and UI configuration
- **AI Assistants**: `avante.lua` (Ollama-based), `codecompanion.lua` (MCP integration)
- **Development Tools**: `mason.lua` (package management), `telescope.lua` (fuzzy finder), `neotest.lua` (testing framework)
- **Language Support**: `treesitter.lua`, `nvim-cmp.lua` (completion), `null-ls.lua` (formatters/linters)
- **User Customizations**: `user.lua` (Discord presence, custom ASCII art, autopairs, completion sources)

### Configuration Patterns
- Each plugin file exports a LazySpec table with plugin name and opts
- Settings are configured through the `opts` table which gets passed to the plugin's setup function
- Keymaps are defined in the `mappings` section of relevant plugins (especially astrocore.lua)
- LSP servers are managed through astrolsp.lua and mason.lua

### Key Features
- **Multi-AI Integration**: Both Avante.nvim (custom Ollama endpoint) and CodeCompanion.nvim (MCP protocol)
- **Language Support**: Pre-configured for Lua, Rust, TypeScript/JavaScript with automatic tooling installation
- **Custom UI**: Personalized startup screen with ASCII art, Catppuccin theme, custom icons
- **Development Workflow**: Integrated testing (neotest), debugging (nvim-dap), and formatting/linting (null-ls)

### Lazy.nvim Plugin Loading
Plugins are loaded in this order:
1. AstroNvim core (`astronvim.plugins`)
2. Community packs (`community.lua`)
3. User plugins (`plugins/` directory)

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

### Vue.js Development Commands
```bash
<leader>lv   # Vue source actions (organize imports, remove unused, etc.)
<leader>lf   # Auto-fix Vue errors and warnings
<leader>li   # Auto-import Vue components
<leader>la   # Show all available code actions (standard LSP)
```

## Language Support

### Configured Languages
- **Python**: Full LSP support with Pyright, debugging with nvim-dap
- **JavaScript/TypeScript**: ESLint integration, Vue.js support
- **Vue.js**: Modern Volar LSP with error diagnostics, auto-fixing, code actions, and formatting
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
