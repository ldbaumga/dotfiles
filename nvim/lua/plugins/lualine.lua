-- for icons to properly showup, need to install fonts from 
-- nerdfonts.com i.e. jetbrains
return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
            theme = 'dracula'
        }
    })
end
}
