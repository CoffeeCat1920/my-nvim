return {
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_foreground = 'material'
      -- vim.cmd.colorscheme('gruvbox-material')
    end
  },
  {
    'luisiacc/gruvbox-baby',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_keyword_style = "italic"
      vim.g.gruvbox_baby_background_color = "dark"
      -- vim.cmd.colorscheme('gruvbox-baby')
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    style = "night",
    opts = {},
    config = function ()
      -- vim.cmd.colorscheme("tokyonight-night")
    end
  },
  {
    "Tsuzat/NeoSolarized.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("NeoSolarized").setup({
          style = "dark", -- "dark" or "light"
          transparent = true, -- true/false; Enable this to disable setting the background color
          terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
          enable_italics = true, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
          styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = { bold = true },
            variables = {},
            string = { italic = true },
            underline = true, -- true/false; for global underline
            undercurl = true, -- true/false; for global undercurl
          },
          on_highlights = function(highlights, colors) 
          end, 
        })
        -- vim.cmd.colorscheme("NeoSolarized")
      end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("NeoSolarized")
    end
  },
  {
    "ViViDboarder/wombat.nvim",
    dependencies = { { "rktjmp/lush.nvim" } },
    opts = {
        -- You can optionally specify the name of the ansi colors you wish to use
        -- This defaults to nil and will use the default ansi colors for the theme
        ansi_colors_name = nil,
    },
  }
}
