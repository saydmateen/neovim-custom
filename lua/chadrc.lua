-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_dark",

  hl_override = {
    IblScopeChar = { fg = "#36A3D9" },
  },
}

M.ui = {
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },

  tabufline = { enabled = false },
}

M.mason = {
  pkgs = {
    -- LSP servers
    "pyright",
    "omnisharp",
    "taplo",
    -- Formatters
    "stylua",
    "prettier",
    "rustfmt",
    "ruff",
    "csharpier",
  },
}

return M
