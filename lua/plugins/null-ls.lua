---@type LazySpec
return {
  "jose-elias-alvarez/null-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require "null-ls"
    local builtins = null_ls.builtins

    null_ls.setup {
      sources = {
        builtins.diagnostics.eslint_d.with {
          command = "eslint_d",
          args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
        },
        builtins.formatting.eslint_d.with {
          command = "eslint_d",
          args = { "--fix", "--stdin", "--stdin-filename", "$FILENAME" },
        },
      },
    }
  end,
}
