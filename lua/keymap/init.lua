require('keymap.config')
local key = require('core.keymap')
local vmap,imap,tmap,bmap = key.vmap,key.imap,key.tmap,vim.api.nvim_buf_set_keymap
local cmd,cu = key.cmd,key.cu
local opts = key.new_opts
local nore = opts(key.noremap)
local nore_silent =opts(key.noremap,key.silent)
local nore_silent_expr = opts(key.noremap,key.silent,key.expr)
local source_file = vim.fn.stdpath('config') .. '/init.lua'

local has_words_before = function()--{{{
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end--}}}

local function super_tab(cmp,luasnip,select_behavior)--{{{
    return  function(fallback)
        if cmp.visible() then
            cmp.select_next_item(select_behavior)
        elseif luasnip.jumpable(1) then
            luasnip.jump(1)
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end
end--}}}

local function super_s_tab(cmp, luasnip, select_behavior)--{{{
    return function(fallback)
        if cmp.visible() then
            cmp.select_prev_item(select_behavior)
        elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end
end--}}}

function _CMP_MAP(cmp,luasnip,select_behavior)--{{{
    local insert_map = cmp.mapping.preset.insert()
    rawset(insert_map, '<C-d>', cmp.mapping.scroll_docs(4))
    rawset(insert_map, '<C-u>', cmp.mapping.scroll_docs(-4))
    rawset(insert_map, '<C-j>', cmp.mapping.select_next_item())
    rawset(insert_map, '<C-k>', cmp.mapping.select_prev_item())
    rawset(insert_map, '<CR>', cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Replace, select = true }))
    rawset(insert_map, '<Tab>', cmp.mapping(super_tab(cmp,luasnip,{behavior = select_behavior}),{'i','c'}))
    rawset(insert_map, '<S-Tab>', cmp.mapping(super_s_tab(cmp,luasnip,{behavior = select_behavior}),{'i','c'}))
    rawset(insert_map, '<C-Space>', cmp.mapping(cmp.mapping.complete(),{'i','c'}))
    return insert_map
end--}}}

function LSP_MAP(buffnr)
    local mappings_opt = {mode = "n",buffer = buffnr,silent = true,noremap = true,nowait = true,}
    local mappings = {
        ['gd']={cmd('lua vim.lsp.buf.definition()'), 'Lsp Go Def' },
        ['gi']={cmd('lua vim.lsp.buf.implementation()'), 'Lsp Go Imp' },
        ['gr']={cmd('lua vim.lsp.buf.references()'), 'Lsp Go Ref' },
        ['<Leader>.']={cmd('lua vim.lsp.buf.code_action()'), 'Code Action' },
        ['<Leader>=']={cmd('lua vim.lsp.buf.formatting()'), 'Lsp Format' },
        ['<Leader>d']={cmd('lua vim.lsp.buf.type_definition()'), 'Lsp Go Type' },
        ['<Leader>D']={cmd('lua vim.lsp.buf.declaration()'),'Lsp Go Decl'},
        ['<Leader>w'] = {name = 'Workspace'},
        ['<Leader>wa']={cmd('lua vim.lsp.buf.add_workspace_folder()'), 'Workspace Add ' },
        ['<Leader>wr']={cmd('lua vim.lsp.buf.remove_workspace_folder()'),'Workspace Del' },
        ['<Leader>wl']={cmd('lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))'), 'Workspace List'},
    }
    require('which-key').register(mappings ,mappings_opt)
end

function WK_MAP()

    local mappings_opt ={mode = "n",buffer = nil,silent = true,noremap = true,nowait = true,}
    local mappings = {
    ['<C-s>']={cmd('luafile '..source_file),'Source Config'},
    -- Packer
    ['<Leader>u'] = {cmd('PackerUpdate'), 'Plugins Update'},
    ['<Leader>i']={cmd('PackerInstall'),'Plugins Install'},
    ['<Leader>c']={cmd('PackerCompile'),'Plugins Config Compile'},
    -- Dashboard
    ['<Leader>n']={cmd('DashboardNewFile'),'New File'},
    -- Telescope
    ['<Leader>b']={cmd('Telescope buffers'),'Find Buffers'},
    ['<Leader>l']={cmd('Telescope live_grep'),'Find Words'},
    ['<Leader>f']={cmd('Telescope find_files'),'Find Files'},
    ['<Leader>h']={cmd('Telescope oldfiles'),'Find Open History'},
    ['<Leader>p']={cmd('Telescope help_tags'),'Find Help Tags'},
    -- Mason
    ['<Leader>m']={cmd('Mason'),'Install Lsp and Dap'},
    -- neovim-session-manager
    ['<Leader>s'] = {name = 'sessions'},
    ['<Leader>ss']={cmd('SessionManager! save_current_session'),'Save Session'},
    ['<Leader>sl']={cmd('SessionManager! load_session'),'Load Session'},
    ['<Leader>sd']={cmd('SessionManager! delete_session'),'Delete Session'},
    ['t'] = {name = 'Buffer'},
    -- nvim-tree
    ['tt']={cmd('NvimTreeToggle'),'NvimTree Toggle'},
    -- bufferline
    ['e']={cmd('BufferLineCyclePrev'),'Buffer Prev'},
    ['r']={cmd('BufferLineCycleNext'),'Buffer Next'},
    ['tp']={cmd('BufferLinePick'),'Buffer Pick Open'},
    ['tv']={cmd('BufferLinePickVsplit'),'Buffer Pick Vsplit'},
    ['tc']={cmd('BufferLinePickClose'),'Buffer Pick Close'},
    ['tl']={cmd('BufferLineMoveNext'),'Buffer Move Left'},
    ['th']={cmd('BufferLineMovePrev'),'Buffer Move Right'},
    -- nvim-comment
    ['<C-_>']={cmd('CommentToggle'),'Comment Code'},
    -- for nvui
    ['<C-/>']={cmd('CommentToggle'),'Comment Code'},
    -- vim-floaterm
    ['<C-g>']={cmd('FloatermNew --cwd=<root> --name=lazygit lazygit'),'Open Lazygit'},
    ['<C-t>']={cmd('FloatermToggle'),'Terminal Toggle'},
    ['R']={cmd('FloatermNew ranger'),'Open Ranger'},

    -- Lspsaga
    ['=']={cmd('Lspsaga diagnostic_jump_next'),'Next Diagnostic'},
    ['-']={cmd('Lspsaga diagnostic_jump_prev'),'Prev Diagnostic'},
    ['g'] = {name = 'Lsp Jump'},
    ['gt']={cmd('Lspsaga lsp_finder'),'Lsp Symbol Jump'},
    ['gD']={cmd('Lspsaga preview_definition'),'Lsp Preview Define'},
    ['<C-k>']={cmd('Lspsaga hover_doc'),'Lsp Hover Doc'},
    ['<C-p>']={cmd('Lspsaga signature_help'),'Lsp Signature Help'},
    -- Lspsaga
    ['<Leader>o']={cmd('LSoutlineToggle'), 'Show OutLine'},
    ['<Leader>r'] = {name = 'Lspsaga Rename'},
    ['<Leader>rn']= {cmd('Lspsaga rename'), 'Lsp Rename'},
    -- nvim-lspconfig
    ['<Leader>e']={ cmd('lua vim.diagnostic.open_float()'), 'Lsp Diagnostic Float Win' },
    ['<Leader>a']={ cmd('lua vim.diagnostic.setloclist()'), 'Lsp Diagnostic List ' },
    -- asynctask
    ['<S-F1>'] = {cmd('AsyncTask file-buildrun'), 'Code Runner'},
    ['<F2>'] = {cmd('call asyncrun#quickfix_toggle(6)'), 'Close Code Runner'},
    ['<F3>'] = {cmd('AsyncTask file-run'), 'Code Runner'},
    }
    require('which-key').register(mappings ,mappings_opt)
end

function GS_MAP(bufnr)

    local mappings_opt = {mode = "n",buffer = bufnr,silent = true,noremap = true,nowait = true,}
    local mappings = {
    ['<Leader>g'] = {name = 'git'},
    ['<Leader>gn']={cmd('Gitsigns next_hunk'),'Next Hunk'},
    ['<Leader>gN']={cmd('Gitsigns prev_hunk'),'Prev Hunk'},
    -- Actions,
    ['<Leader>gs']={cmd('Gitsigns stage_hunk'),'Stage Hunk'},
    ['<Leader>gr']={cmd('Gitsigns reset_hunk'),'Reset Hunk'},
    ['<Leader>gu']={cmd('Gitsigns undo_stage_hunk'),'Unstage Hunk'},
    ['<Leader>gS']={cmd('Gitsigns stage_buffer'),'Stage Buffer'},
    ['<Leader>gR']={cmd('Gitsigns reset_buffer'),'Reset Buffer'},
    -- ['<Leader>gU']={cmd('Gitsigns undo_stage_buffer'),'Unstage Buffer'},
    ['<Leader>gp']={cmd('Gitsigns preview_hunk'),'Preview Hunk'},
    ['<Leader>gb']={cmd('lua require"gitsigns".blame_line{full=true}'),'Show Commit Message'},
    ['<Leader>gd']={cmd('Gitsigns diffthis'),'Show Diff'},
    -- ['<Leader>gD']={cmd('lua require"gitsigns".diffthis("~")'),'Show Diff'},
    --
    -- Text object
    bmap(bufnr, 'o', 'ih', cu('Gitsigns select_hunk'), {noremap = true, silent = true}),
    bmap(bufnr, 'x', 'ih', cu('Gitsigns select_hunk'), {noremap = true, silent = true}),
}
    require('which-key').register(mappings ,mappings_opt)
end

imap({'<C-p>', cmd('Lspsaga signature_help'),nore_silent })

vmap({
    -- nvim-comment
    {'<C-_>'      , [[:CommentToggle<Cr>]] , nore_silent} ,
    {'<C-/>'      , [[:CommentToggle<Cr>]], nore_silent} ,
    { 't' , [[:Tabularize /]]      , nore} ,
    { '<Leader>.', cmd('Lspsaga range_code_action'), nore_silent },
})

tmap({
    -- tnoremap <silent> <c-t> <C-\><C-N>:FloatermToggle<cr>
    {'<C-t>', [[<C-\><C-n>:FloatermToggle<Cr>]], nore_silent },
    -- vim-floaterm
    {'<C-g>', function ()
        return vim.bo.filetype == 'floaterm' and [[q<C-\><C-n>:FloatermKill lazygit<cr>]] or '<C-g>'
    end,nore_silent_expr},
})
