return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",                desc = "Diff unstaged changes" },
    { "<leader>gs", "<cmd>DiffviewOpen --staged<cr>",       desc = "Diff staged changes" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>",       desc = "File history" },
    { "<leader>gx", "<cmd>DiffviewClose<cr>",               desc = "Close diffview" },
  },
  config = function()
    require("diffview").setup()
  end,
}
