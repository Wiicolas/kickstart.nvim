return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
  },
  config = function()
    -- Lua
    vim.keymap.set('n', '<leader>tt', function()
      require('trouble').toggle 'workspace_diagnostics'
    end)
    vim.keymap.set('n', '[t', function()
      require('trouble').next { skip_groups = true, jump = true }
    end)
    vim.keymap.set('n', ']t', function()
      require('trouble').previous { skip_groups = true, jump = true }
    end)
  end,
}
