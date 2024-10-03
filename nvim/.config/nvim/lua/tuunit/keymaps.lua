function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Space as leader
vim.g.mapleader = " "
Map("n", "<leader>pv", vim.cmd.Ex)

-- Sudo write with :W
vim.api.nvim_create_user_command('W', function()
    vim.cmd("exec ':silent w !sudo tee % > /dev/null' | :edit!")
end, {})

-- Show list symbols
Map("n", "<leader>l", ":set list!<CR>")

-- Navigate properly when lines are wrapped
Map("n", "j", "gj")
Map("n", "k", "gk")

-- Navigate / Jump half pages
Map("n", "<C-u>", "<C-u>zz")
Map("n", "<C-d>", "<C-d>zz")

-- Keep cursor in the middle when searching
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

-- Remove search highlight with enter
Map("n", "<CR>", ":nohlsearch<CR>:<backspace>")

-- Move code blocks in visual mode
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

-- Indentation in visual mode
Map("v", "<Tab>", ">gv")
Map("v", "<S-Tab>", "<gv")

-- Append lines and keep cursor in place
Map("n", "J", "mzJ`z")

-- paste without overwriting current buffer
Map("x", "<leader>p", "\"_dP")

-- Copy to system clipboard
Map("n", "<leader>y", "\"+y")
Map("v", "<leader>y", "\"+y")

-- Deactivate visual symetric mode
Map("n", "Q", "<nop>")


-- Navigate splits
Map("n", "<C-k>", ":wincmd k<CR>")
Map("n", "<C-j>", ":wincmd j<CR>")
Map("n", "<C-h>", ":wincmd h<CR>")
Map("n", "<C-l>", ":wincmd l<CR>")

-- Browser
Map("n", "<leader>b", ":NvimTreeOpen<CR>")
Map("n", "<leader>e", ":NvimTreeClose<CR>")
