----------------------------
-- Editing
----------------------------
vim.opt.guicursor = "" -- Fat cursor

-- Whitespace
vim.opt.expandtab = true  -- Tab in insert mode will produce spaces
vim.opt.tabstop = 2       -- Width of a tab
vim.opt.softtabstop = 2   -- Set spaces for tab in insert mode
vim.opt.shiftwidth = 2    -- Width of reindent operations and auto indentation
vim.opt.autoindent = true -- Enable auto indentation

-- Invisible characters
-- set listchars=tab:▸\ ,nbsp:_
-- set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮
vim.opt.listchars = 'tab:▸ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮'

-- Wrapping
vim.opt.wrap = true -- Enable wrapping
vim.opt.showbreak = "↪" -- Character to precede line wraps

-- Backspace
vim.opt.backspace = "indent,eol,start"

----------------------------
-- Search
----------------------------
vim.opt.gdefault = true   -- Never have to type /g at the end of search
vim.opt.ignorecase = true -- Case insensitive searching (unless specified)
vim.opt.smartcase = true  -- ...unless they contain at least one uppercase
vim.opt.hlsearch = true   -- Highlight searches
vim.opt.incsearch = true  -- Start searching as you type

----------------------------
-- Appearance
----------------------------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Scrolling
vim.opt.scrolloff = 8 -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

-- Open new split panes to right and bottom, which feels more natural
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Auto resize Vim splits to active split
vim.opt.winwidth = 84
vim.opt.winheight = 5
vim.opt.winminheight = 5
vim.opt.winheight = 999


-- Other
vim.opt.wrapmargin = 0
vim.opt.formatoptions = 'qrn1'
vim.opt.colorcolumn = "120"
vim.opt.title = true      -- Show the filename in the window titlebar
vim.opt.ruler = true      -- show the cursor position all the time
vim.opt.shortmess = "atI" -- Don't show the Vim intro message
vim.opt.showmatch = true  -- Show matching brackets
vim.opt.laststatus = 2    -- Always display the status line

----------------------------
-- Backup
----------------------------
vim.opt.updatecount = 0
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
