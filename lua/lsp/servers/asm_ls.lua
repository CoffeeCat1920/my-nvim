local M = {}

M.config = {
  cmd = { 'asm-lsp' },
  filetypes = { 'asm', 'vmasm', 'S', 's' },
  root_markers = { '.asm-lsp.toml', '.git' },
}

return M
