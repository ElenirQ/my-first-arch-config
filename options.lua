--- Local var:

-- nvim data dir
local home = vim.fn.stdpath("data")  -- ~/.local/share/nvim

-- Swap dir
local swap_dir   = home .. "/swap//"

-- Backup dir
local backup_dir = home .. "/backup//"

-- Undo dir
local undo_dir   = home .. "/undo//"

-- Is deleate old swap files when open file
local clean_old_swaps = true


--- Create folders:

-- Swap dir
vim.fn.mkdir(swap_dir, "p")

-- Backup dir
vim.fn.mkdir(backup_dir, "p")

-- Undo dir
vim.fn.mkdir(undo_dir, "p")


---Other:

-- Swap 
vim.opt.swapfile = true
vim.opt.directory = swap_dir

-- Backup 
vim.opt.backup = true
vim.opt.backupdir = backup_dir

-- Undo 
vim.opt.undofile = true
vim.opt.undodir = undo_dir

--Set update count
vim.opt.updatecount = 50

-- Set update time in ms
vim.opt.updatetime = 300

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Enable numbers and relative numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Space instead of Tab
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- Auto indent
vim.opt.smartindent = true

-- 24-bit color 
vim.opt.termguicolors = true

-- Disable warp
vim.opt.wrap = false

-- Leaves a lines at the top and bottom
vim.opt.scrolloff = 8

--  Enables the column for icons 
vim.opt.signcolumn = "yes"

-- Map <leader>
vim.g.mapleader = " "

-- Map <localleader>
vim.g.maplocalleader = "\\"

-- Highlights the line where the cursor
vim.opt.cursorline = true

-- Allows copy/paste between Neovim and the system clipboard
vim.opt.clipboard = "unnamedplus"

-- Horisontal windows open below
vim.opt.splitbelow = true

-- Vertical windows open right
vim.opt.splitright = true

-- Highlighting of found matches
vim.opt.hlsearch = true

-- Search while typing
vim.opt.incsearch = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- If there are uppercase letters — the search is case sensitive
vim.opt.smartcase = true

-- Save undo history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo"

-- Create column at 80 simbol
vim.opt.colorcolumn = "80"

-- Auto saves
vim.opt.autowrite = false

-- This will help turn on the backlight
vim.cmd("syntax enable")

-- Disable error beep
vim.opt.errorbells = false

-- Enable brief visual flicker
vim.opt.visualbell = true

--Mouse works in all modes
vim.opt.mouse = "a"
 
--- Functions

-- Deleate old swap files when open file 
if clean_old_swaps then
    vim.api.nvim_create_autocmd("BufReadPre", {
        callback = function()
            local fname = vim.fn.expand("%:p")
            if fname ~= "" then
                local escaped = fname:gsub("/", "%%") -- escape для swap формату
                local pattern = swap_dir .. "/%" .. escaped .. ".*.sw?"
                for _, f in ipairs(vim.fn.glob(pattern, 1, 1)) do
                    vim.fn.delete(f)
                end
            end
        end
    })
end

