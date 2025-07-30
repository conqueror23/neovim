-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = { "ts" },
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {
      -- TypeScript server is configured via AstroCommunity pack
    },
    -- customize language server configuration options passed to `lspconfig`
    ---@diagnostic disable: missing-fields
    config = {
      clangd = { capabilities = { offsetEncoding = "utf-8" } },
      ts_ls = {
        on_attach = function(client, bufnr)
          local ts_utils = require("nvim-lsp-ts-utils")

          ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            import_all_timeout = 5000, -- ms

            formatter = "prettier",
            formatter_args = { "--stdin-filepath", "$FILENAME" },
            update_imports_on_move = true,
            require_confirmation_on_move = true,
            watch_dir = nil,

            filter_out_diagnostics_by_code = { 80001 },

            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
          })

          ts_utils.setup_client(client)

          local opts = { silent = true }
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lo", ":TSLspOrganize<CR>", opts)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lR", ":TSLspRenameFile<CR>", opts)
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lA", ":TSLspImportAll<CR>", opts)
        end,
        filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
        cmd = { "typescript-language-server", "--stdio" }
      },
    },
    -- customize how language servers are attached
    handlers = {},
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client.supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens
          end,
        },
      },
    },
  },
}
