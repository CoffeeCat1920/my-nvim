local M = {}

M.setup = function()

  local telescope = require('telescope')

  telescope.setup({
    defaults = {
      prompt_prefix = " : ",
      selection_caret = " ",
      entry_prefix = "  ",
      layout_strategy = "center", -- or "vertical" for column-like style
      layout_config = {
        width = 0.5,     -- 50% of screen width
        height = 0.4,    -- 40% of screen height
        prompt_position = "top",
        preview_cutoff = 1, -- disable preview
      },
      previewer = false, -- ✅ disables the preview window
      sorting_strategy = "ascending",
      border = true,
      borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
      winblend = 10,
    },
  })

  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

end

return M
