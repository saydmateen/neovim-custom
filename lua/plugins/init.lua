return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "markdown" },
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.auto_install = true
      vim.list_extend(opts.ensure_installed, {
        -- Web
        "html", "css", "javascript", "typescript", "tsx",
        "json", "jsonc", "yaml", "toml",
        -- Rust
        "rust",
        -- C# / .NET
        "c_sharp",
        -- Shell / Config
        "bash", "fish", "dockerfile",
        "gitignore", "gitcommit",
        -- Markup
        "markdown", "markdown_inline",
        -- Query / Data
        "sql", "graphql",
        -- Systems
        "c", "cpp",
      })
      return opts
    end,
  },
}
