return function()
      require('nvim-tree').setup({
            disable_netrw = true,
            sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    -- width = 30,
    -- height = 30,
      side = 'left',
      number = false,
      relativenumber = false,
      signcolumn = 'yes',
      hide_root_folder = false,
      mappings = {
        list = {
          { key = { 'h' }, action = 'close_node' },
          { key = { 'H' }, action = 'dir_up' },
          { key = { 'l' }, action = 'edit' },
          { key = { 'L' }, action = 'cd' },
          { key = { 's' }, action = 'split' },
          { key = { '<C-l>','v' }, action = 'vsplit' },
          { key = { 'yp' }, action = 'copy_absolute_path'},
          { key = { 'yn' }, action = 'copy_name'},
          { key = { 'yy' }, action = 'copy'},
          { key = { 'dd' }, action = 'cut'},
          { key = { 'pp' }, action = 'paste'},
          { key = { 'dD' }, action = 'trash'},
          { key = { 'V','a' }, action = 'create'},
          { key = { 'zh' }, action = 'toggle_dotfiles'},
          { key = { 'zH' }, action = 'toggle_git_ignored'},
          { key = { 'cw' }, action = 'rename'},
          { key = { 'f' }, action = 'search_node'},
        },
      },
    },
    renderer = {
      icons = {
        glyphs = {
          default = '',
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
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = '?',
            deleted = "",
            ignored = "◌",
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
