return {
  "hrsh7th/cmp-nvim-lsp",
  opts = function()
    local nvim_lsp = require('lspconfig')
    nvim_lsp.tsserver.setup {
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
    }
  end
}
