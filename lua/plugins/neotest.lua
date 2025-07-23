return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "haydenmeade/neotest-jest",
  },
  config = function()
    require("neotest").setup {
      log_level = 2,
      adapters = {
        require "neotest-jest" {
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function(path)
            -- return vim.fn.getcwd()
            return vim.fn.fnamemodify(path, ":h")
          end,
        },
      },
    }

    --hotkey
    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    -- Keybindings for Neotest
    map("n", "<Leader>jt", '<cmd>lua require("neotest").run.run()<CR>', opts)
    map("n", "<Leader>jf", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
    map("n", "<Leader>jl", '<cmd>lua require("neotest").run.run_last()<CR>', opts)
    map("n", "<Leader>js", '<cmd>lua require("neotest").summary.toggle()<CR>', opts)
    map("n", "<Leader>jo", '<cmd>lua require("neotest").output_panel.toggle()<CR>', opts)
    map("n", "<Leader>jp", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)

    --set markets
    vim.cmd [[
      highlight NeotestPassed guifg=#00FF00
      highlight NeotestFailed guifg=#FF0000
      highlight NeotestSkipped guifg=#FFFF00
    ]]

    -- This ensures the correct symbols are used
    vim.fn.sign_define("neotest_passed", { text = "✔", texthl = "NeotestPassed" })
    vim.fn.sign_define("neotest_failed", { text = "✖", texthl = "NeotestFailed" })
    vim.fn.sign_define("neotest_skipped", { text = "", texthl = "NeotestSkipped" })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tw",
      "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
      {}
    )
  end,
}
