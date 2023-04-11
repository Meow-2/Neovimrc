local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp_settings = {
    capabilities = capabilities,
}
return lsp_settings
