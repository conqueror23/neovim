-- Import Vue.js LSP configuration
local vue_config = require("user.lsp.vue_ls")

return vim.tbl_deep_extend("force", {
  pyright = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
        },
      },
    },
    on_init = function(client)
      -- Automatically detect and use the virtual environment
      local venv_path = os.getenv("VIRTUAL_ENV")
      if venv_path then
        client.config.settings.python.pythonPath = venv_path .. "/bin/python"
      else
        client.config.settings.python.pythonPath = "/opt/homebrew/bin/python3"
      end
    end,
  },
  ts_ls = {
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        },
      },
    },
  },
}, vue_config)

