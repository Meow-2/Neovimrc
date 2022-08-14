return function()


    -- vim.diagnostic.config
    local signs = {Error = ' ',Warn = ' ',Info = ' ',Hint = ''}
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    vim.diagnostic.config({
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        virtual_text = {
            source = true,
        },
    })

    -- nvim-lspconfig : capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    if not packer_plugins['cmp-nvim-lsp'].loaded then
        vim.cmd([[packadd cmp-nvim-lsp]])
    end
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

    -- nvim-lspconfig : on_attach
    local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        _LSP_MAP(bufnr)

        if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
                pattern = client.config.filetypes,
                callback = function()
                    vim.lsp.buf.format({
                        bufnr = bufnr,
                        async = true,
                    })
                end,
            })
        end
    end

    -- nvim-lspconfig : lsp_flags
    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }

    -- load lsp config
    local lsp_list = {}
    local lsp_dir = vim.fn.stdpath('config') .. '/lua/modules/completion/lsp'
    local temp = vim.split(vim.fn.globpath(lsp_dir, '*.lua'), '\n')
    vim.split(vim.fn.globpath(vim.fn.stdpath('config') .. '/lua/modules/completion/lsp', '*.lua'), '.lua\n')
    for _, i in ipairs(temp) do
        lsp_list[#lsp_list + 1] = string.match(i, 'lsp/(.+).lua$')
    end
    for _, i in ipairs(lsp_list) do
        local lsp_settings     = require('modules.completion.lsp.' .. i)
        lsp_settings.on_attach = on_attach
        lsp_settings.flags     = lsp_flags
        if i == 'gopls' or i == 'rust_analyzer' then
            lsp_settings.capabilities = capabilities
        end
        require('lspconfig')[i].setup(lsp_settings)
    end
end
