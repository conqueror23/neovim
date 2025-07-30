
return {
  n = {
    -- Python execution with databricks-connect support
    ["<leader>rf"] = { 
      function()
        local file = vim.fn.expand("%:p")
        local ext = vim.fn.expand("%:e")
        
        if ext == "py" then
          -- For .py files, run with python directly
          vim.cmd("w")
          vim.cmd("!python3 " .. file)
        elseif ext == "ipynb" then
          -- For .ipynb files, convert and run through jupytext
          vim.cmd("w")
          vim.cmd("!jupytext --execute " .. file)
        end
      end, 
      desc = "Run Python/Notebook file" 
    },
    
    -- Databricks-connect specific execution
    ["<leader>rdf"] = { 
      function()
        local file = vim.fn.expand("%:p")
        vim.cmd("w")
        -- Run with databricks-connect environment
        vim.cmd("!DATABRICKS_CONNECT_CLUSTER_ID=" .. (vim.g.databricks_cluster_id or "") .. " python3 " .. file)
      end, 
      desc = "Run with Databricks Connect" 
    },
    
    -- Execute cell in current file (for # %% cells)
    ["<leader>rc"] = {
      function()
        -- Find current cell boundaries
        local current_line = vim.fn.line(".")
        local cell_start = vim.fn.search("^\\s*# %%", "bnW") or 1
        local cell_end = vim.fn.search("^\\s*# %%", "nW") or vim.fn.line("$")
        
        if cell_end > current_line then
          cell_end = cell_end - 1
        else
          cell_end = vim.fn.line("$")
        end
        
        -- Get cell content
        local lines = vim.fn.getline(cell_start, cell_end)
        
        -- Filter out cell markers
        local filtered_lines = {}
        for _, line in ipairs(lines) do
          if not string.match(line, "^%s*# %%") then
            table.insert(filtered_lines, line)
          end
        end
        
        -- Send to Iron REPL
        require("iron.core").send(nil, filtered_lines)
      end,
      desc = "Execute current cell"
    },
    
    -- Debug mappings
    ["<leader>db"] = { ":lua require'dap'.toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
    ["<F5>"] = { ":lua require'dap'.continue()<CR>", desc = "Start Debugging" },
    ["<F10>"] = { ":lua require'dap'.step_over()<CR>", desc = "Step Over" },
    ["<F11>"] = { ":lua require'dap'.step_into()<CR>", desc = "Step Into" },
    ["<F12>"] = { ":lua require'dap'.step_out()<CR>", desc = "Step Out" },
  },
}
