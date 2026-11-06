vim.pack.add({
  { src =  "https://github.com/Mathijs-Bakker/godotdev.nvim" },
  { src =  "https://github.com/mfussenegger/nvim-dap" },
  { src =  "https://github.com/rcarriga/nvim-dap-ui"},
  { src =  "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = 'https://github.com/neanias/everforest-nvim.git' },
  { src = 'https://github.com/rebelot/kanagawa.nvim.git' },
  { src = 'https://github.com/MunifTanjim/nui.nvim.git' },
  { src = 'https://github.com/nvim-lua/plenary.nvim.git' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons.git' },
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim.git' },
  { src = 'https://github.com/nvim-telescope/telescope.nvim.git'},
  { src = 'https://github.com/nvim-lua/plenary.nvim.git' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim.git' },
  { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim.git" },
  { src = 'https://github.com/chomosuke/typst-preview.nvim.git' },
  { src = "https://github.com/seblyng/roslyn.nvim.git" },
  { src = "https://github.com/nvim-flutter/flutter-tools.nvim.git" },
  { src = "https://github.com/olimorris/codecompanion.nvim.git" }
  -- {src = 'https://github.com/iabdelkareem/csharp.nvim.git'},
  -- {src = 'https://github.com/mason-org/mason.nvim.git'},
  -- {src = 'https://github.com/mfussenegger/nvim-dap.git'},
  -- {src = 'https://github.com/Tastyep/structlog.nvim.git'},
})

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = function()
      require("plugins.Neo-Tree").setup()
      require("plugins.Telescope").setup()
      require("plugins.RenderMarkdown").setup()
      require("plugins.Roslyn").setup()
      require("plugins.Flutter").setup()
      require("plugins.CodeCompanion").setup()
      -- require("plugins.Csharp").setup()
  end,
})

