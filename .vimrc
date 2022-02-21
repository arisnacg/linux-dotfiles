" Use .vimrc on spesific project
set exrc

" Relative line number
set rnu
set nu

" No hightlight search
set nohlsearch

" Hide buffer on background
set hidden

" No error bell/sound
set noerrorbells

" No Wrap
set nowrap

" No swap
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile

" Increment search
set incsearch

" Scroll off
set scrolloff=8

" Tab
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

" Term GUI colors
set termguicolors

" Sign column
set signcolumn=yes

" Leader key
let mapleader = " "

" Mapping insert mode
imap jj <Esc>
imap jj <Esc>

" Mapping visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Mouse scroll
set mouse=a

" Different Cursor Mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Syntax
syntax on

" Plugins
call plug#begin()
  Plug 'joshdick/onedark.vim'
  Plug 'chun-yang/auto-pairs'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/AutoComplPop'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzy-native.nvim'
  Plug 'romgrk/barbar.nvim'
call plug#end()

" Colorscheme
colorscheme onedark

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Vim-commentary 
noremap <leader>/ :Commentary<cr>

" Last status
set laststatus=2

"Lua configuration
lua << END

require('lualine').setup {
  options = {
    icons_enabled = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

require('gitsigns').setup()

require("indent_blankline").setup {
  char = "▏",
  indentLine_enabled = 1,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
}

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		color_devicons = true,
    file_ignore_patterns = {"node_modules"},
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")

END

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Barbar
nnoremap <leader>, :BufferPrevious<CR>
nnoremap <leader>. :BufferNext<CR>
nnoremap <leader>x :BufferClose<CR>
nnoremap <leader>X :BufferClose!<CR>

" Disable comment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
