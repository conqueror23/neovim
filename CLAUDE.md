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

### File Organization
- Configuration files use Lua with type annotations (`---@type LazySpec`)
- Plugin specifications follow Lazy.nvim format with dependencies automatically handled
- Settings are organized by functionality rather than by plugin to maintain clarity