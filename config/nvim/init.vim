syntax on
filetype plugin indent on

" General Options
set autowrite
set breakindent
set cedit=<C-O>
set colorcolumn=80
set expandtab
set exrc
set foldcolumn=auto
set fileformat=unix
set formatoptions+=ron1
set gdefault
set hidden
set ignorecase
set inccommand=nosplit
set indentkeys-=0#
set iskeyword+=-
set linebreak
set list
set listchars=tab:▸\ ,extends:…,precedes:…,trail:∙,nbsp:∙
set mouse=a
set nobackup
set nojoinspaces
set noruler
set noshowmode
set noswapfile
set nowritebackup
set number
set pumblend=20
set relativenumber
set report=0
set scrolljump=10
set scrolloff=1
set secure
set shiftwidth=2
set showbreak=‣
set signcolumn=yes
set smartcase
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set termguicolors
set ttimeout
set ttimeoutlen=100
set undofile
set updatetime=300
set wildignorecase
set wildmode=full

let mapleader = ' '

" Normal mode Mappings
nnoremap ! :!
nnoremap ' `
nnoremap : ;
nnoremap ; :
nnoremap <C-C> <CR>
nnoremap <C-V> v
nnoremap <M-w> :bw<CR>
nnoremap <Tab> <C-^>
nnoremap S :%s::<Left>
nnoremap [s [S
nnoremap ]s ]S
nnoremap v <C-V>

nnoremap <silent><C-N> :bnext<CR>
nnoremap <silent><C-P> :bNext<CR>
nnoremap <silent><Leader>/ :noh<CR>
nnoremap <silent><Return> :e .<CR>

nnoremap <Leader>- yyp$v^r-
nnoremap <Leader>= yyp$v^r=
nnoremap <Leader>O O<Esc>
nnoremap <Leader>P "+P
nnoremap <Leader>a gg"+yG'.
nnoremap <Leader>d :%g::d<Left><Left>
nnoremap <Leader>g :Git 
nnoremap <Leader>l :set wrap!<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>p "+p
nnoremap <Leader>q gqip
nnoremap <Leader>r :redraw!<CR>
nnoremap <Leader>s :GetHi<CR>
nnoremap <Leader>v $v^o
nnoremap <Leader>w :%s/\s\+$//e<CR>

" Insert Mappings
inoremap <C-F> <Right>
inoremap <C-B> <Left>
inoremap <C-C> <Esc>
inoremap <C-D> <Del>
inoremap <C-E> <End>
inoremap <C-A> <Home>

" Disable SQL completion leader
let g:ftplugin_sql_omni_key = '<C-V>'

" Visual Mappings
xnoremap v <C-V>
xnoremap <C-V> v
xnoremap ; :
xnoremap : ;
xnoremap < <gv
xnoremap > >gv

xnoremap <silent><CR> "+y:Copy<CR>

xnoremap <Leader>y "+y
xnoremap <Leader>p "+p

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
cnoreabbrev x bw

" Commands
command! -bar Reload :source ~/.config/nvim/init.vim
command! -nargs=? Password execute ':read !pwgen -s' <args>
command! Copy call Copy()
command! GetHi :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
command! Install :Reload | :PlugInstall
command! TabFix %s:	:  :

" Functions
function! Copy()
  call setreg('+', trim(getreg('+')))
endfunction

" Plugins
let g:plug_window = 'enew'
call plug#begin('~/.config/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'aliou/bats.vim', { 'for': 'bats' }
Plug 'chrisbra/colorizer'
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'honza/vim-snippets'
Plug 'jamessan/vim-gnupg'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutFastWrap = '<C-]>'

Plug 'chrisbra/csv.vim'
let b:csv_arrange_align = 'l*'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_enable_locationlist = 0
nnoremap <silent>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-s> :Rg 
nnoremap <silent><C-f> :Files<CR>
nnoremap <silent><C-b> :Buffers<CR>
nnoremap <silent><C-h> :History<CR>
nnoremap <silent><C-q> :History/<CR>
nnoremap <silent><F9>  :History:<CR>
nnoremap <silent><BS>  :Helptags<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.75} }
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd FileType fzf set winblend=15

Plug 'arcticicestudio/nord-vim'
let g:nord_uniform_diff_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

Plug 'ollykel/v-vim', { 'for': 'v' }
let g:v_autofmt_bufwritepre = 1
autocmd Filetype vlang setlocal listchars+=tab:\ \ 

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_detect_spelllang = 0
let g:airline#extensions#whitespace#enabled = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.dirty=''

Plug 'tpope/vim-commentary'
autocmd FileType terraform setlocal commentstring=#\ %s
nmap <C-_> gcc
vmap <C-_> gcc
nmap <C-\> gcip

Plug 'tanvirtin/vgit.nvim'
nnoremap <silent> [c :VGit hunk_up<CR>
nnoremap <silent> ]c :VGit hunk_down<CR>
nnoremap <silent> go :VGit hunk_preview<CR>

Plug 'codeindulgence/vim-ranger'
let g:ranger_on_exit = 'bw!'
let g:ranger_open_mode = 'edit'

Plug 'codeindulgence/vim-tig'
let g:tig_executable = 'fish -c "tmuxpasskey dont tig status"'
let g:tig_default_command = ''
nnoremap <silent><C-G> :Tig<CR>

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent><C-J> :TmuxNavigateDown<cr>
nnoremap <silent><C-K> :TmuxNavigateUp<cr>
nnoremap <silent><C-L> :TmuxNavigateRight<cr>
inoremap <silent><C-J> <Esc>:TmuxNavigateDown<cr>
inoremap <silent><C-K> <Esc>:TmuxNavigateUp<cr>
inoremap <silent><C-L> <Esc>:TmuxNavigateRight<cr>

call plug#end()

" Colours
colorscheme nord
highlight ErrorMsg guibg=NONE guifg=#BF616A
highlight SpellBad guifg=NONE
highlight Search guibg=#434C5E guifg=NONE
highlight IncSearch guibg=#434C5E guifg=NONE gui=bold
highlight DiffAdd guibg=NONE
highlight DiffChange guibg=NONE
highlight DiffDelete guibg=NONE
highlight DiffText guibg=NONE

lua <<EOF
require('plugins')
EOF

" Hide UI elements for terminal apps
autocmd FileType vim-plug,ranger,tig set 
  \ showtabline=0 laststatus=0 nonumber norelativenumber signcolumn=no
  \| autocmd BufLeave <buffer> set
  \ showtabline=2 laststatus=2 number relativenumber signcolumn=yes
autocmd FileType gitcommit set nonumber norelativenumber
  \| let g:airline#extensions#tabline#enabled = 0

" Filetypes
autocmd BufEnter *.fish set filetype=fish
autocmd BufEnter *.ex set filetype=elixir

" Options set on buffer load
autocmd FileType markdown setlocal spell

" Restore window view on buffer change
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
