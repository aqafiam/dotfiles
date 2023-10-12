return {
  {
    "akinsho/git-conflict.nvim",
    event = { "CursorHold", "CursorMoved", "ModeChanged", "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
    version = "*",
    config = function()
      require('git-conflict').setup()
    end
  },
  {
    'tpope/vim-fugitive',
    event = { "CmdlineEnter", "CmdwinEnter" },
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { "CursorHold", "CursorMoved", "ModeChanged", "InsertEnter", "CmdlineEnter", "CmdwinEnter" },
    config = function()
      require('gitsigns').setup({
        signs      = {
          add          = { text = '+' },
          change       = { text = '|' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        -- sign_priority = 1,
        signcolumn = true,
        numhl      = false,
        linehl     = false,
      })

      vim.cmd [[
      highlight GitSignsAdd guifg=#528832
      ]]
    end
  },
}
