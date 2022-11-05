return function()
    vim.g.mkdp_echo_preview_url = 1
    -- vim.g.mkdp_browser = 'google-chrome-stable'
    vim.g.mkdp_browser = 'microsoft-edge-stable'
    if vim.g.remoteSession then
        vim.g.mkdp_open_to_the_world = 1
        -- change to you vps or vm ip
        vim.g.mkdp_open_ip = '119.29.90.39'
        vim.g.mkdp_port = 43969
        vim.cmd([[
        function! g:Open_browser(url)
            silent exe '!lemonade open 'a:url
        endfunction
        ]])
        vim.g.mkdp_browserfunc = 'g:Open_browser'
    end
end
