-- Modern Vue.js LSP configuration using Volar
return {
  volar = {
    filetypes = { "vue", "typescript", "javascript" },
    init_options = {
      typescript = {
        tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib"
      },
      vue = {
        hybridMode = false,
      },
    },
    settings = {
      vue = {
        hybridMode = false,
        complete = {
          casing = {
            tags = "kebab",
            props = "camel"
          }
        },
        updateImportsOnFileMove = {
          enabled = true
        },
        codeActions = {
          enabled = true
        }
      },
      typescript = {
        preferences = {
          includePackageJsonAutoImports = "auto",
          generateReturnInDocTemplate = true,
        },
        suggest = {
          includeCompletionsForModuleExports = true,
          includeAutomaticOptionalChainCompletions = true,
        },
        inlayHints = {
          enumMemberValues = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          parameterTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          variableTypes = { enabled = true },
        },
      },
    },
    on_attach = function(client, bufnr)
      -- Enable code actions and formatting
      if client.supports_method("textDocument/codeAction") then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", { silent = true, desc = "Code actions" })
      end
      
      -- Enable auto-fix on save for Vue files
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
          desc = "Format Vue file on save"
        })
      end
    end,
  },
}
