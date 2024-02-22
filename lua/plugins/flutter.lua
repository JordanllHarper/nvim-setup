local flutter_key_bindings = function()
  vim.keymap.set('n', '<leader>frl', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[L]oad' })
  vim.keymap.set('n', '<leader>frs', require('flutter-tools.commands').reload, { desc = '[F]lutter [R]e[S]tart' })
  vim.keymap.set('n', '<leader>fs', require('flutter-tools.commands').run, { desc = '[F]lutter [S]tart (Run)' })
  vim.keymap.set('n', '<leader>fq', require('flutter-tools.commands').quit, { desc = '[F]lutter [Q]uit' })
  vim.keymap.set('n', '<leader>fe', ":FlutterEmulators", { desc = '[F]lutter [E]mulators' })
  vim.keymap.set('n', '<leader>fo', require('flutter-tools.outline').toggle, { desc = '[F]lutter [O]utline' })
end
return {
  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {
      lsp = {
        on_attach = flutter_key_bindings,
        color = {
          enabled = true,
        },
      },
      widget_guides = {
        enabled = true,
      },
    }
    require('flutter-tools').setup_project({
      {
        name = 'Mobile',                  -- an arbitrary name that you provide so you can recognise this config
        target = 'lib/main_preProd.dart', -- your target
        flavor = 'preProd',
        device = 'emulator-5556',         -- the device ID, which you can get by running `flutter devices`
        dart_define = {
          API_URL = 'https://dev.example.com/api',
          IS_DEV = true,
        },
        dart_define_from_file = 'config.json' -- the path to a JSON configuration file
      },

      {
        name = 'Tablet',                  -- an arbitrary name that you provide so you can recognise this config
        target = 'lib/main_preProd.dart', -- your target
        device = 'emulator-5554',         -- the device ID, which you can get by running `flutter devices`
        dart_define = {
          API_URL = 'https://dev.example.com/api',
          IS_DEV = true,
        },
        dart_define_from_file = 'config.json' -- the path to a JSON configuration file
      },
      {
        name = 'Web',
        device = 'chrome',
        flavor = 'preProd',
        target = 'lib/main_preProd.dart', -- your target
        web_port = 5000
      },
    })
  end
}
