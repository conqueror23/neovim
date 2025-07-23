---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require "null-ls"

    null_ls.setup {
      sources = {
        -- Use basic eslint sources without custom args for now
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.formatting.eslint,
      },
    }
  end,
}
