return {
    'loctvl842/monokai-pro.nvim',
    priority = 1000, -- load this plugin before all others
    config = function()
        require('monokai-pro').setup {
            filter = 'spectrum',
        }

        vim.cmd.colorscheme 'monokai-pro'
    end,
}
