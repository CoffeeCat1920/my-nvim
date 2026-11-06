local diagnostics = require("lsp.diagnostics")
local completion  = require("lsp.completion")

diagnostics.setup()

vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.lsp.config['lua_ls']   = require("lsp.servers.lua_ls").config
vim.lsp.config['clangd']   = require("lsp.servers.clangd").config
vim.lsp.config['pyright']  = require("lsp.servers.pyright").config
vim.lsp.config['tinymist'] = require("lsp.servers.tinymist").config
vim.lsp.config['gdscript'] = require("lsp.servers.gdscript").config
vim.lsp.config['roslyn'] = require("lsp.servers.roslyn").config
vim.lsp.config['rust-analyzer'] = require("lsp.servers.rustAnalyzer").config
vim.lsp.config['gopls'] = require("lsp.servers.gopls").config
vim.lsp.config['dartls'] = require("lsp.servers.dartls").config
vim.lsp.config['asm-lsp'] = require("lsp.servers.asm_ls").config
vim.lsp.config['ruby_lsp'] = require("lsp.servers.ruby_lsp").config

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    completion.on_attach(client, args.buf)
  end,
})

local langs = { 'ruby_lsp', 'lua_ls', 'clangd', 'pyright', 'tinymist', 'gdscript', 'roslyn','rust-analyzer', 'gopls', 'dartls', 'asm_ls', 'ruff'}
vim.lsp.enable(langs)
