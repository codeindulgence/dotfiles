syntax on
filetype plugin indent on

" General Options
set autowrite
set backspace=indent,eol,start
set breakindent
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
set inccommand=nosplit
set indentkeys-=0#
set lazyredraw
set linebreak
set list
set listchars=tab:▸\ ,extends:…,precedes:…,trail:∙,nbsp:∙
set mouse=a
set nobackup
set nojoinspaces
set nostartofline
set noswapfile
set nowritebackup
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
set wildmode=list:full

let mapleader = ' '

" Normal mode Mappings
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
nnoremap <Leader>v $v^o
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
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>a gg"+yG'.
nnoremap <Leader>s :GetHi<CR>
nnoremap <Leader>q gqip
nnoremap <Leader>g :Git 
nnoremap <Leader>- yyp$v^r-
nnoremap <Leader>= yyp$v^r=
nnoremap <Leader>d :%g::d<Left><Left>
nnoremap <Return> o<Esc>
nnoremap [s [S
nnoremap ]s ]S
nnoremap <Leader>l :set wrap!<CR>
nnoremap <M-w> :bw<CR>

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
xnoremap <silent> <CR> "+y:Copy<CR>
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
cnoreabbrev x bw

" Commands
command! -bar Reload :source ~/.config/nvim/init.vim
command! Install :Reload | :PlugInstall
command! TabFix %s:	:  :
command! GetHi :echo synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
command! Copy call Copy()

function! Copy()
  call setreg('+', trim(getreg('+')))
endfunction

" Plugins
let g:plug_window = 'enew'
call plug#begin('~/.config/nvim/plugged')

" Repeat
Plug 'tpope/vim-repeat'

" Fugitive
Plug 'tpope/vim-fugitive'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
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
let g:tig_executable = 'fish -c "tmuxpasskey dont tig"'
nnoremap <silent><C-G> :Tig<CR>

" Fish
Plug 'dag/vim-fish', { 'for': 'fish' }

" Colours
Plug 'arcticicestudio/nord-vim'
let g:nord_uniform_diff_background = 1

" Terraform
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }

" " GitGutter
" Plug 'airblade/vim-gitgutter'

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

" Rust Filetype
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" CSV
Plug 'chrisbra/csv.vim'
let b:csv_arrange_align = 'l*'

" bats.vim
Plug 'aliou/bats.vim'

" Abolish
Plug 'tpope/vim-abolish'

" fzf
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Configure fd as fzf search
" set -Ux FZF_DEFAULT_COMMAND 'fd --no-ignore-vcs -t f'
nnoremap <C-f> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-h> :History<CR>
nnoremap <C-s> :Rg
nnoremap <Leader>; :History:<CR>
nnoremap q/ :History/<CR>
imap <c-x><c-f> <plug>(fzf-complete-path)
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.5, 'yoffset': 1} }
let g:fzf_history_dir = '~/.local/share/fzf-history'
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

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

" Vlang
Plug 'ollykel/v-vim', { 'for': 'v' }
let g:v_autofmt_bufwritepre = 1
autocmd Filetype vlang setlocal listchars+=tab:\ \ 

" Elixir
Plug 'elixir-editors/vim-elixir'

" Ruby/Rails
Plug 'tpope/vim-rails'

" DB
Plug 'tpope/vim-dadbod'

" Colorizer
Plug 'chrisbra/colorizer'

" Airline
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

" Startify
Plug 'mhinz/vim-startify'
let g:startify_custom_header = ''
let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [
  \ '~/.config/nvim/init.vim',
  \ '~/.config/fish/config.fish',
  \ ]
let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ ]

" Dates
Plug 'tpope/vim-speeddating'

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

" Options set on buffer load
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd FileType markdown setlocal spell

" Restore window view on buffer change
autocmd BufLeave * let b:winview = winsaveview()
autocmd BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif
