set nocompatible
filetype off
set encoding=utf-8

let $PATH = $PATH . ':' . expand("~/.local/bin")

" plugin manager installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" ============= Vim-Plug begin =============== 
" Utils
Plug 'VundleVim/Vundle.vim'
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File tree
Plug 'scrooloose/nerdtree'
" Colors
Plug 'nanotech/jellybeans.vim'
" Syntax checking
Plug 'w0rp/ale'
" lexical check
Plug 'reedes/vim-lexical'
" Fast commenting
Plug 'scrooloose/nerdcommenter'
" For replace via (:Acks /foo/bar/) 
Plug 'wincent/ferret'
" for file search
Plug 'kien/ctrlp.vim'
" Auto-close brackets
Plug 'Townk/vim-autoclose'
Plug 'alvan/vim-closetag'
" Python
Plug 'davidhalter/jedi-vim'
" some formats
Plug 'elzr/vim-json'
Plug 'tpope/vim-fireplace' 
Plug 'guns/vim-clojure-static' 
" for scala (metals)
Plug 'derekwyatt/vim-scala'
Plug 'natebosch/vim-lsc'
Plug 'Chiel92/vim-autoformat' 

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
endif
" =============== Vim-Plug end =============== 
call plug#end()

" =============== Visual =============== 
set t_Co=256
colorscheme jellybeans

syntax on
set number
set cursorline
set hlsearch
set incsearch
set wildmenu
set visualbell

if has('mouse')
  set mouse=a
endif

" status line
set laststatus=2
let g:airline_theme='minimalist'
let g:airline_section_warning=airline#section#create(['ycm_warning_count']) 
" font settings for airline
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''


function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

" =============== Editor =============== 
set nowrap
set ignorecase " ignore case on search
set smartcase " gnore case if search pattern is all lowercase, case-sens otherwise

set lazyredraw " don't redraw while executing macros (good performance config)
set hidden " hide buffers instead of closing

set nobackup
set noswapfile

set nospell
let g:lexical#dictionary = []

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

set history=500
set undolevels=500

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype scala setlocal ts=2 sw=2 autoindent
autocmd Filetype ocaml setlocal ts=2 sw=2 autoindent
autocmd Filetype sh setlocal ts=2 sw=2 autoindent

" enable plugins by filetypes
filetype plugin on 
filetype plugin indent on

" autocomplete
let g:deoplete#enable_at_startup = 1
set cpt=.,b,w,i
call deoplete#custom#option('ignore_sources', {'_': ['tag']})

" auto close buffers after cursor movement
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" auto close html tags
let g:closetag_html_style=1 

" russian keymap
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
" =============== Shortcuts =============== 
let mapleader=","

" Copy and past over clipboards
vmap <F2> "+y
nmap <F3> "+p

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

nmap <silent> // :nohlsearch<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" toggle wrap and nowrap
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

noremap <C-S-L> :Autoformat<CR>

" keyboard layout switch in insert mode
imap <C-z> <C-^>
" =============== Utils =============== 
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" =============== Languages =============== 
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
let g:ale_linters = {
\   'go': ['go build', 'go vet'],
\   'javascript': ['eslint'],
\   'python': ['flake8']
\}

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Configuration for vim-lsc
let g:lsc_enable_autocomplete = v:false
let g:lsc_server_commands = {
  \  'scala': {
  \    'command': 'metals-vim',
  \    'log_level': 'Log'
  \  }
  \}
let g:lsc_auto_map = {
  \  'GoToDefinition': 'gd',
  \}

let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']
