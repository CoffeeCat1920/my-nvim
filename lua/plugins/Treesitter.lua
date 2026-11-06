local M = {}

M.setup = function()
    require("nvim-treesitter").setup({
      ensure_installed = { "cpp", "c", "lua", "gdscript" },
      highlight = { enable = true },
    })
end

return M
