local tmux_char = {
  function()
    -- check if current pane is zoomed
    local result = io.popen "tmux list-panes -F '#F' | grep Z"

    if result ~= nil and result:read '*a' ~= '' then
      result:close()
      return '■■' --current pane is zoomed
    else
      return '■' -- not zoomed
    end
  end,
  padding = { left = 1, right = 1 }, -- We don't need space before this
  cond = function() return os.getenv 'TMUX' ~= nil end,
  on_click = function() os.execute 'tmux resize-pane -Z' end,
}

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local statusline = require 'arrow.statusline'

    -- TROUBLE
    local trouble = require 'trouble'
    local symbols = trouble.statusline {
      mode = 'lsp_document_symbols',
      groups = {},
      title = false,
      filter = { range = true },
      format = '{kind_icon}{symbol.name:Normal}',
      -- The following line is needed to fix the background color
      -- Set it to the lualine section you want to use
      hl_group = 'lualine_c_normal',
    }
    -- TROUBLE END

    require('lualine').setup {
      options = {
        globalstatus = true,
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
        lualine_c = {
          { 'filename', path = 1 },
          -- { symbols.get, cond = symbols.has }
        },
        lualine_x = {
          tmux_char,
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
