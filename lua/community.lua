-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.recipes.neovide" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.completion.copilot-lua" },
}

