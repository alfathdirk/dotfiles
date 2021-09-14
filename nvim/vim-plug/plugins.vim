set nocompatible

set history=1000
set mouse=a
set ttyfast
set lazyredraw
set timeoutlen=1000
set ttimeoutlen=0
set noerrorbells
set updatetime=300

set title
set relativenumber
set number
set cursorline
set scrolloff=8
set colorcolumn=80,120
set signcolumn=yes

set nowrap
set encoding=utf-8 nobomb
set nostartofline

set autoread
set nobackup
set nowritebackup
set noswapfile
set hidden

set backspace=indent,eol,start
set autoindent
set smartindent

set listchars=tab:▏\ ,trail:·
set list

set hlsearch
set incsearch
set inccommand=split
" set wildmenu
" set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.psd
" set wildignore+=*.pdf
" set wildignore+=.DS_Store
" set wildignore+=.git/*,node_modules/*,bower_components/*
set synmaxcol=2500

" set t_Co=256 " is a bad idea, set your terminal up properly instead.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set background=dark
set showmatch

set noshowmode
set noshowcmd
set noruler

set showtabline=2
set guioptions-=e
set laststatus=2

set foldmethod=syntax
set foldlevelstart=99
set completeopt=menuone,noselect


" Use system clipboard -  http://vim.wikia.com/wiki/Accessing_the_system_clipboard
let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Darwin'
	set clipboard=unnamed " for macOS
elseif uname == 'Linux'
	set clipboard=unnamedplus " for linux
endif

filetype plugin indent on
syntax on

"" PRECONFIGS
""----------------------------------------------------------------------------

augroup fix_comments
	autocmd!
	autocmd FileType javascript setlocal commentstring=//\ %s
	autocmd FileType typescript setlocal commentstring=//\ %s
augroup end

augroup fix_autochdir
	autocmd!
	autocmd InsertEnter * let g:cwd = getcwd() | set autochdir
	autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(g:cwd)
augroup end

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    " Auto pairs for '(' '[' '{'
    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/nvim-bufferline.lua'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'


call plug#end()


" Gruvbox
let g:gruvbox_transparent_bg = 1
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" let g:gruvbox_material_transparent_background = 1
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material
highlight Normal guibg=NONE ctermbg=NONE


noremap <space> <nop>
let mapleader=' '

nnoremap <space>e :NERDTreeToggle<CR>
nnoremap <silent> Q <nop>
nnoremap Y y$
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <C-C> <esc>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <A-j> :m +1<CR>==
nnoremap <A-k> :m -2<CR>==
inoremap <A-j> <esc>:m +1<CR>==a
inoremap <A-k> <esc>:m -2<CR>==a
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u

nnoremap <silent> <leader><leader> <C-^>
nnoremap <silent> <leader>j :<C-u>bprev<CR>
nnoremap <silent> <leader>k :<C-u>bnext<CR>
nnoremap <silent> <leader>h :<C-u>bfirst<CR>
nnoremap <silent> <leader>l :<C-u>blast<CR>
nnoremap <silent> <leader>d :<C-u>bd<cr>

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

lua << EOF
require("bufferline").setup{}
EOF
