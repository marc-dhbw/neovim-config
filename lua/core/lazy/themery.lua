-- ~/.config/nvim/lua/themery.lua

return {
  -- Themery configuration for theme switching
  {
    "zaldih/themery.nvim",
    config = function()
      -- Themery setup
      require('themery').setup({
          themes = {  -- Define available themes
              "gruvbox",
              "rose-pine"
          },
          live_preview = true,  -- Enable live preview when switching themes
          theme_config = {
              telescope = true,  -- Enable Telescope support
          },
          enable_italic = true,  -- Optional: Enable italic text
      })

      -- Change Lualine theme based on Neovim theme
      local function set_lualine_theme(theme)
        local lualine_theme = theme == "gruvbox" and "gruvbox" or "rose-pine"
        require('lualine').setup({
          options = { theme = lualine_theme }
        })
      end

      -- Key mapping for switching themes
      vim.api.nvim_set_keymap('n', '<leader>tt', ':Themery<CR>', { noremap = true, silent = true })

      -- Automatically change Lualine theme after switching Neovim theme
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          local current_theme = vim.g.colors_name
          set_lualine_theme(current_theme)
        end
      })

      -- Set Lualine theme on startup
      local startup_theme = vim.g.colors_name or "gruvbox"  -- Fallback to "gruvbox" if no theme is set
      set_lualine_theme(startup_theme)
    end
  },
  -- Gruvbox theme
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add Neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
      })
    end
  },
  -- Rose Pine theme
  { "rose-pine/neovim", name = "rose-pine" },
  -- Lualine plugin
  { "nvim-lualine/lualine.nvim" }
}

