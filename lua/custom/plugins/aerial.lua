return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  --
  keys = {
    { '<leader>X', '<cmd>AerialToggle!<CR>', desc = 'Symbols' },
  },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
}
