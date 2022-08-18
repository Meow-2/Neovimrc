return function()
    if not vim.g.remoteSession then
        require('nvim-picgo').setup({
            -- method to informe
            -- notice = "notify",
            notice = 'echo',
            -- Whether the generated markdown link saves the upload name of the image
            -- boolean
            image_name = false,
            -- debug mode
            debug = false,
        })
    end
end
