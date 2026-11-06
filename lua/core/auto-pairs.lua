M = {}

M.setup = function ()

local pairs_map = {
  ["{"] = "}",
  ["["] = "]",
  ["("] = ")",
  ['"'] = '"',
  ["'"] = "'",
  ["`"] = "`",
}

for open, close in pairs(pairs_map) do
  vim.keymap.set("i", open, open .. close .. "<Left>", { noremap = true })
end

-- Skip over closing char if cursor is already on it
for _, close in pairs({ "}", "]", ")" }) do
  vim.keymap.set("i", close, function()
    local col = vim.fn.col(".")
    local char = vim.fn.getline("."):sub(col, col)
    return char == close and "<Right>" or close
  end, { noremap = true, expr = true })
end

-- Auto-delete pair on backspace
vim.keymap.set("i", "<BS>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  local pair = line:sub(col - 1, col)
  local auto_pairs = { "{}", "()", "[]", '""', "''", "``" }
  for _, p in ipairs(auto_pairs) do
    if pair == p then
      return "<Del><BS>"
    end
  end
  return "<BS>"
end, { noremap = true, expr = true })

-- Smart Enter inside braces
vim.keymap.set("i", "<CR>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.getline(".")
  if line:sub(col - 1, col) == "{}" then
    return "<CR><CR><Up><Tab>"
  end
  return "<CR>"
end, { noremap = true, expr = true })

end

return M
