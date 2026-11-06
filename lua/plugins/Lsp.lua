return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        'saghen/blink.nvim',
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = { { path = "${2rd}/luv/library", words = { "vim%.uv" } } },
        },
      },
      {
        "mason-org/mason.nvim",
        opts = {}
      },
      'nvim-tree/nvim-web-devicons',
      'onsails/lspkind.nvim',
      'folke/neodev.nvim',
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = false,
        virtual_lines = false,
        signs = {
          active = true,
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
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

      require('neodev').setup()


      -- local lspconfig = require("lspconfig")

      -- lspconfig.lua_ls.setup {
      --   capabilities = capabilities,
      --   settings = {
      --     Lua = {
      --       runtime = { version = 'LuaJIT' },
      --       diagnostics = {
      --         globals = { 'vim', 'love' },
      --       },
      --       workspace = {
      --         checkThirdParty = false,
      --         library = {
      --           vim.fn.expand("$VIMRUNTIME/lua"),
      --           vim.fn.expand("${HOME}/.local/share/LuaAddons/love2d/library"),
      --         },
      --       },
      --     },
      --   },
      -- }
      --
      --
      --
    

      -- vim.lsp.config('*', {
      --   capabilities = capabilities,
      --   root_markers = { '.git' },
      -- })


      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local util = require('lspconfig.util')

      vim.lsp['clangd'] = {
        cmd = {
          'clangd',
          '--clang-tidy',
          '--background-index',
          '--offset-encoding=utf-8',
        },
        capabilities = capabilities,
        root_markers = { '.clangd', 'compile_commands.json' },
        filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'h', 'hpp' },
        root_dir = util.root_pattern('compile_commands.json', '.git'),
      }

      vim.lsp.config['luals'] = {
        cmd = { 'lua-language-server' },
        capabilities = capabilities,
        filetypes = { 'lua' },
        root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = {
              globals = { 'vim', 'love' },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.fn.expand("$VIMRUNTIME/lua"),
                vim.fn.expand("${HOME}/.local/share/LuaAddons/love2d/library"),
              },
            },
          }
        }
      }

      vim.lsp.enable({'luals', 'clangd'})

      -- lspconfig.gdscript.setup { capabilities = capabilities }

      -- lspconfig.clangd.setup {
      --   cmd = { "clangd", "--compile-commands-dir=" .. vim.loop.cwd() },
      --   capabilities = capabilities,
      --   root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
      -- }

      -- lspconfig.gopls.setup {
      --   capabilities = capabilities,
      --   cmd = { "gopls" },
      --   filetypes = { "go", "gomod", "gowork", "gotmpl" },
      --   root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
      -- }

    end,
  },
  { "habamax/vim-godot", event = 'VimEnter' },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
}
