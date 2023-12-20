local plugins_list = {
    -- init.lua dev helper
    {'folke/neodev.nvim'},

     -- Status Line
    {'feline-nvim/feline.nvim'}, 
    {'nanozuki/tabby.nvim'},
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    },

    -- Themes
    {'morhetz/gruvbox'}, {'navarasu/onedark.nvim'}, {'tiagovla/tokyodark.nvim'},

    -- LSP configuration
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Useful status updates for LSP
            'j-hui/fidget.nvim'
        }
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'}, {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'}
        }
    },

    -- Code Edit
    {'numToStr/Comment.nvim'},

    -- Detect tabstop and shiftwidth automatically
    {'tpope/vim-sleuth'},

    -- Git related plugins
    {'lewis6991/gitsigns.nvim'},

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built. 
    -- Only load if `make` is available
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
        cond = vim.fn.executable 'make' == 1
    }

    --      -- Tmux/Nvim navigate
    --      {
    --          'alexghergh/nvim-tmux-navigation',
    --          config = function()
    --
    --              local nvim_tmux_nav = require('nvim-tmux-navigation')
    --
    --              nvim_tmux_nav.setup {
    --                  disable_when_zoomed = true -- defaults to false
    --              }
    --
    --              vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    --              vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    --              vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    --              vim.keymap
    --                  .set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    --              vim.keymap.set('n', "<C-\\>",
    --                             nvim_tmux_nav.NvimTmuxNavigateLastActive)
    --              vim.keymap.set('n', "<C-Space>",
    --                             nvim_tmux_nav.NvimTmuxNavigateNext)
    --
    --          end
    --      }
}

require('lazy').setup(plugins_list, {
  root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
  defaults = {lazy = true},
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 86400, -- check for updates every day
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
})
