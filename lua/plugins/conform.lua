---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      vue = function()
        -- Check if ESLint config exists in the project
        local has_eslint = vim.fn.findfile(".eslintrc.js", ".;") ~= ""
          or vim.fn.findfile(".eslintrc.json", ".;") ~= ""
          or vim.fn.findfile(".eslintrc", ".;") ~= ""
          or vim.fn.findfile("eslint.config.js", ".;") ~= ""
          or vim.fn.findfile("eslint.config.mjs", ".;") ~= ""

        if has_eslint then
          -- Use ESLint for formatting if config exists
          return { "eslint_d" }
        else
          -- Fallback to Prettier
          return { "prettier" }
        end
      end,
      javascript = { "eslint_d", "prettier" },
      typescript = { "eslint_d", "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters = {
      eslint_d = {
        args = {
          "--fix-to-stdout",
          "--stdin",
          "--stdin-filename",
          "$FILENAME",
        },
      },
    },
  },
}