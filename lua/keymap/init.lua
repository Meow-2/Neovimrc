require('keymap.remap')
local keymap = require('core.keymap')
local nmap, vmap, imap, tmap, omap, xmap =
    keymap.nmap, keymap.vmap, keymap.imap, keymap.tmap, keymap.omap, keymap.xmap
local cmd = keymap.cmd
local opts = keymap.new_opts
local noremap, silent, expr = keymap.noremap, keymap.silent, keymap.expr
local home = os.getenv('HOME')

local is_words = function(col) --{{{
    return not (col == 0 or col == -1 or vim.fn.getline('.'):sub(col, col):match('%s')) --{{{}}}
end --}}}

local is_pairs = function(col) --{{{
    return vim.fn.getline('.'):sub(col, col):match('[\'">%])}`]')
end --}}}

local function super_tab(cmp, luasnip) --{{{
    return function(fallback)
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            return
        end
        if (is_words(col) or is_words(col - 1)) and is_pairs(col + 1) then
            vim.api.nvim_win_set_cursor(0, { line, col + 1 })
            return
        end
        if luasnip.jumpable(1) then
            luasnip.jump(1)
            return
        end
        fallback()
    end
end --}}}

local function super_s_tab(cmp, luasnip) --{{{
    return function(fallback)
        if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end
end --}}}

function Super_F1() --{{{
    local cur_path = vim.api.nvim_buf_get_name(0)
    local config_path = vim.fn.stdpath('config')
    -- if vim.bo.filetype == 'markdown' then
    --     vim.api.nvim_command('MarkdownPreview')
    if cur_path:find(config_path) or vim.bo.filetype == 'dashboard' then
        require('core.pack').compile()
        vim.cmd('luafile ' .. vim.fn.stdpath('config') .. '/init.lua')
        -- local base_package = {
        --     ['vim.shared'] = 1,['table'] = 1,['luv']=1,['io']=1,['package']=1,['mpack']=1,
        --     ['debug']=1,['math']=1,['jit.opt']=1,['_G']=1,['vim._meta']=1,['bit']=1,['jit']=1,
        --     ['string']=1,['os']=1,['vim._init_packages']=1,['coroutine']=1,['vim._editor'] = 1
        -- }
        -- for name, _ in pairs(package.loaded) do
        --     if name:match('^core') or name:match('^keymap') or name:match('^modules') then
        --         package.loaded[name] = nil
        --     end
        -- end
        -- require('core')
        print('Config Reload Finish!')
    else
        vim.api.nvim_command('AsyncTask file-buildrun')
    end
end --}}}

function _CMP_MAP(cmp, luasnip)
    local insert_map = cmp.mapping.preset.insert()
    rawset(insert_map, '<C-d>', cmp.mapping.scroll_docs(4))
    rawset(insert_map, '<C-u>', cmp.mapping.scroll_docs(-4))
    rawset(insert_map, '<C-j>', cmp.mapping.select_next_item())
    rawset(insert_map, '<C-k>', cmp.mapping.select_prev_item())
    rawset(
        insert_map,
        '<CR>',
        -- cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
        cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
    )
    rawset(insert_map, '<Tab>', cmp.mapping(super_tab(cmp, luasnip), { 'i', 's' }))
    rawset(insert_map, '<S-Tab>', cmp.mapping(super_s_tab(cmp, luasnip), { 'i', 's' }))
    rawset(insert_map, '<C-Space>', cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }))
    return insert_map
end

function LSP_MAP(bufnr)
    local mappings_opt =
        { mode = 'n', buffer = bufnr, silent = true, noremap = true, nowait = true }
    local mappings = {
        {
            mode = 'n',
            buffer = bufnr,
            silent = true,
            noremap = true,
            nowait = true,
            { '<Leader>w', group = 'Workspace' },
            {
                '<Leader>wa',
                cmd('lua vim.lsp.buf.add_workspace_folder()'),
                desc = 'Workspace Add ',
            },
            {
                '<Leader>wd',
                cmd('lua vim.lsp.buf.remove_workspace_folder()'),
                desc = 'Workspace Del',
            },
            {
                '<Leader>wl',
                cmd('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'),
                desc = 'Workspace List',
            },
            { '<Leader>.', cmd('lua vim.lsp.buf.code_action()'), desc = 'Code Action' },
            {
                '<Leader>T',
                cmd('lua vim.lsp.buf.type_definition()'),
                desc = 'Lsp Go Type Definition',
            },
            { '<Leader>D', cmd('lua vim.lsp.buf.declaration()'), desc = 'Lsp Go Declaration' },
        },
        -- -- ['gd'] = { cmd('lua vim.lsp.buf.definition()'), 'Lsp Go Definition' },
        -- -- ['gi'] = { cmd('lua vim.lsp.buf.implementation()'), 'Lsp Go Implement' },
        -- -- ['gr'] = { cmd('lua vim.lsp.buf.references()'), 'Lsp Go Ref' },
    }
    require('which-key').add(mappings)
end

function WK_MAP()
    local mappings_opt = { mode = 'n', buffer = nil, silent = true, noremap = true, nowait = true }
    local mappings = {
        {
            mode = 'n',
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true,
            -- Telescope
            { 's', group = 'Search' },
            { 'sw', cmd('TelescopeLiveGrep'), desc = 'Search Words Live' },
            { 'sb', cmd('Telescope buffers'), desc = 'Search Buffers' },
            { 'sB', cmd('Telescope file_browser'), desc = 'Search Buffers' },
            { 'sf', cmd('Telescope find_files'), desc = 'Search Files' },
            {
                'sF',
                cmd('Telescope find_files find_command=rg,--hidden,--files'),
                desc = 'Search All Files',
            },
            { 'so', cmd('Telescope oldfiles'), desc = 'Search Open History' },
            { 'sp', cmd('Telescope help_tags'), desc = 'Search Help Tags' },
            { 'sm', cmd('Telescope man_pages'), desc = 'Search Man Pages' },
            { 'sn', cmd('Telescope notify'), desc = 'Search Keymap' },
            { 'st', cmd('TodoTelescope'), desc = 'Search TODO Lists' },
            { 'sc', cmd('Telescope colorscheme'), desc = 'Search ColorScheme' },
            { 'sC', cmd('Telescope commands'), desc = 'Search Commands' },
            { 'sK', cmd('Telescope keymaps'), desc = 'Search Keymap' },
            {
                'sH',
                cmd('Telescope find_files find_command=rg,--hidden,--files,' .. home),
                desc = 'Search Keymap',
            },
            {
                'ss',
                cmd('Telescope lsp_document_symbols'),
                desc = 'Search Symbol',
            },
            {
                'sS',
                cmd('Telescope lsp_dynamic_workspace_symbols'),
                desc = 'Search Workspace Symbol',
            },
            { 'sg', group = 'Search Git' },
            { 'sgf', cmd('Telescope git_status'), desc = 'Open changed file' },
            { 'sgb', cmd('Telescope git_branches'), desc = 'Checkout branch' },
            { 'sgc', cmd('Telescope git_commits'), desc = 'Checkout commit' },
            { 'sd', group = 'Search Dap' },
            { 'sdc', cmd('Telescope dap commands'), desc = 'Dap Commands' },
            { 'sdd', cmd('Telescope dap configurations'), desc = 'Dap Config' },
            { 'sdb', cmd('Telescope dap list_breakpoints'), desc = 'Dap breakpoints' },
            { 'sdv', cmd('Telescope dap variables'), desc = 'Dap Variables' },
            { 'sdf', cmd('Telescope dap frames'), desc = 'Dap Frames' },
            -- ['sh'] = { desc = 'Split Left' },
            -- ['sj'] = { desc = 'Split Down' },
            -- ['sk'] = { desc = 'Split Up' },
            -- ['sl'] = { desc = 'Split Right' },
            -- Packer
            -- ['<Leader>u'] = { cmd('PackerUpdate'),desc = 'Plugins Update' },
            -- ['<Leader>i'] = { cmd('PackerInstall'),desc = 'Plugins Install' },
            -- ['<Leader>c'] = { cmd('PackerCompile'),desc = 'Plugins Config Compile' },
            -- Lazy.nvim
            { '<Leader>u', cmd('Lazy'), desc = 'Lazy Package Manager' },
            -- Dashboard
            { '<Leader>n', cmd('DashboardNewFile'), desc = 'New File' },
            -- Mason
            { '<Leader>m', cmd('Mason'), desc = 'Install Lsp and Dap' },
            -- todo-comments
            { '<Leader>t', cmd('TodoLocList'), desc = 'Todo Local List' },
            -- neovim-session-manager
            { '<Leader>s', group = 'sessions' },
            { '<Leader>ss', cmd('SessionManager! save_current_session'), desc = 'Save Session' },
            { '<Leader>sl', cmd('SessionManager! load_session'), desc = 'Load Session' },
            { '<Leader>sd', cmd('SessionManager! delete_session'), desc = 'Delete Session' },
            -- ['<Leader>ss'] = { cmd('SessionStart'),desc = 'Save Session' },
            -- ['<Leader>sl'] = { cmd('Telescope persisted'),desc = 'Load Session' },
            -- ['<Leader>sd'] = { cmd('SessionDelete'),desc = 'Delete Session' },
            -- ['t'] = { name = 'Buffer' },
            -- nvim-tree
            { 'tt', cmd('NvimTreeToggle'), desc = 'NvimTree Toggle' },
            -- bufferline
            { 'e', cmd('BufferLineCyclePrev'), desc = 'Buffer Prev' },
            { 'r', cmd('BufferLineCycleNext'), desc = 'Buffer Next' },
            { 'bo', cmd('BufferLinePick'), desc = 'Buffer Open' },
            { 'bp', cmd('BufferLinePickVsplit'), desc = 'Buffer Pick Vsplit' },
            { 'bc', cmd('BufferLinePickClose'), desc = 'Buffer Pick Close' },
            { 'bl', cmd('BufferLineMoveNext'), desc = 'Buffer Move Left' },
            { 'bh', cmd('BufferLineMovePrev'), desc = 'Buffer Move Right' },
            { 'bq', cmd('TodoQuickFix'), desc = 'Better TODO QuickFix' },
            -- vim-floaterm
            {
                '<C-g>',
                cmd('FloatermNew --cwd=<root> --name=lazygit LANG=zh_CN.UTF-8 lazygit'),
                desc = 'Open Lazygit',
            },
            { '<C-t>', ':FloatermToggle<Cr>', desc = 'Terminal Toggle' },
            { 'R', cmd('FloatermNew lf'), desc = 'Open Lf' },
            -- {'R', cmd('FloatermNew ranger'),desc = 'Open Ranger' },

            -- Lspsaga
            { '=', cmd('Lspsaga diagnostic_jump_next'), desc = 'Next Diagnostic' },
            { '-', cmd('Lspsaga diagnostic_jump_prev'), desc = 'Prev Diagnostic' },
            { 'g', group = 'Lsp Jump' },

            { 'gr', cmd('Lspsaga finder'), desc = 'Lsp Symbol Jump' },
            { 'gi', cmd('Lspsaga finder imp'), desc = 'Lsp Search Implement' },
            { 'gD', cmd('Lspsaga peek_definition'), desc = 'Lsp Preview Define' },
            { 'gd', cmd('lua vim.lsp.buf.definition()'), desc = 'Lsp Go Definition' },
            -- {'gd', cmd('Lspsaga goto_definition'),desc = 'Lsp Goto Define' },
            { 'gt', cmd('Lspsaga goto_type_definition'), desc = 'Lsp Goto Type Define' },
            { 'gs', cmd('Switch'), desc = 'Switch Word' },
            -- {'gS',
            --     cmd("call switch#Switch({'definitions': g:variable_style_switch_definitions})"),
            --     'Switch Variable',
            -- },
            { '<C-k>', cmd('Lspsaga hover_doc'), desc = 'Lsp Hover Doc' },
            -- {'<C-p>', cmd('Lspsaga signature_help'),desc = 'Lsp Signature Help' },
            -- Lspsaga
            { '<Leader>o', cmd('Lspsaga outline'), desc = 'Show OutLine' },
            -- {'<Leader>r', name = 'Lspsaga Rename' },
            { '<Leader>r', cmd('Lspsaga rename'), desc = 'Lsp Rename' },
            -- nvim-lspconfig
            {
                '<Leader>e',
                cmd('lua vim.diagnostic.open_float()'),
                desc = 'Lsp Diagnostic Float Win',
            },
            { '<Leader>a', cmd('lua vim.diagnostic.setqflist()'), desc = 'Lsp Diagnostic List ' },
            -- asynctask
            { '<F1>', cmd('lua Super_F1()'), desc = 'Super Run' },
            { '<F2>', cmd('AsyncTask project-buildrun'), desc = 'Project Build' },
            { '<F3>', cmd('call asyncrun#quickfix_toggle(12)'), desc = 'Quickfix Close' },
            -- vim-table-mode
            -- {'<Leader>t', name = 'Table Mode' },
            -- {'<Leader>tm', cmd('TableModeToggle'),desc = 'Table Mode Toggle' },
            -- nvim-dap
            { '<F5>', cmd('DapContinue'), desc = 'Debug Continue' },
            {
                '<F6>',
                cmd(
                    [[lua require'dap'.toggle_breakpoint(); require'modules.debug.dap-utils'.store_breakpoints(true)]]
                ),
                desc = 'Toggle Breakpoint',
            },
            { '<F8>', cmd([[lua require'dap'.terminate()]]), desc = 'Debug Quit' },
            { '<F9>', cmd([[lua require'dap'.run_last()]]), desc = 'Debug Run Last' },
            { '<F10>', cmd([[lua require'dap'.step_over()]]), desc = 'Step Over' },
            { '<F11>', cmd([[lua require'dap'.step_into()]]), desc = 'Step Into' },
            { '<F12>', cmd([[lua require'dap'.step_out()]]), desc = 'Step out' },
            { '<Leader>b', group = 'Dap Breakpoints' },
            {
                '<Leader>bc',
                cmd(
                    [[lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > '); require'modules.debug.dap-utils'.store_breakpoints(true)]]
                ),
                desc = 'Breakpoints Condition',
            },
            {
                '<Leader>be',
                cmd([[lua require'dap'.set_exception_breakpoints()]]),
                desc = 'Breakpoints Exception',
            },
            {
                '<Leader>bd',
                cmd(
                    [[lua require'dap'.clear_breakpoints(); require'modules.debug.dap-utils'.store_breakpoints(true)]]
                ),
                desc = 'Breakpoints Del All',
            },
            {
                '<Leader>bl',
                cmd([[lua require'dap'.list_breakpoints()]]),
                desc = 'Breakpoints List',
            },
            {
                '<Leader>bp',
                cmd(
                    [[lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '));require'modules.debug.dap-utils'.store_breakpoints(true)]]
                ),
                desc = 'Breakpoints Log Print',
            },
            -- nvim-gdb
            { '<Leader>d', group = 'GDB Debug' },
            { '<Leader>dr', cmd('GdbStart gdbr'), desc = 'GDB Start Remote' },
            { '<Leader>dl', cmd('lua StartGdbSession()'), desc = 'GDB Start' },
            { '<Leader>dw', cmd('lua CreateWatch()'), desc = 'GDB Create Watch' },
            { '<Leader>dt', cmd('GdbLopenBacktrace'), desc = 'GDB Backtrace' },
            { '<Leader>db', cmd('GdbLopenBreakpoints'), desc = 'GDB Breakpoint' },
            -- formatter.nvim
            { '<Leader>f', cmd('lua Toggle_Format()'), desc = 'Formatter Enable/Disable' },
            -- sniprun
            { '<Leader>q', cmd('SnipClose'), desc = 'SnipRun Win Close' },
        },
    }
    -- require('which-key').register({['<F1>'] = {cmd('lua Super_F1()'), 'Super Run'}} ,{mode = "n",noremap = true,nowait = true})
    -- require('which-key').register(mappings, mappings_opt)
    require('which-key').add(mappings)
end

function GS_MAP(bufnr)
    local mappings = {
        {
            mode = 'n',
            buffer = bufnr,
            silent = true,
            noremap = true,
            nowait = true,
            { '<Leader>g', group = 'git' },
            { '<Leader>gn', cmd('Gitsigns next_hunk'), desc = 'Next Hunk' },
            { '<Leader>gN', cmd('Gitsigns prev_hunk'), desc = 'Prev Hunk' },
            -- Actions,
            { '<Leader>gs', cmd('Gitsigns stage_hunk'), desc = 'Stage Hunk' },
            { '<Leader>gr', cmd('Gitsigns reset_hunk'), desc = 'Reset Hunk' },
            { '<Leader>gu', cmd('Gitsigns undo_stage_hunk'), desc = 'Unstage Hunk' },
            { '<Leader>gS', cmd('Gitsigns stage_buffer'), desc = 'Stage Buffer' },
            { '<Leader>gR', cmd('Gitsigns reset_buffer'), desc = 'Reset Buffer' },
            { '<Leader>gp', cmd('Gitsigns preview_hunk'), desc = 'Preview Hunk' },
            {
                '<Leader>gb',
                cmd('lua require"gitsigns".blame_line{full=true}'),
                desc = 'Show Commit Message',
            },
            { '<Leader>gd', cmd('Gitsigns diffthis'), desc = 'Show Diff' },
            -- ['<Leader>gD']={cmd('lua require"gitsigns".diffthis("~")'),'Show Diff'},
            --
            -- Text object
            omap({
                'ih',
                ':<C-U>Gitsigns select_hunk<Cr>',
                { noremap = true, silent = true, buffer = bufnr },
            }),
            xmap({
                'ih',
                ':<C-U>Gitsigns select_hunk<Cr>',
                { noremap = true, silent = true, buffer = bufnr },
            }),
        },
    }
    -- require('which-key').register(mappings, mappings_opt)
    require('which-key').add(mappings)
end

-- nmap({
--     { 'm', '<Plug>Lightspeed_s', opts(silent) },
--     { 'M', '<Plug>Lightspeed_S', opts(silent) },
-- })

imap({
    -- { '<C-p>', cmd('Lspsaga signature_help'), opts(noremap, silent) },
    { '<C-u>', cmd([[lua require('nvim-picgo').upload_clipboard()]]), opts(noremap) },
    { '<C-y>', cmd([[lua require('dap.ext.autocompl').attach()]]), opts(noremap) },
})

vmap({
    -- sniprun
    { 'r', [[:SnipRun<Cr>]], opts(noremap) },
    -- Tabularize
    { '=', [[:Tabularize /]], opts(noremap) },
    -- formatter.nvim
    { 'f', [[:Format<Cr><Esc>]], opts(noremap, silent) },
    -- lspsaga
    { '.', cmd('Lspsaga range_code_action'), opts(noremap, silent) },
})

tmap({
    -- vim-floaterm
    { '<C-t>', [[<C-\><C-n>:FloatermToggle<Cr>]], opts(noremap, silent) },
    {
        '<C-g>',
        function()
            return vim.bo.filetype == 'floaterm' and [[q<C-\><C-n>:FloatermKill lazygit<cr>]]
                or '<C-g>'
        end,
        opts(noremap, silent, expr),
    },
})
