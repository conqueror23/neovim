return {
  formatters = {
    black = {
      command = "black",
      args = { "--quiet", "-" },
    },
    isort = {
      command = "isort",
      args = { "--stdout", "--profile", "black", "-" },
    },
  },
  linters = {
    flake8 = {
      command = "flake8",
      args = { "--stdin-display-name", "%:p", "-" },
    },
  },
}
