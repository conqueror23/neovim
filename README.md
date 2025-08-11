# Personal AstroNvim Configuration

**NOTE:** This is for AstroNvim v4+

A customized [AstroNvim](https://github.com/AstroNvim/AstroNvim) configuration optimized for data science, Python development, and AI-assisted coding.

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

## ✨ Features

### 🤖 AI Integration
- **Avante.nvim**: AI coding assistant with Ollama backend support
- **CodeCompanion.nvim**: MCP protocol integration for advanced AI interactions
- Multiple AI provider support (Bedrock, Gemini, local Ollama)

### 🚀 Development Tools
- **LSP Support**: Pre-configured for Python (Pyright), TypeScript, Rust, and Lua
- **Testing Framework**: Neotest integration with Python test support
- **Debugging**: nvim-dap configured for Python development
- **REST Client**: HTTP request testing with rest.nvim

### 🎨 User Experience
- **Reduced Notification Timeout**: Notifications disappear after 1.5 seconds instead of 5 seconds
- **Fixed Search Bar**: No more blinking when typing "/" for search
- **Catppuccin Theme**: Beautiful, consistent color scheme
- **Custom UI**: Personalized startup screen with ASCII art

### 📊 Data Science Workflow
- **Jupyter Integration**: Molten for notebook-style development
- **Cell Execution**: Support for `# %%` style cells
- **REPL Support**: Iron integration for interactive development
- **Database Tools**: vim-dadbod for SQL interactions
- **Databricks**: Custom integration for remote cluster execution

### 🛠️ Language Support
- **Python**: Full LSP, debugging, virtual environment detection
- **TypeScript/JavaScript**: ESLint integration, Vue.js support
- **Rust**: Complete toolchain support
- **Lua**: Optimized for Neovim configuration development

## 🔧 Key Commands

### Plugin Management
- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Mason` - Open LSP/tool installer

### Python Development
- `<leader>rf` - Run current Python file
- `<leader>rc` - Execute current cell
- `<leader>db` - Toggle breakpoint

### AI Assistance
- `<C-,>` - Toggle Claude Code terminal
- Available through Avante and CodeCompanion integrations

### Jupyter/Molten
- `<leader>mi` - Initialize Molten
- `<leader>ml` - Evaluate line
- `<leader>mr` - Re-evaluate cell

## 📁 Configuration Structure

```
lua/
├── community.lua           # AstroCommunity pack imports
├── lazy_setup.lua         # Main Lazy.nvim configuration
├── polish.lua             # Final configuration tweaks
├── plugins/               # Plugin configurations
│   ├── astrocore.lua     # Core AstroNvim settings
│   ├── astrolsp.lua      # LSP configuration
│   ├── avante.lua        # AI coding assistant
│   ├── notify.lua        # Notification settings
│   └── ...               # Other plugin configs
└── user/                  # User-specific settings
    ├── init.lua          # Main user configuration
    ├── mappings.lua      # Custom key mappings
    └── lsp/              # LSP server configurations
```

## 🎯 Specialized Features

- **Python Path Detection**: Automatically uses virtual environments or Homebrew Python
- **Notification Optimization**: Shortened display time for better UX
- **Search Enhancement**: Fixed cursor blinking issues in search mode
- **Keymap Organization**: Conflict-free key mappings with logical prefixes
- **Terminal Integration**: Optimized for kitty terminal with image support

For detailed configuration guidance, see [CLAUDE.md](CLAUDE.md).
