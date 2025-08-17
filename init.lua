-- =====================
-- Basic Neovim Settings
-- =====================

-- Line numbers
vim.o.number = true          -- show absolute line numbers
vim.o.relativenumber = true  -- show relative numbers

-- Tabs & indentation
vim.o.tabstop = 4            -- number of spaces tabs count for
vim.o.shiftwidth = 4         -- spaces for each indent
vim.o.expandtab = true       -- convert tabs to spaces
vim.o.smartindent = true     -- auto-indent new lines

-- Search
vim.o.ignorecase = true      -- ignore case when searching
vim.o.smartcase = true       -- but make search case-sensitive if you type caps
vim.o.hlsearch = true        -- highlight search matches
vim.o.incsearch = true       -- show matches as you type

-- UI
vim.o.cursorline = true      -- highlight current line
vim.o.wrap = false           -- don't wrap long lines
vim.o.scrolloff = 8          -- keep cursor away from edges
vim.o.termguicolors = true   -- enable 24-bit colors

-- Mouse & clipboard
vim.o.mouse = "a"            -- enable mouse in all modes
vim.o.clipboard = "unnamedplus" -- use system clipboard

-- Disable swap/backup files
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- initialize space as leader
vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- File explorer
  "nvim-tree/nvim-tree.lua",
  "nvim-tree/nvim-web-devicons",

  -- Fuzzy finder
  "nvim-telescope/telescope.nvim",

  -- Syntax highlighting
  "nvim-treesitter/nvim-treesitter",
})

-- After your lazy setup
require("nvim-tree").setup()

-- Keymap: toggle file explorer with <leader>e
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
