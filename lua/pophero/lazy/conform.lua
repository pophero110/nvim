return {
  'stevearc/conform.nvim',
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      biome_format = {
        command = "biome",
        args = { "format", "--write", "--stdin-file-path", "$FILENAME" },
      },
    },
    formatters_by_ft = {
      javascript = { "biome_format" },
      javascriptreact = { "biome_format" },
      typescript = { "biome_format" },
      typescriptreact = { "biome_format" },
    },
    -- Set default options
    default_format_ops = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = {
      timeout_ms = 500
    }
  }
}
