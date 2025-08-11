return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  version = false,
  opts = {
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://170.64.152.207:11445/",
        model = "kirito1/qwen3-coder:30b-a3b",
        timeout = 30000,
        api_key_name = "OLLAMA_API_KEY",
        extra_request_body = {
          temperature = 0,
          max_completion_tokens = 8192,
          --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
        },
      },
    },
    -- Enhanced RAG service configuration
    repo_map = {
      enabled = true,
      exclude_patterns = {
        "node_modules",
        ".git",
        "target",
        "build",
        "dist",
        "*.log",
        "*.tmp",
        "*.cache",
        "__pycache__",
        ".venv",
        "*.min.js",
        "*.min.css",
        "package-lock.json",
        "yarn.lock",
      },
      max_files = 1500,
      max_file_size = 150000,
      ignore_gitignore = true,
    },
    file_selector = {
      enabled = true,
      max_files = 15,
      provider = "telescope", -- or "fzf"
    },
    -- RAG hints and context
    hints = {
      enabled = true,
    },
    -- RAG-specific settings
    behaviour = {
      auto_suggestions = false,
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = false,
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
