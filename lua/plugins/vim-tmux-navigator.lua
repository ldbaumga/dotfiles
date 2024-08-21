return {
    'christoomey/vim-tmux-navigator',

    vim.keymap.set('n', '<C><leader>h', ':TmuxNavigateLeft<CR>'),
    vim.keymap.set('n', '<C><leader>j', ':TmuxNavigateDown<CR>'),
    vim.keymap.set('n', '<C><leader>k', ':TmuxNavigateUp<CR>'),
    vim.keymap.set('n', '<C><leader>l', ':TmuxNavigateRight<CR>'),
}
