return function()
    require('mason-tool-installer').setup({

        -- a list of all tools you want to ensure are installed upon
        -- start; they should be the names Mason uses for each tool
        ensure_installed = {
            'autopep8',
            'bash-language-server',
            'bash-debug-adapter',
            'shellcheck',
            'clang-format',
            'clangd',
            'cmake-language-server',
            'cmakelang',
            'cpptools',
            'debugpy',
            'delve',
            'gofumpt',
            'gopls',
            'json-lsp',
            'lua-language-server',
            'marksman',
            'prettier',
            'pyright',
            'shfmt',
            'stylua',
            'html-lsp',
            'eslint-lsp',
            'css-lsp',
            'nil',
            'nixpkgs-fmt',
        },

        -- if set to true this will check each tool for updates. If updates
        -- are available the tool will be updated. This setting does not
        -- affect :MasonToolsUpdate or :MasonToolsInstall.
        -- Default: false
        auto_update = false,

        -- automatically install / update on startup. If set to false nothing
        -- will happen on startup. You can use :MasonToolsInstall or
        -- :MasonToolsUpdate to install tools and check for updates.
        -- Default: true
        run_on_start = true,

        -- set a delay (in ms) before the installation starts. This is only
        -- effective if run_on_start is set to true.
        -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
        -- Default: 0
        -- start_delay = ,  -- 3 second delay
    })
end
