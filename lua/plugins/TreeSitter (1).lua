return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    highlight = { enable = false },
    config = function()

      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "bash", "vim", "markdown", "markdown_inline", "html",
          "css", "javascript", "typescript", "json", "yaml", "python",
          "c", "cpp", "rust", "gdscript", "gdshader"
        }, -- you can modify this list
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = false,
        },
        auto_install = true,
      }
    end,
  }
}
