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
set scrolloff=12

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
}

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}

require('gitsigns').setup()

END

" Disable comment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
