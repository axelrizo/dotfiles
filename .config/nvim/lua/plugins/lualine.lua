return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local statusline = require 'arrow.statusline'

    require('lualine').setup {
      options = {
        theme = 'auto',
        ignore_focus = {
          'dapui_watches',
          'dapui_stacks',
          'dapui_scopes',
          'dapui_breakpoints',
          'dapui_console',
          'dap-repl',
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = {
          'filetype',
          {
            function()
              return statusline.text_for_statusline_with_icons() -- Same, but with an bow and arrow icon ;Dd,
            end,
          },
        },
        lualine_y = { { 'lsp_status', ignore_lsp = { 'null-ls' }, show_name = false } },
        lualine_z = { 'location' },
      },
      -- winbar = {
      --   lualine_a = { 'buffers' },
      --   lualine_z = {},
      -- },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
