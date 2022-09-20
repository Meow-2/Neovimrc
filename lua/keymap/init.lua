require('keymap.config')
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
    if vim.bo.filetype == 'markdown' then
        vim.api.nvim_command('MarkdownPreview')
    elseif cur_path:find(config_path) or vim.bo.filetype == 'dashboard' then
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
        cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
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
        ['gd'] = { cmd('lua vim.lsp.buf.definition()'), 'Lsp Go Definition' },
        ['gi'] = { cmd('lua vim.lsp.buf.implementation()'), 'Lsp Go Implement' },
        ['gr'] = { cmd('lua vim.lsp.buf.references()'), 'Lsp Go Ref' },
        ['<Leader>.'] = { cmd('lua vim.lsp.buf.code_action()'), 'Code Action' },
        ['<Leader>T'] = { cmd('lua vim.lsp.buf.type_definition()'), 'Lsp Go Type Definition' },
        ['<Leader>D'] = { cmd('lua vim.lsp.buf.declaration()'), 'Lsp Go Declaration' },
        ['<Leader>w'] = { name = 'Workspace' },
        ['<Leader>wa'] = { cmd('lua vim.lsp.buf.add_workspace_folder()'), 'Workspace Add ' },
        ['<Leader>wd'] = { cmd('lua vim.lsp.buf.remove_workspace_folder()'), 'Workspace Del' },
        ['<Leader>wl'] = {
            cmd('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'),
            'Workspace List',
        },
    }
    require('which-key').register(mappings, mappings_opt)
end

function WK_MAP()
    local mappings_opt = { mode = 'n', buffer = nil, silent = true, noremap = true, nowait = true }
    local mappings = {
        -- Telescope
        ['s'] = { name = 'Search' },
        ['sw'] = { cmd('TelescopeLiveGrep'), 'Search Words Live' },
        ['sb'] = { cmd('Telescope buffers'), 'Search Buffers' },
        ['sB'] = { cmd('Telescope file_browser'), 'Search Buffers' },
        ['sf'] = { cmd('Telescope find_files'), 'Search Files' },
        ['sF'] = {
            cmd('Telescope find_files find_command=rg,--hidden,--files'),
            'Search All Files',
        },
        ['so'] = { cmd('Telescope oldfiles'), 'Search Open History' },
        ['sp'] = { cmd('Telescope help_tags'), 'Search Help Tags' },
        ['sm'] = { cmd('Telescope man_pages'), 'Search Man Pages' },
        ['st'] = { cmd('TodoTelescope'), 'Search TODO Lists' },
        ['sc'] = { cmd('Telescope colorscheme'), 'Search ColorScheme' },
        ['sC'] = { cmd('Telescope commands'), 'Search Commands' },
        ['sK'] = { cmd('Telescope keymaps'), 'Search Keymap' },
        ['sH'] = {
            cmd('Telescope find_files find_command=rg,--hidden,--files,' .. home),
            'Search Keymap',
        },
        ['ss'] = {
            cmd('Telescope lsp_document_symbols'),
            'Search Symbol',
        },
        ['sS'] = {
            cmd('Telescope lsp_dynamic_workspace_symbols'),
            'Search Workspace Symbol',
        },
        ['sg'] = { name = 'Search Git' },
        ['sgf'] = { cmd('Telescope git_status'), 'Open changed file' },
        ['sgb'] = { cmd('Telescope git_branches'), 'Checkout branch' },
        ['sgc'] = { cmd('Telescope git_commits'), 'Checkout commit' },
        ['sd'] = { name = 'Search Dap' },
        ['sdc'] = { cmd('Telescope dap commands'), 'Dap Commands' },
        ['sdd'] = { cmd('Telescope dap configurations'), 'Dap Config' },
        ['sdb'] = { cmd('Telescope dap list_breakpoints'), 'Dap breakpoints' },
        ['sdv'] = { cmd('Telescope dap variables'), 'Dap Variables' },
        ['sdf'] = { cmd('Telescope dap frames'), 'Dap Frames' },
        -- ['sh'] = { desc = 'Split Left' },
        -- ['sj'] = { desc = 'Split Down' },
        -- ['sk'] = { desc = 'Split Up' },
        -- ['sl'] = { desc = 'Split Right' },
        -- Packer
        ['<Leader>u'] = { cmd('PackerUpdate'), 'Plugins Update' },
        ['<Leader>i'] = { cmd('PackerInstall'), 'Plugins Install' },
        ['<Leader>c'] = { cmd('PackerCompile'), 'Plugins Config Compile' },
        -- Dashboard
        ['<Leader>n'] = { cmd('DashboardNewFile'), 'New File' },
        -- Mason
        ['<Leader>m'] = { cmd('Mason'), 'Install Lsp and Dap' },
        -- neovim-session-manager
        ['<Leader>s'] = { name = 'sessions' },
        ['<Leader>ss'] = { cmd('SessionManager! save_current_session'), 'Save Session' },
        ['<Leader>sl'] = { cmd('SessionManager! load_session'), 'Load Session' },
        ['<Leader>sd'] = { cmd('SessionManager! delete_session'), 'Delete Session' },
        ['t'] = { name = 'Buffer' },
        -- nvim-tree
        ['tt'] = { cmd('NvimTreeToggle'), 'NvimTree Toggle' },
        -- bufferline
        ['e'] = { cmd('BufferLineCyclePrev'), 'Buffer Prev' },
        ['r'] = { cmd('BufferLineCycleNext'), 'Buffer Next' },
        ['to'] = { cmd('BufferLinePick'), 'Buffer Open' },
        ['tp'] = { cmd('BufferLinePickVsplit'), 'Buffer Pick Vsplit' },
        ['tc'] = { cmd('BufferLinePickClose'), 'Buffer Pick Close' },
        ['tl'] = { cmd('BufferLineMoveNext'), 'Buffer Move Left' },
        ['th'] = { cmd('BufferLineMovePrev'), 'Buffer Move Right' },
        ['tq'] = { cmd('TodoQuickFix'), 'TODO QuickFix' },
        -- nvim-comment
        ['<C-_>'] = { cmd('CommentToggle'), 'Comment Code' },
        -- for nvui
        ['<C-/>'] = { cmd('CommentToggle'), 'Comment Code' },
        -- vim-floaterm
        ['<C-g>'] = { cmd('FloatermNew --cwd=<root> --name=lazygit lazygit'), 'Open Lazygit' },
        ['<C-t>'] = { cmd('FloatermToggle'), 'Terminal Toggle' },
        ['R'] = { cmd('FloatermNew ranger'), 'Open Ranger' },

        -- Lspsaga
        ['='] = { cmd('Lspsaga diagnostic_jump_next'), 'Next Diagnostic' },
        ['-'] = { cmd('Lspsaga diagnostic_jump_prev'), 'Prev Diagnostic' },
        ['g'] = { name = 'Lsp Jump' },
        ['gt'] = { cmd('Lspsaga lsp_finder'), 'Lsp Symbol Jump' },
        ['gD'] = { cmd('Lspsaga preview_definition'), 'Lsp Preview Define' },
        ['gs'] = { cmd('Antovim'), 'Antovim' },
        ['<C-k>'] = { cmd('Lspsaga hover_doc'), 'Lsp Hover Doc' },
        -- ['<C-p>'] = { cmd('Lspsaga signature_help'), 'Lsp Signature Help' },
        -- Lspsaga
        ['<Leader>o'] = { cmd('LSoutlineToggle'), 'Show OutLine' },
        -- ['<Leader>r'] = { name = 'Lspsaga Rename' },
        ['<Leader>r'] = { cmd('Lspsaga rename'), 'Lsp Rename' },
        -- nvim-lspconfig
        ['<Leader>e'] = { cmd('lua vim.diagnostic.open_float()'), 'Lsp Diagnostic Float Win' },
        ['<Leader>a'] = { cmd('lua vim.diagnostic.setqflist()'), 'Lsp Diagnostic List ' },
        -- asynctask
        ['<F1>'] = { cmd('lua Super_F1()'), 'Super Run' },
        ['<F2>'] = { cmd('AsyncTask project-buildrun'), 'Project Build' },
        ['<F3>'] = { cmd('call asyncrun#quickfix_toggle(12)'), 'Quickfix Close' },
        -- vim-table-mode
        ['<Leader>t'] = { name = 'Table Mode' },
        ['<Leader>tm'] = { cmd('TableModeToggle'), 'Table Mode Toggle' },
        -- nvim-dap
        ['<F5>'] = { cmd('DapContinue'), 'Debug Continue' },
        ['<F6>'] = {
            cmd(
                [[lua require'dap'.toggle_breakpoint(); require'modules.debug.dap-utils'.store_breakpoints(true)]]
            ),
            'Toggle Breakpoint',
        },
        ['<F8>'] = { cmd([[lua require'dap'.terminate()]]), 'Debug Quit' },
        ['<F9>'] = { cmd([[lua require'dap'.run_last()]]), 'Debug Run Last' },
        ['<F10>'] = { cmd([[lua require'dap'.step_over()]]), 'Step Over' },
        ['<F11>'] = { cmd([[lua require'dap'.step_into()]]), 'Step Into' },
        ['<F12>'] = { cmd([[lua require'dap'.step_out()]]), 'Step out' },
        ['<Leader>b'] = { name = 'Dap Breakpoints' },
        ['<Leader>bc'] = {
            cmd(
                [[lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > '); require'modules.debug.dap-utils'.store_breakpoints(true)]]
            ),
            'Breakpoints Condition',
        },
        ['<Leader>be'] = {
            cmd([[lua require'dap'.set_exception_breakpoints()]]),
            'Breakpoints Exception',
        },
        ['<Leader>bd'] = {
            cmd(
                [[lua require'dap'.clear_breakpoints(); require'modules.debug.dap-utils'.store_breakpoints(true)]]
            ),
            'Breakpoints Del All',
        },
        ['<Leader>bl'] = { cmd([[lua require'dap'.list_breakpoints()]]), 'Breakpoints List' },
        ['<Leader>bp'] = {
            cmd(
                [[lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '));require'modules.debug.dap-utils'.store_breakpoints(true)]]
            ),
            'Breakpoints Log Print',
        },
        -- nvim-gdb
        ['<Leader>d'] = { name = 'GDB Debug' },
        ['<Leader>dr'] = { cmd('GdbStart gdbr'), 'GDB Start Remote' },
        ['<Leader>dl'] = { cmd('lua StartGdbSession()'), 'GDB Start' },
        ['<Leader>dw'] = { cmd('lua CreateWatch()'), 'GDB Create Watch' },
        ['<Leader>dt'] = { cmd('GdbLopenBacktrace'), 'GDB Backtrace' },
        ['<Leader>db'] = { cmd('GdbLopenBreakpoints'), 'GDB Breakpoint' },
        -- formatter.nvim
        ['<Leader>f'] = { cmd('lua Toggle_Format()'), 'Formatter Enable/Disable' },
        -- sniprun
        ['<Leader>q'] = { cmd('SnipClose'), 'SnipRun Win Close' },
    }
    -- require('which-key').register({['<F1>'] = {cmd('lua Super_F1()'), 'Super Run'}} ,{mode = "n",noremap = true,nowait = true})
    require('which-key').register(mappings, mappings_opt)
end

function GS_MAP(bufnr)
    local mappings_opt =
        { mode = 'n', buffer = bufnr, silent = true, noremap = true, nowait = true }
    local mappings = {
        ['<Leader>g'] = { name = 'git' },
        ['<Leader>gn'] = { cmd('Gitsigns next_hunk'), 'Next Hunk' },
        ['<Leader>gN'] = { cmd('Gitsigns prev_hunk'), 'Prev Hunk' },
        -- Actions,
        ['<Leader>gs'] = { cmd('Gitsigns stage_hunk'), 'Stage Hunk' },
        ['<Leader>gr'] = { cmd('Gitsigns reset_hunk'), 'Reset Hunk' },
        ['<Leader>gu'] = { cmd('Gitsigns undo_stage_hunk'), 'Unstage Hunk' },
        ['<Leader>gS'] = { cmd('Gitsigns stage_buffer'), 'Stage Buffer' },
        ['<Leader>gR'] = { cmd('Gitsigns reset_buffer'), 'Reset Buffer' },
        ['<Leader>gp'] = { cmd('Gitsigns preview_hunk'), 'Preview Hunk' },
        ['<Leader>gb'] = {
            cmd('lua require"gitsigns".blame_line{full=true}'),
            'Show Commit Message',
        },
        ['<Leader>gd'] = { cmd('Gitsigns diffthis'), 'Show Diff' },
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
    }
    require('which-key').register(mappings, mappings_opt)
end

nmap({
    -- vim-matchup
    { ';', '<Plug>(matchup-%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    -- { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
    {
        '<C-u>',
        function()
            require('lspsaga.action').smart_scroll_with_saga(-1)
        end,
        opts(silent),
    },
    {
        '<C-d>',
        function()
            require('lspsaga.action').smart_scroll_with_saga(1)
        end,
        opts(silent),
    },
})

omap({
    { ';', '<Plug>(matchup-i%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    { 'i;', '<Plug>(matchup-i%)' },
    { 'a;', '<Plug>(matchup-a%)' },
    -- { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
})

xmap({
    { ';', '<Plug>(matchup-i%)' },
    { '[;', '<Plug>(matchup-[%)' },
    { '];', '<Plug>(matchup-]%)' },
    { 'i;', '<Plug>(matchup-i%)' },
    { 'a;', '<Plug>(matchup-a%)' },
    -- { 'g;', '<Plug>(matchup-z%)' },
    { 'z;', '<Plug>(matchup-z%)' },
})

imap({
    { '<C-p>', cmd('Lspsaga signature_help'), opts(noremap, silent) },
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
    -- nvim-comment
    { '<C-_>', [[:CommentToggle<Cr>]], opts(noremap, silent) },
    { '<C-/>', [[:CommentToggle<Cr>]], opts(noremap, silent) },
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
