return {
  'otavioschwanck/arrow.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons' },
    -- or if using `mini.icons`
    -- { "echasnovski/mini.icons" },
  },
  opts = {},
  config = function()
    require('arrow').setup {
      show_icons = true,
      leader_key = '<leader>i', -- Recommended to be a single key
      buffer_leader_key = 'm', -- Per Buffer Mappings
    }

    vim.keymap.set('n', 'H', require('arrow.persist').previous)
    vim.keymap.set('n', 'L', require('arrow.persist').next)
    vim.keymap.set('n', '<leader>z', require('arrow.persist').toggle)
  end,
}
