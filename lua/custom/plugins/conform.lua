return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  opts = {
    formatters_by_ft = {
      -- Conform will run multiple formatters sequentially
      -- Use a sub-list to run only the first available formatter
      css = { { 'prettierd', 'prettier' } },
      graphql = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      javascript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      lua = { 'stylua' },
      php = { 'php_cs_fixer', 'phpcbf' },
      python = { 'isort', 'black' },
      rust = { 'rustfmt' },
      twig = { 'djlint' },
      typescript = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      yaml = { { 'prettierd', 'prettier' } },
    },
    format_on_save = {
      lsp_fallback = true,
    },
  },
}
