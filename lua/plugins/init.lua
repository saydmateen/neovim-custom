return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.view = opts.view or {}
      opts.view.preserve_window_proportions = false
      return opts
    end,
  },
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
    "kawre/leetcode.nvim",
    lazy = false,
    build = ":TSUpdate html",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "python3",
    },
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
        -- Lua (config)
        "lua",
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
