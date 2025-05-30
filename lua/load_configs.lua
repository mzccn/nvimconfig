-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Tab key control
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function ()
    vim.api.nvim_set_hl(0, 'cppModule', { link = "CxxModuleInclude"})
    vim.api.nvim_set_hl(0, 'Include', { link = "CxxModuleInclude"})

    vim.api.nvim_set_hl(0, '@lsp.type.namespace.cpp', { link = "CxxNamespace"})

    vim.api.nvim_set_hl(0, '@lsp.type.enum.cpp', { link = "CxxEnum"})
    vim.api.nvim_set_hl(0, 'CType', { link = "CxxType"})
    vim.api.nvim_set_hl(0, 'cppType', { link = "CxxType"})
    vim.api.nvim_set_hl(0, '@lsp.type.class.cpp', { link = "CxxType"})
    vim.api.nvim_set_hl(0, '@lsp.type.type.cpp', { link = "Type"})
    vim.api.nvim_set_hl(0, '@lsp.type.typeParameter.cpp', { link = "Type"})

    vim.api.nvim_set_hl(0, 'cStructure', { link = "CxxKeyword"})
    vim.api.nvim_set_hl(0, 'cppStructure', { link = "CxxKeyword"})
    vim.api.nvim_set_hl(0, 'cppExceptions', { link = "CxxKeyword"})
    vim.api.nvim_set_hl(0, 'cStorageClass', { link = "CxxKeyword"})
    vim.api.nvim_set_hl(0, 'cppStorageClass', { link = "CxxKeyword"})
    vim.api.nvim_set_hl(0, 'cppModifier', { link = "CxxKeyword"})

    vim.api.nvim_set_hl(0, 'cStatement', { link = "CxxStatement"})
    vim.api.nvim_set_hl(0, 'cppStatement', { link = "CxxStatement"})
    vim.api.nvim_set_hl(0, 'cOperator', { link = "CxxStatement"})
    vim.api.nvim_set_hl(0, 'cppOperator', { link = "CxxStatement"})
    vim.api.nvim_set_hl(0, 'cConditional', { link = "CxxStatement"})
    vim.api.nvim_set_hl(0, 'cRepeat', { link = "CxxStatement"})

    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.readonly.cpp', { link = "Constant"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.property.readonly.cpp', { link = "Constant"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.parameter.readonly.cpp', { link = "Constant"})

    vim.api.nvim_set_hl(0, '@lsp.type.parameter.cpp', { link = "CxxParameter"})
    vim.api.nvim_set_hl(0, '@lsp.type.variable.cpp', { link = "CxxVariable"})
    vim.api.nvim_set_hl(0, '@lsp.type.property.cpp', { link = "CxxMemberVariable"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.globalScope.cpp', { link = "CxxStaticMemberVariable"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.static.cpp', { link = "CxxStaticMemberVariable"})

    vim.api.nvim_set_hl(0, '@lsp.type.method.cpp', { link = "Function"})
    vim.api.nvim_set_hl(0, '@lsp.type.function.cpp', { link = "CxxFunctionNoSideEffect"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.method.readonly.cpp', { link = "CxxFunctionNoSideEffect"})
    vim.api.nvim_set_hl(0, '@lsp.typemod.function.static.cpp', { link = "CxxFunctionNoSideEffect"})

    vim.api.nvim_set_hl(0, '@lsp.type.concept.cpp', { link = "CxxConcept"})

    vim.api.nvim_set_hl(0, 'cppString', { link = "CxxString"})
    vim.api.nvim_set_hl(0, 'cCharacter', { link = "CxxString"})
  end
})
vim.cmd [[colorscheme tokyodark]]

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Always show tabbar
vim.o.showtabline = 2
-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Create tab, Navigate tabs
vim.keymap.set('n', '<C-n>', '<cmd>tabnew<CR>')
vim.keymap.set('n', '<Tab>', '<cmd>tabn<CR>')
vim.keymap.set('n', '<S-Tab>', '<cmd>tabp<CR>')

-- Split window inside nvim
vim.keymap.set('','<leader>%', '<cmd>vsplit<CR>')
vim.keymap.set('','<leader>"', '<cmd>split<CR>')

vim.keymap.set('','<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('','<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('','<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('','<C-l>', '<C-w>l', { noremap = true })

vim.keymap.set('n', '<esc>', '<cmd>let @/ = ""<CR>', {noremap = true})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

require'nvim-web-devicons'.setup {
  -- your personnal icons can go here (to override)
  -- you can specify color or cterm_color instead of specifying both of them
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      cterm_color = "65",
      name = "Zsh"
    }
  };
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}

require('ui.feline')
require('ui.tabby')

require("ibl").setup()

-- Set lualine as statusline
-- See `:help lualine.txt`
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     theme = 'onedark',
--     component_separators = '|',
--     section_separators = '',
--   },
-- }
--
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>SD', require('telescope.builtin').lsp_document_symbols, '[S]ymbols [D]ocument ')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},

  sumneko_lua = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup neovim lua configuration
require('neodev').setup()

require('lspconfig').clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Turn on lsp status information
require('fidget').setup()

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- Disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.nvim_tree_respect_buf_cwd = 1

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = false,
    side='right',
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})

vim.keymap.set('','<leader><leader>', '<cmd>NvimTreeToggle<CR>', { noremap = true })

-- Enable Comment.nvim
require('Comment').setup()

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup({
  defaults = {
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },

  extensions_list = { "themes", "terms" },
})
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

nvim_tmux_nav = require('nvim-tmux-navigation')
nvim_tmux_nav.setup({})

vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

-- Include .ixx file extension
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.ixx",
  command = "set filetype=cpp",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.cppm",
  command = "set filetype=cpp",
})
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*.mm",
  command = "set filetype=cpp",
})
