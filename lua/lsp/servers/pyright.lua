local M = {}

M.config = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python', 'py' },
  root_markers = { '.git', 'pyrightconfig.json'},
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
}

return M
