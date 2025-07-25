---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    "jay-babu/mason-null-ls.nvim",
  },
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = require("astrocore").list_insert_unique(opts.sources or {}, {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
    })
  end,
}
