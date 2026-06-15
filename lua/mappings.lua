require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "<leader>x", function()
  local buf = vim.api.nvim_get_current_buf()
  local bufs = vim.fn.getbufinfo { buflisted = 1 }
  if #bufs > 1 then vim.cmd "bprevious" end
  vim.cmd("bdelete " .. buf)
end, { desc = "Close buffer" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- NvimTree toggle that remembers panel width
local _nvim_tree_width = 30
map("n", "<C-n>", function()
  local api = require "nvim-tree.api"
  if api.tree.is_visible() then
    for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
        _nvim_tree_width = vim.api.nvim_win_get_width(win)
        break
      end
    end
    api.tree.close()
  else
    api.tree.open()
    vim.schedule(function()
      for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
          vim.api.nvim_win_set_width(win, _nvim_tree_width)
          break
        end
      end
    end)
  end
end, { noremap = true, silent = true, desc = "nvimtree toggle window" })
