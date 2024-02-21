return {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    require('flutter-tools').setup {

      widget_guides = {
        enabled = true,
      },
      dev_tools = {
        autostart = true
      },
      lsp = {
        on_attach = require('keymaps.lsp-attach'),
        color = {
          enabled = true,
        },

      },
      decorations = {
        statusline = {
          project_config = true,
          app_version = true,
          device = true
        }
      }


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
      {
        name = 'Profile',
        flutter_mode = 'profile', -- possible values: `debug`, `profile` or `release`, defaults to `debug`
      }
    })
  end
}
