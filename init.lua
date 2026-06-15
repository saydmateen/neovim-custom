vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme (compile cache on first run or after wipe)
if not vim.uv.fs_stat(vim.g.base46_cache) then
  require("base46").load_all_highlights()
end
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")


require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local is_directory = vim.fn.isdirectory(data.file) == 1
    if is_directory then
      vim.cmd.cd(data.file)
      require("nvim-tree.api").tree.open()
    end
  end,
})

-- jj to escape insert mode
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Save with Ctrl+S
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<CR>', { noremap = true, silent = true })

-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Stay in indent mode when indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Move lines up and down in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { noremap = true, silent = true })

-- Delete without yanking to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', '"_d', { noremap = true, silent = true })

-- Center screen when jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

-- Center screen on search results
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- Go to beginning and end of line
vim.keymap.set('n', 'H', '^', { noremap = true, silent = true })
vim.keymap.set('n', 'L', '$', { noremap = true, silent = true })

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G', { noremap = true, silent = true })

-- Duplicate line
vim.keymap.set('n', '<leader>dl', 'yyp', { noremap = true, silent = true })

-- LSP Specific --
-- Go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })

-- Hover documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

-- Render markdown
vim.keymap.set('n', '<leader>md', '<cmd>RenderMarkdown toggle<CR>', { noremap = true, silent = true })
