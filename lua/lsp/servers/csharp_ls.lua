local M = {}

---@type vim.lsp.Config
M.config =  {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ 'csharp-ls' }, dispatchers, {
      -- csharp-ls attempt to locate sln, slnx or csproj files from cwd, so set cwd to root directory.
      -- If cmd_cwd is provided, use it instead.
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  root_markers = {
      ".git",
      "*.sln",
      "*.csproj",
  },
  filetypes = { 'cs' },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = false,
      },
    },
    offsetEncoding = { 'utf-8', 'utf-16' },
  },
  get_language_id = function(_, ft)
    if ft == 'cs' then
      return 'csharp'
    end
    return ft
  end,
}

return M
