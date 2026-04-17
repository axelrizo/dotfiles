return {
  'nickjvandyke/opencode.nvim',
  version = '*', -- Latest stable release
  dependencies = {
    {
      -- `snacks.nvim` integration is recommended, but optional
      ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
      'folke/snacks.nvim',
      optional = true,
      opts = {
        input = {}, -- Enhances `ask()`
        picker = { -- Enhances `select()`
          actions = {
            opencode_send = function(...) return require('opencode').snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ['<a-a>'] = { 'opencode_send', mode = { 'n', 'i' } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any; goto definition on the type or field for details
    }

    vim.o.autoread = true -- Required for `opts.events.reload`

    -- Recommended/example keymaps
    vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = '[a]sk opencode…' })
    vim.keymap.set({ 'n', 'x' }, '<leader>oe', function() require('opencode').select() end, { desc = '[e]xecute opencode action…' })
    vim.keymap.set({ 'n', 't' }, '<leader>oo', function() require('opencode').toggle() end, { desc = 't[o]ggle opencode' })

    vim.keymap.set({ 'n', 'x' }, '<leader>or', function() return require('opencode').operator '@this ' end, { desc = 'Add [r]ange to opencode', expr = true })
    vim.keymap.set('n', '<leader>ol', function() return require('opencode').operator '@this ' .. '_' end, { desc = 'Add [l]ine to opencode', expr = true })

    vim.keymap.set('n', '<leader>ou', function() require('opencode').command 'session.half.page.up' end, { desc = 'Scroll opencode [u]p' })
    vim.keymap.set('n', '<leader>od', function() require('opencode').command 'session.half.page.down' end, { desc = 'Scroll opencode [d]own' })

    -- -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
    -- vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment under cursor', noremap = true })
    -- vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement under cursor', noremap = true })
  end,
}
