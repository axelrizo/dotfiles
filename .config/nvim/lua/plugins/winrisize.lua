return {
  'pogyomo/winresize.nvim',
  config = function()
    local resize = function(win, amt, dir)
      return function() require('winresize').resize(win, amt, dir) end
    end

    vim.keymap.set('n', '<leader><left>', resize(0, 4, 'left'), { desc = 'Resize to the left' })
    vim.keymap.set('n', '<leader><right>', resize(0, 4, 'right'), { desc = 'Resize to the right' })

    vim.keymap.set('n', '<leader><down>', resize(0, 2, 'down'), { desc = 'Resize to the down' })
    vim.keymap.set('n', '<leader><up>', resize(0, 2, 'up'), { desc = 'Resize to the up' })
  end,
}
