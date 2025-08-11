-- nvim-notify configuration for shorter notification display time
return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 1500, -- Display notifications for 1.5 seconds (default is 5000ms)
    stages = "fade_in_slide_out",
    render = "default",
    background_colour = "Normal",
    fps = 30,
    icons = {
      DEBUG = "",
      ERROR = "",
      INFO = "",
      TRACE = "✎",
      WARN = ""
    },
    level = 2,
    minimum_width = 50,
    top_down = true
  }
}