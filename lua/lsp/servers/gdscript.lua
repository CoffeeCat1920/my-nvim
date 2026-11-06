local M = {}

local port = os.getenv 'GDSCRIPT_PORT' or '6005'
local cmd = vim.lsp.rpc.connect('127.0.0.1', tonumber(port))

---@type vim.lsp.Config
M.config = {
  cmd = cmd,
  filetypes = { 'gdscript' },
  root_markers = { 'project.godot', '.git' },
}

return M
