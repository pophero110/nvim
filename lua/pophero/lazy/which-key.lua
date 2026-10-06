return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    plugins = {
      marks = false,
      registers = false,
      spelling = {
        enabled = true,
        suggestions = 20
      },
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = false,
        nav = false,
        z = false,
        g = false,
      },
    },
    replace = {},
    keys = {
      scroll_down = "<c-d>",
      scroll_up = "<c-u>",
    },
    win = {
      border = "single",
      padding = { 2, 2 },
      wo = { winblend = 0 },
    },
    layout = {
      width = { min = 20, max = 50 },
      spacing = 3,
    },
    show_help = true,
    show_keys = true,
    disable = {
      bt = {},
      ft = { "TelescopePrompt" },
    },
  }
}
