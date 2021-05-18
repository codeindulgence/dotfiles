syntax on
filetype plugin indent on

" General Options
set autowrite
set backspace=indent,eol,start
set nobackup
set nowritebackup
set cindent
set cinkeys-=0#
set cmdheight=2
set colorcolumn=80
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
set indentkeys-=0#
set lazyredraw
set list
set listchars=tab:▸\ ,extends:…,precedes:…,trail:∙,nbsp:∙
set mouse=a
set nojoinspaces
set nostartofline
set noswapfile
set nrformats=bin,hex,alpha
set number
set relativenumber
set report=0
set ruler
set scrolloff=2
set secure
set shell=sh
set shiftwidth=2
set shortmess+=c
set smartcase
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set ttimeout
set ttimeoutlen=100
set updatetime=300
set undofile
set wildignorecase
set wildmode=list:full

let mapleader = ' '

" Normal mode Mappings
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>v $v^
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
nnoremap <Leader><C-O> :e .<CR>
nnoremap ! :!
nnoremap <Leader>[ a -     <Esc>hhhR[ ]<Esc>A
nnoremap <Leader>] o<Backspace> -     <Esc>hhhR[ ]<Esc>A
nnoremap <Leader>x 0f[lrx:w<CR>
nnoremap <Leader>X 0f[lr<Space>:w<CR>
nnoremap <Leader>- a - 
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>a gg"+yG'.
nnoremap <Leader>s :GetHi<CR>
nnoremap <Leader>q gqip
nnoremap <Leader>g :Git 
nnoremap <Leader>_ yyp$v^r-
nnoremap <Leader>= yyp$v^r=
nnoremap <Leader>d :%g::d<Left><Left>

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
xnoremap <CR> "+y
xnoremap <Leader>y "+y
xnoremap <Leader>p "+p
xnoremap v <C-V>
xnoremap <C-V> v
xnoremap ; :
xnoremap : ;
xnoremap < <gv
xnoremap > >gv
xnoremap <C-B> '>a**'<i**'>

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
command! TabFix %s:	:  :
command! GetHi :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")

" Plugins
let g:plug_window = 'enew'
call plug#begin('~/.config/nvim/plugged')

" Fugitive
Plug 'tpope/vim-fugitive'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
inoremap <silent> <C-J> <Esc>:TmuxNavigateDown<cr>
inoremap <silent> <C-K> <Esc>:TmuxNavigateUp<cr>
inoremap <silent> <C-L> <Esc>:TmuxNavigateRight<cr>

" Password generator
command! -nargs=? Password execute ':read !pwgen -s' <args>

" GnuPG
Plug 'jamessan/vim-gnupg'

" Ranger
Plug 'Mizuchi/vim-ranger'
let g:ranger_on_exit = 'bw!'
let g:ranger_open_mode = 'edit'

" Tig
Plug 'codeindulgence/vim-tig'
nnoremap <C-G> :Tig<CR>

" Fish
Plug 'dag/vim-fish', { 'for': 'fish' }

" Base16 Colours
Plug 'chriskempson/base16-vim'

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" GitGutter
Plug 'airblade/vim-gitgutter'
set signcolumn=yes

" Commentary
Plug 'tpope/vim-commentary'
autocmd FileType terraform setlocal commentstring=#\ %s
nmap  gcc
vmap  gcc
nmap  gcip

" Typescript
Plug 'leafgarland/typescript-vim'

" Eunuch
Plug 'tpope/vim-eunuch'

" Surround
Plug 'tpope/vim-surround'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'
let g:AutoPairsShortcutFastWrap = '<C-]>'

" " Neomake
" Plug 'neomake/neomake'
" autocmd! BufWritePost * Neomake
" let g:neomake_open_list = 2

" Rust Filetype
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" CSV
Plug 'chrisbra/csv.vim'
let b:csv_arrange_align = 'l*'

" Find And Replace
Plug 'brooth/far.vim'
let g:far#source = 'agnvim'
let g:far#window_layout = 'bottom'
let g:far#window_height = 30
let g:far#file_mask_favorites = ['.', '%']
let g:far#result_preview = 0
let g:far#auto_preview = 0
nnoremap <Leader>f :F  .<Left><Left>

" Indent lines
Plug 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
nnoremap <Leader>\| :IndentLinesToggle<CR>

" bats.vim
Plug 'aliou/bats.vim'

" Abolish
Plug 'tpope/vim-abolish'

" vim-ps1
Plug 'PProvost/vim-ps1'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-s> :Rg 
nnoremap <Leader>; :History:<CR>
nnoremap q/ :History/<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)

" Configure fd as fzf search
" set -Ux FZF_DEFAULT_COMMAND 'fd --no-ignore-vcs -t f'

let g:fzf_layout = { 'window': { 'width': 1, 'height': 1} }
let g:fzf_preview_window = ['up:65%', 'ctrl-/']

" CoC
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_enable_locationlist = 0
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <s-enter> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

Plug 'jgdavey/tslime.vim'
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
nmap <S-Return> V<Plug>SendSelectionToTmux j
vmap <S-Return> <Plug>SendSelectionToTmux

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

" Colours
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif
highlight Search ctermbg=19 ctermfg=NONE

" Options set on buffer load
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Restore window view on buffer change
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
