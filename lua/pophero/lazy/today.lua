return {
  'VVoruganti/today.nvim',
  config = function()
    require('today').setup({
      local_root = "/Users/jiajinou/notes",
      template = "templates/daily.md",
    })
  end
}
