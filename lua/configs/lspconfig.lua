require("nvchad.configs.lspconfig").defaults()

local servers = {
    "html",
    "cssls",
    "ts_ls",
    "rust_analyzer",
    "eslint",
    "bashls",
    "dockerls",
    "fish_lsp",
    "jsonls",
    "lua_ls",
    "pylsp",
    "yamlls",
    "vimls",
}

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
