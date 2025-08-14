return {
  "vimwiki/vimwiki",
  event = "BufEnter *.md",
  cmd = { "VimwikiIndex", "VimwikiTabIndex", "VimwikiUISelect" },
  keys = { "<leader>ww", "<leader>wi" },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = vim.fn.expand "~/vimwiki/",
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_global_ext = 0
  end,
  config = function()
    vim.g.vimwiki_key_mappings = {
      all_maps = 1,
      global = 1,
      headers = 1,
      text_objs = 1,
      table_format = 1,
      table_mappings = 1,
      lists = 1,
      links = 1,
      html = 1,
      mouse = 0,
    }
  end,
}