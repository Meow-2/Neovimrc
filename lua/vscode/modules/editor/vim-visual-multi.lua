return function()
    vim.g.VM_leader = [[<S-\>]]
    vim.g.VM_show_warnings = 0
    vim.g.VM_highlight_matches = 'hi! link Search Underlined'
    vim.g.VM_maps = {
        ['Find Under'] = '<C-l>',
        ['Find Subword Under'] = '<C-l>',
        ['Visual All'] = '<C-S-a>',
        ['Select All'] = '<C-S-a>',
        ['Select h'] = '',
        ['Select l'] = '',
        ['Remove Last Region'] = '<C-h>',
        ['Remove Region'] = [[\]],
        ['Add Cursor Down'] = '<C-n>',
        ['Add Cursor Up'] = '',
    }
end
