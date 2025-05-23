return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local function buffer_line_count()
      return " " .. vim.api.nvim_buf_line_count(0)
    end

    require("lualine").setup({
      theme = "tokyonight",
      sections = {
        lualine_c = {
          buffer_line_count
        }
      }
    })
  end
}
