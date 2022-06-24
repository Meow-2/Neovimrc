let g:mkdp_echo_preview_url = 1
if g:remoteSession
    let g:mkdp_open_to_the_world = 1
    let g:mkdp_open_ip = '119.29.90.39' " change to you vps or vm ip
    let g:mkdp_port = 43969
    function! g:Open_browser(url)
        silent exe '!lemonade open 'a:url
    endfunction
    let g:mkdp_browserfunc = 'g:Open_browser'
endif
