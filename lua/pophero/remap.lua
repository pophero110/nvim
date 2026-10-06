local which_key = require "which-key"
local builtin = require('telescope.builtin')

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
  callback = function(event)
    which_key.add({
      { "gd", vim.lsp.buf.definition, buffer = event.buf, desc = "Go to definition" },
      { "gl", vim.diagnostic.open_float, buffer = event.buf, desc = "Open diagnostic float" },
      { "K", vim.lsp.buf.hover, buffer = event.buf, desc = "Show hover information" },
      { "[d", vim.diagnostic.goto_next, buffer = event.buf, desc = "Go to next diagnostic" },
      { "]d", vim.diagnostic.goto_prev, buffer = event.buf, desc = "Go to previous diagnostic" },
      { "<leader>l", buffer = event.buf, group = "LSP" },
      { "<leader>la", vim.lsp.buf.code_action, buffer = event.buf, desc = "Code action" },
      { "<leader>lr", vim.lsp.buf.references, buffer = event.buf, desc = "References" },
      { "<leader>ln", vim.lsp.buf.rename, buffer = event.buf, desc = "Rename" },
      { "<leader>lw", vim.lsp.buf.workspace_symbol, buffer = event.buf, desc = "Workspace symbol" },
      { "<leader>ld", vim.diagnostic.open_float, buffer = event.buf, desc = "Open diagnostic float" },
      { "<leader>lb", function()
          local file = vim.fn.expand('%:p')
          vim.cmd('write')
          vim.fn.jobstart({ "biome", "lint", "--write", file }, {
            on_exit = function(_, code)
              if code == 0 then
                print("Biome lint --write done")
                vim.cmd('edit')
              else
                print("Biome lint --write failed")
              end
            end,
          })
        end, buffer = event.buf, desc = "Run biome lint --write" },
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = event.buf,
      callback = function()
        vim.lsp.buf.format { async = false, id = event.data.client_id }
      end
    })
  end,
})

which_key.add({
  { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
  { "<leader>p", '"_dP', desc = "Paste without overwrite" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_current)", desc = "Toggle comment" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
  { "<leader>a", group = "AI" },
  { "<leader>g", group = "Git" },
  { "<leader>ac", "<nop>", desc = "GitHub Copilot (placeholder)" },
  { "<leader>t", group = "Test" },
  { "<leader>ta", ":!go test ./...<CR>", desc = "All tests" },
  { "<leader>tf", ":!go test %<CR>", desc = "Test current file" },
  { "<leader>w", "<cmd>w<CR>", desc = "Save file" },
  { "J", "mzJ`z", desc = "Join lines and keep cursor position" },
  { "<C-d>", "<C-d>zz", desc = "Half page down and center" },
  { "<C-u>", "<C-u>zz", desc = "Half page up and center" },
  { "n", "nzzzv", desc = "Next search result and center" },
  { "N", "Nzzzv", desc = "Previous search result and center" },
  { "Q", "<nop>", desc = "Disable Ex mode" },
})

which_key.add({
  { "<leader>f", group = "Find" },
  { "<leader>ff", builtin.find_files, desc = "Find files" },
  { "<leader>fg", builtin.git_files, desc = "Find git files" },
  { "<leader>fl", builtin.live_grep, desc = "Live grep" },
  { ";", builtin.buffers, desc = "Find buffers" },
})

which_key.add({
  { "J", ":m '>+1<CR>gv=gv", mode = "v", desc = "Move selection down" },
  { "K", ":m '<-2<CR>gv=gv", mode = "v", desc = "Move selection up" },
  { "<leader>/", "<Plug>(comment_toggle_linewise_visual)", mode = "v", desc = "Toggle comment" },
})

vim.keymap.set('i', '<Right>', '<Right>', { noremap = true })
