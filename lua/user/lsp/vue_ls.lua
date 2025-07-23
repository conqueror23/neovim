-- ~/.config/astrovim/config/lua/user/lsp/vue_ls.lua
local lspconfig = require "lspconfig"

lspconfig["vuels"].setup {
  filetypes = { "typescript", "javascript", "vue" },
  settings = {
    format = true,
    formatter = {
      command = "prettier_d",
      args = { "--stdin-filepath", "%filename" },
    },
  },
}
