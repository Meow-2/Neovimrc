local lsp_settings = {
    cmd = {
        "clangd",
        "--background-index",
        "--compile-commands-dir=build",
        "-j=12",
        "--query-driver=/usr/bin/clang++",
        "--clang-tidy",
        "--enable-config",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--function-arg-placeholders=true",
        "--header-insertion-decorators",
        "--header-insertion=iwyu",
        "--pch-storage=memory",
    },
}
return lsp_settings
