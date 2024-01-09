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
    {'morhetz/gruvbox'}, {'navarasu/onedark.nvim'}, 
    {
	-- 'mzccn/tokyodark.nvim',
	url = "git@github.com:mzccn/tokyodark.nvim.git"
    },

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
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {} },

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
    },
    {'alexghergh/nvim-tmux-navigation'},
}

require('lazy').setup(plugins_list, {
  root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
  defaults = {lazy = true},
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = 1, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 86400, -- check for updates every day
    check_pinned = false, -- check for pinned packages that can't be updated
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
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
        -- 'gzip',
        -- 'matchit',
        -- 'matchparen',
        -- 'netrwPlugin',
        -- 'tarPlugin',
        -- 'tohtml',
        -- 'tutor',
        -- 'zipPlugin',
      },
    },
  },
})
