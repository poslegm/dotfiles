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
" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" File tree
Plug 'scrooloose/nerdtree'
" Colors
Plug 'nanotech/jellybeans.vim'
" Syntax checking
Plug 'w0rp/ale'
" Fast commenting
Plug 'scrooloose/nerdcommenter'
" For replace via (:Acks /foo/bar/) 
Plug 'wincent/ferret'
" for file search
Plug 'kien/ctrlp.vim'
" Auto-close brackets
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" for git changes
Plug 'airblade/vim-gitgutter'
" Python
Plug 'davidhalter/jedi-vim'
" some formats
Plug 'elzr/vim-json'
Plug 'tpope/vim-fireplace' 
Plug 'guns/vim-clojure-static' 
" for scala 
Plug 'derekwyatt/vim-scala'
Plug 'Chiel92/vim-autoformat' 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" for TS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
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
let g:airline_symbols.maxlinenr = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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

" Better display for messages
set cmdheight=2

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
autocmd Filetype scala setlocal ts=2 sw=2 autoindent
autocmd Filetype ts setlocal ts=2 sw=2 autoindent
autocmd Filetype ocaml setlocal ts=2 sw=2 autoindent
autocmd Filetype sh setlocal ts=2 sw=2 autoindent

" enable plugins by filetypes
filetype plugin on 
filetype plugin indent on

" autocomplete
set cpt=.,b,w,i

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

map ]b :bn<cr>
map [b :bp<cr>
nmap db :bd<cr>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

nmap <silent> <leader><leader> :NERDTreeToggle<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <C-_> :call nerdcommenter#Comment(0,"toggle")<CR>

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

let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn|metals|bloop|ensime|idea))|(target|project\/target|node_modules|dist)$'

" =============== Languages =============== 
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat = 0

autocmd FileType python nnoremap <leader>= :0,$!yapf<CR>
let g:ale_linters = {
\   'go': ['go build', 'go vet'],
\   'javascript': ['eslint'],
\   'python': ['flake8']
\}

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

let g:formatdef_scalafmt = "'scalafmt --stdin 2>/dev/null'"
let g:formatters_scala = ['scalafmt']

set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c
" =============== Languages end =============== 

" =============== CoC and Metals =============== 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add status line support, for integration with other plugins, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Use <C-n>, <C-p>, <up> and <down> to navigate completion list: >
inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(1) : "\<down>"
inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(1) : "\<up>"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsBuild<CR>
