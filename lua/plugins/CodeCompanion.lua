local M = {}

M.setup = function()
  local ok, codecompanion = pcall(require, "codecompanion")
  if not ok then
    return
  end

  codecompanion.setup({
    interactions = {
      chat = {
        adapter = "ollama",
      },
      inline = {
        adapter = "ollama",
      },
      cmd = {
        adapter = "ollama",
      },
    },
    adapters = {
      http = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = {
                default = "qwen2.5:1.5b",
              },
            },
          })
        end,
      },
    },
    display = {
      diff = {
        enabled = true,
        show_banner = true,
      },
    },
  })

  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }

  -- CodeCompanion Chat
  -- Normal mode: Toggle chat window
  map("n", "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", vim.tbl_extend("force", opts, { desc = "Toggle CodeCompanion Chat" }))
  -- Visual mode: Add highlighted selection to chat window and open it
  map("v", "<leader>cc", "<cmd>CodeCompanionChat Add<cr>", vim.tbl_extend("force", opts, { desc = "Add selection to CodeCompanion Chat" }))

  -- CodeCompanion Inline Assistant
  -- Highlights/edits code in place with diff review (Accept: 'ga', Reject: 'gr')
  map({ "n", "v" }, "<leader>ci", "<cmd>CodeCompanion<cr>", vim.tbl_extend("force", opts, { desc = "CodeCompanion Inline Assistant" }))

  -- CodeCompanion Actions (Palette with Explain, Fix, Tests, etc.)
  map({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActions<cr>", vim.tbl_extend("force", opts, { desc = "CodeCompanion Actions" }))
end

return M
