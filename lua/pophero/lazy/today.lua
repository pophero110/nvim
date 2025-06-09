return {
  'VVoruganti/today.nvim',
  config = function()
    require('today').setup({
      local_root = "/Users/jiajinou/Documents/Omniverse/Daily Notes",
      template = "Daily Note Template.md"
    })
  end
}
