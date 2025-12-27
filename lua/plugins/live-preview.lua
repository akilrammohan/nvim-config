return {
    'brianhuster/live-preview.nvim',
    opts = {},
    keys = {
        { '<leader>m', '<CMD>LivePreview start<CR>', desc = 'Start live preview' },
        { '<leader>s', '<CMD>LivePreview close<CR>', desc = 'Stop live preview' },
    },
}
