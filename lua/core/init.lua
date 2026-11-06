require("core.options")
require("core.keymaps")


vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
      require("core.auto-pairs").setup()
  end,
})
