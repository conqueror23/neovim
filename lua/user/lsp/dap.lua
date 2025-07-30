local dap = require("dap")

dap.adapters.python = {
  type = "executable",
  command = "python3",  -- Adjust to your Python path
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",  -- Launch the current file
    pythonPath = function()
      return "python3"  -- Adjust to your Python path
    end,
  },
}
