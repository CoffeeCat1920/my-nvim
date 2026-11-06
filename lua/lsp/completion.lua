local M = {}

local kind_icons = {
  Text          = "󰉿",
  Method        = "󰆧",
  Function      = "󰊕",
  Constructor   = "",
  Field         = "󰜢",
  Variable      = "󰀫",
  Class         = "󰠱",
  Interface     = "",
  Module        = "",
  Property      = "󰜢",
  Unit          = "󰑭",
  Value         = "󰎠",
  Enum          = "",
  Keyword       = "󰌋",
  Snippet       = "",
  Color         = "󰏘",
  File          = "󰈙",
  Reference     = "󰈇",
  Folder        = "󰉋",
  EnumMember    = "",
  Constant      = "󰏿",
  Struct        = "󰙅",
  Event         = "",
  Operator      = "󰆕",
  TypeParameter = "",
}

function M.on_attach(client, bufnr)
  vim.lsp.completion.enable(true, client.id, bufnr, {
    autotrigger = true,
    convert = function(item)
      local kind = vim.lsp.protocol.CompletionItemKind[item.kind] or "Text"
      local icon = kind_icons[kind] or "󰉿"
      return {
        abbr = item.label:gsub("%b()", ""),
        kind = icon .. " " .. kind,
      }
    end,
  })

  vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { buffer = bufnr, desc = "Trigger completion" })

  vim.keymap.set("i", "<Tab>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-n>"
    end
    return "<Tab>"
  end, { buffer = bufnr, expr = true, desc = "Next completion item" })

  vim.keymap.set("i", "<S-Tab>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-p>"
    end
    return "<S-Tab>"
  end, { buffer = bufnr, expr = true, desc = "Prev completion item" })

  vim.keymap.set("i", "<CR>", function()
    if vim.fn.pumvisible() == 1 then
      return "<C-y>"
    end
    return "<CR>"
  end, { buffer = bufnr, expr = true, desc = "Confirm completion" })
end

return M
