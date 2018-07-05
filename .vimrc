" ============================================================================ "
" Initialization                                                               "
" ============================================================================ "

" Use Vim settings, rather than Vi settings
set nocompatible

" Load plugins with Pathogen
runtime autoload/pathogen.vim
execute pathogen#infect()

" Enable file type detection and load plugin indent files
filetype plugin indent on

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Set Spacebar as <leader>
let mapleader = " "

" ============================================================================ "
" Editing                                                                      "
" ============================================================================ "

""
"" Whitespace
""

set backspace=2     " Backspace deletes like most programs in insert mode
set expandtab       " Tab in insert mode will produce spaces
set tabstop=4       " Width of a tab
set shiftwidth=4    " Width of reindent operations and auto indentation
set softtabstop=4   " Set spaces for tab in insert mode
set autoindent      " Enable auto indentation

" Invisible characters
"set listchars=tab:▸\ ,nbsp:_
"set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Don't show invisible characters (default)
set nolist

" Toggle set list
nnoremap <leader>l :set list!<cr>

""
"" Wrapping
""

set wrap            " Enable wrapping
set showbreak=↪\    " Character to precede line wraps

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif

" Use only 1 space after "." when joining lines instead of 4
set nojoinspaces

" Enable mouse for scrolling
set mouse=a

""
"" Other
""

" Don't reset cursor to start of line when moving around
set nostartofline

" Don't jump to the matching bracket upon bracket insert (default)
set noshowmatch

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Set <c-c> to escape in insert mode
inoremap <c-c> <esc>

" Set <c-j> to underscore in insert mode
inoremap <c-j> _

" ============================================================================ "
" Appearance                                                                   "
" ============================================================================ "

syntax on                           " Enable syntax highlighting
set t_Co=16                         " 16 Colors
" Solarized dark
set background=dark
colorscheme solarized
let g:solarized_termcolors=16

" Airline - Powerline with Source Code Pro Font and FontAwesome Glyphicons
let g:airline_powerline_fonts=1
set guifont=Source\ Code\ Pro\ for\ Powerline:h12
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Make it obvious where 80 characters is
set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
set colorcolumn=+1

" Line numbers
set number
set relativenumber

" Scrolling
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto resize Vim splits to active split
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

""
"" Other
""
set title           " Show the filename in the window titlebar
set ruler           " show the cursor position all the time
set shortmess=atI   " Don't show the Vim intro message
set showmatch       " Show matching brackets
set laststatus=2    " Always display the status line

" ============================================================================ "
" Windows                                                                      "
" ============================================================================ "

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker window movement
nnoremap <S-h> gT
nnoremap <S-l> gt

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" resize panes
nnoremap <silent> <Right> :vertical resize +5<cr>
nnoremap <silent> <Left> :vertical resize -5<cr>
nnoremap <silent> <Up> :resize +5<cr>
nnoremap <silent> <Down> :resize -5<cr>

" ============================================================================ "
" Command Line                                                                 "
" ============================================================================ "

" Display incomplete commands below the status line
set showcmd

" Remember more commands and search history (default: 20)
set history=100

" <c-a> jumps to beginning of line to match <c-e>
" cnoremap <c-a> <home>

" Save with sudo and reload
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!

""
"" Search
""

set gdefault                    " Never have to type /g at the end of search
set ignorecase                  " Case insensitive searching (unless specified)
set smartcase                   " ...unless they contain at least one uppercase
set hlsearch                    " Highlight searches
set incsearch                   " Start searching as you type

" Stop highlighting after searching
"nnoremap <silent> <leader>, :noh<cr>

" Clear last search highlighting with enter and clear the command line
function! MapCR()
    nnoremap <cr> :nohlsearch<cr>:<backspace>
endfunction
call MapCR()

" ============================================================================ "
" Buffers                                                                      "
" ============================================================================ "

" Allow unsaved background buffers and remember marks/undo for them
set hidden

" Auto-reload buffers when files are changed on disk
set autoread

" Automatically :write before running commands
set autowrite

" Trigger autoread when changing buffers or coming back to vim in terminal.
au FocusGained,BufEnter * :silent! !

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" ============================================================================ "
" Registers                                                                    "
" ============================================================================ "

" Use the OS clipboard by default
set clipboard=unnamed

" Copy to X11 primary clipboard
map <leader>y "*y

" Repeat the last macro in the q register
nmap <leader>2 @q

" ============================================================================ "
" Backup                                                                       "
" ============================================================================ "

" Don't make a backup before overwriting file
set nobackup
set nowritebackup

" Disable swap files
set noswapfile
set updatecount=0

" ============================================================================ "
" Plugin Settings and Mappings
" ============================================================================ "

" Auto format
map <F7> mzgg=G`z 

" Smoother terminal transition
nnoremap <C-d> :sh<cr>

" Use tab to jump between brackets, because it's easier
nnoremap <tab> %
vnoremap <tab> %

"HTML Editing
set matchpairs+=<:>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Surround
nmap <leader>` ysiw`
nmap <leader>" ysiw"
nmap <leader>' ysiw'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

map <C-n> :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1


" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Enable omni completion.
autocmd FileType python NeoComplCacheLock
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" Uncrustify
autocmd FileType c noremap <buffer> <c-f> :call Uncrustify('c')<CR>
autocmd FileType c vnoremap <buffer> <c-f> :call RangeUncrustify('c')<CR>
autocmd FileType cpp noremap <buffer> <c-f> :call Uncrustify('cpp')<CR>
autocmd FileType cpp vnoremap <buffer> <c-f> :call RangeUncrustify('cpp')<CR>

" Spellchecking
au BufNewFile,BufRead,BufEnter   *.tex     setlocal spell    spelllang=en_gb,de_de
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=en_gb
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=en_gb
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=en_gb
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_gb

au BufReadPost,BufNewFile *.md,*.txt,*.tex,README,*.wiki nnoremap <Tab> :bnext<CR>
au BufReadPost,BufNewFile *.md,*.txt,*.tex,README,*.wiki nnoremap <S-Tab> :bprevious<CR>
