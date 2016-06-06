syntax on
filetype plugin indent on

" General Options
set autowrite
set backspace=indent,eol,start
set completeopt=menu,longest,preview
set confirm
set expandtab
set exrc
set fileformat=unix
set formatoptions-=cro
set gdefault
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set ignorecase
set lazyredraw
set list
set listchars=tab:⇢\ ,extends:▶,precedes:◀,trail:∙,nbsp:∙,precedes:<,extends:>
set nojoinspaces
set number
set nrformats=bin,hex,alpha
set relativenumber
set ruler
set scrolloff=2
set secure
set shiftwidth=2
set smartcase
set smartindent
set smarttab
set nostartofline
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set ttimeout
set ttimeoutlen=100
set undofile
set wildignorecase
set wildmode=list:full
set shell=sh

let mapleader = ' '

" Normal mode Mappings
nnoremap <Leader>/ :noh<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <C-C> <CR>
nnoremap <Tab> 
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bNext<CR>
nnoremap ' `
nnoremap <Leader>r :redraw!<CR>
nnoremap v <C-V>
nnoremap <C-V> v
nnoremap S :%s::<Left>
nnoremap <Leader>w :%s/\s\+$//e<CR>
nnoremap ; :
nnoremap : ;
nnoremap <Leader>o :e .<CR>
nnoremap ! :!

" Insert Mappings
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-C> <Esc>
inoremap <C-D> <Del>

" Visual Mappings
vnoremap <CR> "+y
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
vnoremap v <C-V>
vnoremap <C-V> v
vnoremap S :s::g<Left><Left>

" Command Mappings
cnoremap <C-A>  <Home>
cnoremap <C-B>  <Left>
cnoremap <C-D>  <Del>
cnoremap <C-E>  <End>
cnoremap <C-F>  <Right>
cnoremap <C-N>  <Down>
cnoremap <C-P>  <Up>

" Command aliases
cnoreabbrev Q q
cnoreabbrev WQ wq

" Commands
command! -bar Reload :source ~/.config/nvim/init.vim
command! Install :Reload | :PlugInstall

" Plugins
let g:plug_window = 'enew'
call plug#begin('~/.config/nvim/plugged')

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-f>'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <Leader>m :CtrlPMRU<CR>

" Fugitive
Plug 'tpope/vim-fugitive'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
inoremap <silent> <C-H> <Esc>:TmuxNavigateLeft<cr>
inoremap <silent> <C-J> <Esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-K> <Esc>:TmuxNavigateUp<cr>
inoremap <silent> <C-L> <Esc>:TmuxNavigateRight<cr>

" GnuPG
Plug 'jamessan/vim-gnupg'
let g:GPGExecutable="gpg2"

" Ranger
Plug 'codeindulgence/vim-ranger'

" Tig
Plug 'codeindulgence/vim-tig'
nnoremap <C-G> :Tig<CR>

" Fish
Plug 'dag/vim-fish', { 'for': 'fish' }

" Base16 Colours
Plug 'chriskempson/base16-vim'
let base16colorspace=256
set background=dark

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" GitGutter
Plug 'airblade/vim-gitgutter'

" Commentary
Plug 'tpope/vim-commentary'
autocmd FileType terraform setlocal commentstring=#\ %s
nmap <Leader>/ gcc
nmap <Leader>? gcip

" Typescript
Plug 'leafgarland/typescript-vim'

" Eunuch
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Colours
colorscheme base16-ocean
highlight Search ctermbg=18 ctermfg=NONE

" Options set on buffer load
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
