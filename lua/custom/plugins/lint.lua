return {
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup {

        ensure_installed = {
          'djlint',
          'jsonlint',
          'php-cs-fixer',
          'phpcbf',
          'prettier',
          'prettierd',
          'stylua',
          'twigcs',
          'yamllint',
        },

        -- if set to true this will check each tool for updates. If updates
        -- are available the tool will be updated. This setting does not
        -- affect :MasonToolsUpdate or :MasonToolsInstall.
        -- Default: false
        auto_update = true,

        -- automatically install / update on startup. If set to false nothing
        -- will happen on startup. You can use :MasonToolsInstall or
        -- :MasonToolsUpdate to install tools and check for updates.
        -- Default: true
        run_on_start = true,

        -- set a delay (in ms) before the installation starts. This is only
        -- effective if run_on_start is set to true.
        -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
        -- Default: 0
        start_delay = 3000, -- 3 second delay

        -- Only attempt to install if 'debounce_hours' number of hours has
        -- elapsed since the last time Neovim was started. This stores a
        -- timestamp in a file named stdpath('data')/mason-tool-installer-debounce.
        -- This is only relevant when you are using 'run_on_start'. It has no
        -- effect when running manually via ':MasonToolsInstall' etc....
        -- Default: nil
        debounce_hours = 5, -- at least 5 hours between attempts to install/update
      }
    end,
  },
  {
    'mfussenegger/nvim-lint',
    -- lazy = true,
    event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    config = function()
      require('lint').linters_by_ft = {
        fish = { 'fish' },
        bash = { 'shellcheck' },
        go = { 'golangcilint' },
        markdown = { 'vale', 'markdownlint' },
        python = { 'ruff', 'mypy' }, -- flake8 a bit too strict
        rst = { 'rstcheck' },
        sh = { 'shellcheck' },
        -- tex = { "chktex" },
        zsh = { 'shellcheck' },
        -- javascript = { 'eslint_d' },
        -- javascriptreact = { 'eslint_d' },
        -- typescript = { 'eslint_d' },
        -- typescriptreact = { 'eslint_d' },
        -- brew install yamllint
        yaml = { 'yamllint' },
        -- npm install jsonlint -g
        json = { 'jsonlint' },
        php = { 'php' },
        twig = { 'twigcs' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave', 'BufEnter' }, {
        callback = function()
          require('lint').try_lint(nil, { ignore_errors = true })
        end,
      })
    end,
  },
}
