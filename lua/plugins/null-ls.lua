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
      -- Lua formatting
      null_ls.builtins.formatting.stylua,
      -- JavaScript/TypeScript/Vue formatting with Prettier
      null_ls.builtins.formatting.prettier.with({
        filetypes = { "javascript", "typescript", "vue", "css", "scss", "html", "json", "yaml", "markdown" },
      }),
      -- Use prettierd for faster formatting if available
      null_ls.builtins.formatting.prettierd.with({
        filetypes = { "javascript", "typescript", "vue", "css", "scss", "html", "json", "yaml", "markdown" },
      }),
    })
  end,
}
