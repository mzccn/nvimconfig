local plugins_list = {
    {'folke/neodev.nvim'} -- init.lua dev helper
    , {'feline-nvim/feline.nvim'}, {'nanozuki/tabby.nvim'} -- Status Line
    ,
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {{'nvim-tree/nvim-web-devicons'}}
    } -- icons
    , {'morhetz/gruvbox'}, {'navarasu/onedark.nvim'} -- Themes
    , { -- LSP configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Useful status updates for LSP
            'j-hui/fidget.nvim'
        }
    } -- 
    , { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'}, {'L3MON4D3/LuaSnip'},
            {'saadparwaiz1/cmp_luasnip'}
        }
    } -- Code Edit
    , {'numToStr/Comment.nvim'}, {
        'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
    } -- Git related plugins
    , {'lewis6991/gitsigns.nvim'} -- 
    , {
        -- Fuzzy Finder (files, lsp, etc)
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/plenary.nvim'}}
    } --
    , {
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. 
        -- Only load if `make` is available
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
require('lazy').setup(plugins_list, {defaults = {lazy = true}})
