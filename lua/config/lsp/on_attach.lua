-- ~/.config/nvim/lua/config/lsp/on_attach.lua (or similar)

local function formatting_only_null_ls(client)
  if client.name ~= "null-ls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

return function(client, bufnr)
  formatting_only_null_ls(client)

  vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, { buffer = bufnr })

  vim.api.nvim_create_autocmd("BufWritePre", {
    buffer = bufnr,
    callback = function() vim.lsp.buf.format { async = false } end,
  })
end
