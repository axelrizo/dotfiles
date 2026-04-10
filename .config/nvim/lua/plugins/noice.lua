-- lazy.nvim
return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
    cmdline = {
      format = {
        search_down = false,
        search_up = false,
        filter = false,
        lua = false,
        help = false,
        input = false,
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}
