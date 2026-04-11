-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",
}

M.ui = {
  tabufline = {
    enabled = true,
    lazyload = false,
    bufwidth = 36,
    modules = {
      treeOffset = function()
        local w = 0
        for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
            w = vim.api.nvim_win_get_width(win)
            break
          end
        end
        if w == 0 then return "" end

        local name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
        local pad = math.max(0, math.floor((w - #name) / 2))
        local label = string.rep(" ", pad) .. name
        label = label .. string.rep(" ", math.max(0, w - #label))

        return "%#NvimTreeTitle#" .. label .. "%#NvimTreeWinSeparator#" .. "│"
      end,
    },
  },
}

return M
