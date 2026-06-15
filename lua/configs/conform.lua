local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- Web
    html = { "prettier" },
    css = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    -- Rust
    rust = { "rustfmt" },
    -- Python
    python = { "ruff_format" },
    -- C#
    cs = { "csharpier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

return options
