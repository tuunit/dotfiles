" ============================================================================ "
" Initialization                                                               "
" ============================================================================ "

" Use Vim settings, rather than Vi settings
set nocompatible

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

""
"" Other
""

" Don't reset cursor to start of line when moving around
set nostartofline

" Don't jump to the matching bracket upon bracket insert (default)
set noshowmatch

" Set <c-c> to escape in insert mode
inoremap <c-c> <esc>

" ============================================================================ "
" Appearance                                                                   "
" ============================================================================ "
" Enable syntax highlighting
syntax on

" Make it obvious where 80 characters is
" set textwidth=80
" set formatoptions=cq
set formatoptions=qrn1
set wrapmargin=0
"set colorcolumn=+1

" Line numbers
set number

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
" Backup                                                                       "
" ============================================================================ "

" Don't make a backup before overwriting file
set nobackup
set nowritebackup

" Disable swap files
set noswapfile
set updatecount=0

" ============================================================================ "
" Mappings
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
