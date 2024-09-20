return {
    'oxy2dev/markview.nvim',
    lazy = false,
    ft = { 'markdown' },
    config = function()
        require('markview').setup({
            theme = 'dark',  -- Set theme to 'light' or 'dark'
            auto_start = true,  -- Automatically start the preview on entering a markdown file
        })
    end,
}
