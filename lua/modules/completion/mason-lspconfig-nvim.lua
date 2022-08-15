return function()
    require("mason-lspconfig").setup({
        ensure_installed = { "sumneko_lua","clangd", "cmake", "pyright", "gopls","jsonls","marksman","bashls"},
        automatic_installation = true,
    })
end
