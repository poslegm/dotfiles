set nocompatible
filetype off

let $PATH = $PATH . ':' . expand("~/.local/bin")

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" =============== Plugins start =============== 

" Utils
Plugin 'VundleVim/Vundle.vim'
" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Shell
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
" File tree
Plugin 'scrooloose/nerdtree'
" File search
Plugin 'kien/ctrlp.vim'
" Git
Plugin 'tpope/vim-fugitive'
" Colors
Plugin 'nanotech/jellybeans.vim'
" Autocomplete
Plugin 'Shougo/neocomplete.vim'
Plugin 'ervandew/supertab'
" Syntax checking
Plugin 'w0rp/ale'
" lexical check
Plugin 'reedes/vim-lexical'
" exuberant-ctags
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
" Fast commenting
Plugin 'scrooloose/nerdcommenter'
" For :UndotreeToggle
Plugin 'mbbill/undotree'
" For :Replace 
Plugin 'dkprice/vim-easygrep'
" Auto-close brackets
Plugin 'Townk/vim-autoclose'
Plugin 'alvan/vim-closetag'
" Python
Plugin 'davidhalter/jedi-vim'
" some formats
Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'fatih/vim-go'
Plugin 'neovimhaskell/haskell-vim'

" =============== Plugins end =============== 
call vundle#end()

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

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

set history=500
set undolevels=500

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype scala setlocal ts=2 sw=2 autoindent
autocmd Filetype sh setlocal ts=2 sw=2 autoindent

" enable plugins by filetypes
filetype plugin on 
filetype plugin indent on

" autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#sources#syntax#min_keyword_length = 3

" auto close buffers after cursor movement
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" auto close html tags
let g:closetag_html_style=1 

let g:easytags_async = 1

let g:lexical#spell = 1
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spelllang = ['en_us', 'ru_ru',]

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
nmap <silent> <leader>z :UndotreeToggle<CR>
nmap <F6> :TagbarToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <C-_> :call NERDComment(0,"toggle")<CR>
vnoremap <C-_> :call NERDComment(0,"toggle")<CR>

" =============== Utils =============== 
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

if filereadable(expand("~/.vimrc.after"))
  source ~/.vimrc.after
endif

" =============== Languages =============== 
autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
