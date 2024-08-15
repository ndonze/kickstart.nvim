-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'mfussenegger/nvim-dap',
    init = function()
      vim.keymap.set('n', '<leader>db', '<cmd> DapToggleBreakpoint <cr>', { desc = 'Toggle [D]ebugging [B]reakpoint' })

      vim.keymap.set('n', '<leader>dsb', function()
        local widgets = require 'dap.ui.widgets'
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end, { desc = 'Open [D]ebugging [S]idebar' })
    end,
  },
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    dependencies = 'mfussenegger/nvim-dap',
    config = function(_, opts)
      require('dap-go').setup(opts)

      vim.keymap.set('n', '<leader>dt', function()
        require('dap-go').debug_test()
      end, { desc = '[D]ebug nearest [T]est' })

      vim.keymap.set('n', '<leader>d', function()
        require('dap-go').debug_last()
      end, { desc = '[D]ebug [L]ast test' })
    end,
  },
}
