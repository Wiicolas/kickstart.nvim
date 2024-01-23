-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '<leader>e', ':Neotree toggle<cr>', desc = 'Neotree' },
  },
  config = function()
    -- If you want icons for diagnostic errors, you'll need to define them somewhere:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵 ', texthl = 'DiagnosticSignHint' })

    require('neo-tree').setup {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the ta
      window = {
        mappings = {
          ['l'] = 'open',
        },
      },
      filesystem = {
        filtered_items = {
          visible = false, -- when true, they will just be displayed differently than normal items
          hide_dotfiles = false,
          hide_gitignored = false,
        },
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            added = require('custom.icon').GitAdd,
            deleted = require('custom.icon').GitDelete,
            modified = require('custom.icon').GitChange,
            renamed = require('custom.icon').GitRenamed,
            untracked = require('custom.icon').GitUntracked,
            ignored = require('custom.icon').GitIgnored,
            unstaged = require('custom.icon').GitUnstaged,
            staged = require('custom.icon').GitStaged,
            conflict = require('custom.icon').GitConflict,
          },
        },
      },
    }
  end,
}
