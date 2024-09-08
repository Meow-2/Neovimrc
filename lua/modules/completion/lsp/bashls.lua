local lsp_settings = {
    name = 'bash-language-server',
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh' },
    settings = {
        bashIde = {
            globPattern = '*@(.sh|.inc|.bash|.command)',
            shellcheckArguments = '-e SC2317,SC1091',
        },
    },
}
return lsp_settings
