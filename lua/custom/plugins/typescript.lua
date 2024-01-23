-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = vim.api.nvim_create_augroup('TS_organize_imports', { clear = true }),
--   desc = 'TS_organize_imports',
--   pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
--   callback = function()
--     vim.cmd [[TSToolsOrganizeImports]]
--     vim.cmd 'write'
--   end,
-- })
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
}
