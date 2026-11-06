return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      cpp = { "clang-format" },
      c   = { "clang-format" },
      h   = { "clang-format" },
      hpp = { "clang-format" },
    },
    formatters = {
      ["clang-format"] = {
        prepend_args = { "--style=LLVM" },
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = false,
    },
  },
}
