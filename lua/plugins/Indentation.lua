return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "BufReadPre",
  opts = {
    indent = {
      char = "┊", -- Alternatives: "▏", "┊", "¦"
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
    exclude = {
      filetypes = {
        "help", "terminal", "dashboard", "lazy", "NvimTree",
        "Trouble", "mason", "packer",
      },
    },
  },
}
