return {
  'romgrk/barbar.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    local map = vim.keymap.set
    map('n', '<A-,>', ':BufferPrevious<CR>', { silent = true })
    map('n', '<A-.>', ':BufferNext<CR>', { silent = true })
    map('n', '<A-<>', ':BufferMovePrevious<CR>', { silent = true })
    map('n', '<A->>', ':BufferMoveNext<CR>', { silent = true })
    map('n', '<A-1>', ':BufferGoto 1<CR>', { silent = true })
    map('n', '<A-2>', ':BufferGoto 2<CR>', { silent = true })
    map('n', '<A-3>', ':BufferGoto 3<CR>', { silent = true })
    map('n', '<A-4>', ':BufferGoto 4<CR>', { silent = true })
    map('n', '<A-5>', ':BufferGoto 5<CR>', { silent = true })
    map('n', '<A-6>', ':BufferGoto 6<CR>', { silent = true })
    map('n', '<A-7>', ':BufferGoto 7<CR>', { silent = true })
    map('n', '<A-8>', ':BufferGoto 8<CR>', { silent = true })
    map('n', '<A-9>', ':BufferLast<CR>', { silent = true })
    map('n', '<A-c>', ':BufferClose<CR>', { silent = true })
    map('n', '<C-s>', ':BufferPick<CR>', { silent = true })
    map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', { silent = true })
    map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', { silent = true })
  end
}
