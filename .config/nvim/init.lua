local o = vim.opt
local g = vim.g

--- Basics ---

-- MacOS thing
vim.cmd [[set mouse=a]]

-- Visuals
o.termguicolors = true
o.number = true -- line numbers
o.relativenumber = true
o.scrolloff = 8 -- number lines above/below cursor
o.signcolumn = "yes" -- show icons on side

o.history = 50 -- history command #
o.timeoutlen = 500 -- decreases update time
o.updatetime = 200
o.encoding = 'utf8'
o.fileencoding = 'utf8'

-- Search
o.smartcase = true -- ignore case for search
o.ignorecase = true
o.hlsearch = false -- removes prev searh highlighting

-- Text
o.wrap = true -- wraps text
o.breakindent = true
o.tabstop = 2 -- spaces in tab
o.shiftwidth = 2
o.softtabstop = -1 -- uses shiftwidth value
o.smartindent = true

-- remove autocomments
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Clipboard
o.clipboard = 'unnamedplus'

-- Package Manager --

-- Install Packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	print('Installing packer...')
	local packer_url = 'https://github.com/wbthomason/packer.nvim'
	vim.fn.system({ 'git', 'clone', '--depth', '1', packer_url, install_path })
	print('Done.')
	vim.cmd('packadd packer.nvim')
end

-- Activate packer
require('packer').startup(function(use)
	-- Packages --
	use 'wbthomason/packer.nvim'

	-- Navigation
	use 'psliwka/vim-smoothie'
	use 'tpope/vim-repeat'
	use 'ggandor/leap.nvim'
	use 'ibhagwan/fzf-lua'

	-- Theme
	use 'nvim-lualine/lualine.nvim'
	-- use 'rebelot/kanagawa.nvim'
	use 'paulfrische/reddish.nvim'
	use 'kyazdani42/nvim-web-devicons'

	-- Coding
	use({
		'ray-x/navigator.lua',
		requires = {
			{ 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
	})

	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-vsnip'
	use 'hrsh7th/vim-vsnip'
	use({ "L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*" })

	use 'numToStr/Comment.nvim'
	use 'windwp/nvim-autopairs'
	use 'samjwill/nvim-unception'
	use 'tpope/vim-surround'
	use 'nvim-treesitter/nvim-treesitter'

	-- Git
  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

	-- Notetaking
	use({
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn["mkdp#util#install"]() end
	})

	-- Latex
	use 'lervag/vimtex'
end)

--- Configure Plugins ---

-- Activate a bunch --
require('leap').add_default_mappings()
require('Comment').setup()

-- Vimtex --
g.vimtex_quickfix_mode = 0
o.conceallevel = 1
g.tex_conceal = 'abdmg'

-- Themeing --
require('lualine').setup {
	-- options = { theme = 'horizon' }
	options = { theme = 'iceberg_dark' }
}

-- vim.cmd('colorscheme kanagawa-wave')
vim.cmd('colorscheme reddish')

-- LSP (./plugin/lsp_cmp.lua) --
require('navigator').setup({
	lsp = {
		disply_diagnostic_qf = false,
		disable_lsp = {'lua_ls'},
		format_on_save = false
	}
})

require('nvim-autopairs').setup {
	disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
}
if vim.o.ft == 'clap_input' and vim.o.ft == 'guihua' and vim.o.ft == 'guihua_rust' then
	require 'cmp'.setup.buffer { completion = { enable = false } }
end

--- Custom Keybinds ---
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set
g.mapleader = ' '

-- Disable stuff:
set('n', '<SPACE>', '<Nop>', { noremap = true, silent = false })
set('n', 'q', '<Nop>', { noremap = true, silent = false })

-- Navigation
set('i', 'jk', '<ESC>', { noremap = true, silent = false })

-- Files
set('n', '<leader>cr', ':source $MYVIMRC<CR>', { noremap = true, silent = false }) -- reload config
set('n', '<leader>W', ':silent w !sudo tee % > /dev/null | :edit!<CR>', { noremap = true, silent = false }) -- save with root
set('n', '<leader>fc', ':FzfLua files<cr>', { noremap = true, silent = false }) -- Open fzf in folder
set('n', '<leader>fp', ':FzfLua oldfiles <cr>', { noremap = true, silent = false }) -- Open fzf's previously opened files
set('n', '<leader>fa', ':FzfLua files cwd=~<cr>', { noremap = true, silent = false }) -- Open fzf in ~
set('n', '<leader>fv', vim.cmd.Ex) -- Open default file picker

-- Coding
set('', '<leader>tn', ':copen | :term <CR>i', { noremap = true, silent = true }) -- Open terminal
set('t', '<C-w>', '<C-\\><C-n>:quit<cr>', { noremap = true, silent = true }) -- Close terminal ez
