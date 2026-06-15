require("nvchad.configs.lspconfig").defaults()

local servers = {
  -- Web
  "html",
  "cssls",
  "ts_ls",
  "eslint",
  "jsonls",
  -- Rust
  "rust_analyzer",
  "taplo",        -- TOML (Cargo.toml, config files)
  -- Python
  "pyright",      -- replaces pylsp: better type checking and completions
  -- C#
  "omnisharp",
  -- Shell / Config
  "bashls",
  "dockerls",
  "fish_lsp",
  "yamlls",
  -- Misc
  "lua_ls",
  "vimls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
