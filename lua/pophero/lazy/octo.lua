return {
  "pwntester/octo.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = { "Octo" },
  keys = {
    { "<leader>gp", "<cmd>Octo pr list<cr>",    desc = "List PRs" },
    { "<leader>gr", "<cmd>Octo review start<cr>", desc = "Start PR review" },
  },
  config = function()
    require("octo").setup({
      github_hostname = "",
      use_local_fs = false,
      gh_env = function()
        return { GITHUB_TOKEN = os.getenv("GITHUB_TOKEN") }
      end,
    })
  end,
}
