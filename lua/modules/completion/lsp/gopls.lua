local lsp_settings = {
    cmd = { 'gopls', '--remote=auto' },
    init_options = {
        usePlaceholders = true,
        completeUnimported = true,
    },
}
return lsp_settings
