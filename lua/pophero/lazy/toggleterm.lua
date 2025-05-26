return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    open_mapping = [[<C-\>]],
    direction = "vertical", -- options: "horizontal", "vertical", "float"
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    persist_size = true,
    size = 80
  },
  keys = {
    { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Optional: custom keybind to close terminal with <Esc><Esc>
    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n><C-w>w', { desc = "Switch terminal to next window" })
  end,
}
