return function()
      require('nvim-tree').setup({
            disable_netrw = true,
            sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
 --     width = 30,
 --     height = 30,
      side = 'left',
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      hide_root_folder = false,
      mappings = {
        list = {
          { key = { 'l' }, action = 'edit' },
          { key = { 's' }, action = 'split' },
          { key = { '<C-l>' }, action = 'vsplit' },
          { key = { 'yp' }, action = 'copy_absolute_path'},
          { key = { 'yn' }, action = 'copy_name'},
          { key = { 'yy' }, action = 'copy'},
          { key = { 'dd' }, action = 'cut'},
          { key = { 'pp' }, action = 'paste'},
          { key = { 'dD' }, action = 'trash'},
          { key = { 'V' }, action = 'create'},
          { key = { 'zh' }, action = 'toggle_dotfiles'},
          { key = { 'cw' }, action = 'rename'},
          { key = { 'f' }, action = 'search_node'},
        },
      },
    },
    renderer = {
      icons = {
        glyphs = {
          default = '',
          symlink = '',
          folder = {
            arrow_closed = '',
            arrow_open = '',
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
            symlink_open = '',
          },
          git = {
            deleted = '',
            ignored = '',
            renamed = '',
            staged = '',
            unmerged = '',
            unstaged = '',
            untracked = 'ﲉ',
          },
        },
      },
    },
    actions = {
        open_file = {
            quit_on_open = true
        }
    }
  })
end
