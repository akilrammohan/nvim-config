return {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    opts = {},
    keys = {
        { '<leader>e', '<CMD>LspTinymistExportPdf<CR>', desc = 'Export Typst to PDF' },
        { '<leader>r', '<CMD>TypstPreview<CR>', desc = 'Typst Preview' },
    },
}
