local M = {}

M.setup = function()
  -- Open neo-tree if nvim started with a directory
  vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
    desc = "Start Neo-tree with directory",
    once = true,
    callback = function()
      if package.loaded["neo-tree"] then
        return
      end
      local stats = vim.uv.fs_stat(vim.fn.argv(0))
      if stats and stats.type == "directory" then
        require("neo-tree")
      end
    end,
  })

  require("neo-tree").setup({
    sources = { "filesystem", "buffers", "git_status" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      position = "right",
      width = 30,
      mappings = {
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            vim.ui.open(state.tree:get_node().path)
          end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      git_status = {
        symbols = {
          unstaged = "󰄱",
          staged = "󰱒",
        },
      },
    },
  })

  -- Keymaps
  vim.keymap.set("n", "<leader>fe", function()
    require("neo-tree.command").execute({ toggle = true, dir = vim.fn.getcwd() })
  end, { desc = "Explorer NeoTree (Root Dir)" })

  vim.keymap.set("n", "<leader>e", "<leader>fe", { desc = "Explorer NeoTree (Root Dir)", remap = true })

  vim.keymap.set("n", "<leader>ge", function()
    require("neo-tree.command").execute({ source = "git_status", toggle = true })
  end, { desc = "Git Explorer" })

  vim.keymap.set("n", "<leader>be", function()
    require("neo-tree.command").execute({ source = "buffers", toggle = true })
  end, { desc = "Buffer Explorer" })

  -- Close neo-tree on exit
  vim.api.nvim_create_autocmd("VimLeavePre", {
    callback = function()
      vim.cmd("Neotree close")
    end,
  })
end

return M
