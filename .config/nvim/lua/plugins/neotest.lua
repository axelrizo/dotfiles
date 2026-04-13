return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'jfpedroza/neotest-elixir',
  },
  config = function()
    neotest = require 'neotest'

    neotest.setup { adapters = { require 'neotest-elixir' } }

    -- summary
    vim.keymap.set('n', '<leader>tt', function() neotest.summary.toggle { enter = true } end, { desc = '[t]oggle test summary' })

    -- running tests
    vim.keymap.set('n', '<leader>te', function() neotest.run.run() end, { desc = 'Run n[e]arest test' })
    vim.keymap.set('n', '<leader>ta', function() neotest.run.run { suite = true } end, { desc = 'Run [a]ll tests' })
    vim.keymap.set('n', '<leader>tl', function() neotest.run.run_last() end, { desc = 'Run [l]ast test' })
    vim.keymap.set('n', '<leader>tT', function() neotest.run.stop() end, { desc = '[T]erminate test' })
    vim.keymap.set('n', '<leader>tc', function() neotest.run.run(vim.fn.expand '%') end, { desc = '[c]urrent file' })
    vim.keymap.set('n', '<leader>tm', function() neotest.summary.run_marked() end, { desc = 'Run [m]arked tests' })

    -- output
    vim.keymap.set('n', '<leader>to', function() neotest.output.open { enter = true, auto_close = true } end, { desc = 'Show test [o]utput' })
    vim.keymap.set('n', '<leader>tO', function() neotest.output_panel.toggle() end, { desc = 'Toggle [O]utput panel' })
    vim.keymap.set('n', '<leader>tA', function() neotest.run.attach() end, { desc = '[A]ttach to running test' })

    -- jumping
    vim.keymap.set('n', '<leader>tn', function() neotest.jump.next() end, { desc = '[n]ext test' })
    vim.keymap.set('n', '<leader>tp', function() neotest.jump.prev() end, { desc = '[p]revious test' })
    vim.keymap.set('n', '<leader>tN', function() neotest.jump.next { status = 'failed' } end, { desc = '[N]ext failing test' })
    vim.keymap.set('n', '<leader>tP', function() neotest.jump.prev { status = 'failed' } end, { desc = '[P]revious failing test' })

    -- debugging
    vim.keymap.set('n', '<leader>td', function()
      neotest.summary.close()
      neotest.output_panel.close()
      neotest.run.run { suite = false, strategy = 'dap' }
    end, { desc = 'Debug nearest test' })
  end,
}
