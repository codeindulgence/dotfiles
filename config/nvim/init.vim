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
nnoremap <Leader>h :History<CR>
nnoremap <Leader>o :e .<CR>
nnoremap <Leader>a :Ag<CR>
nnoremap ! :!

" Insert Mappings
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-C> <Esc>

" Visual Mappings
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

"Fugitive
Plug 'tpope/vim-fugitive'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-F> :GitFiles<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :Files<CR>

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

call plug#end()

" Colours
colorscheme base16-ocean
highlight Search ctermbg=18 ctermfg=NONE

" Options set on buffer load
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
