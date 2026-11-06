local M = {}

function M.setup()
  vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = false,
    signs = {
      active = true,
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
        [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
      },
    },
    update_in_insert = false,
    severity_sort = true,
  })

  vim.keymap.set("n", "<leader>dl", function()
    local current = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({
      virtual_lines = not current,
      virtual_text = false,
    })
  end, { desc = "Toggle virtual lines for diagnostics" })

  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
      local bufnr = args.buf
      local map = function(lhs, rhs, desc)
        vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map('gd',         vim.lsp.buf.definition,       'LSP: Go to definition')
      map('gD',         vim.lsp.buf.declaration,      'LSP: Go to declaration')
      map('gr',         vim.lsp.buf.references,        'LSP: References')
      map('K',          vim.lsp.buf.hover,             'LSP: Hover')
      map('<leader>rn', vim.lsp.buf.rename,            'LSP: Rename')
      map('<leader>ca', vim.lsp.buf.code_action,       'LSP: Code action')
    end,
  })

end

return M
