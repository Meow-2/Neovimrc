return function()
  vim.g.VM_leader = [[<S-\>]]
  vim.g.VM_maps = {
    ['Find Under'] = '<C-l>',
    ['Find Subword Under'] = '<C-l>',
    ['Visual All'] = '<C-S-a>',
    ['Select All'] = '<C-S-a>',
    ['Select h'] = '',
    ['Select l'] = '',
    ['Remove Last Region'] = '<C-h>',
    ['Remove Region'] = [[\]],
    ['Add Cursor Down'] = '',
    ['Add Cursor Up'] = '',
  }
end
