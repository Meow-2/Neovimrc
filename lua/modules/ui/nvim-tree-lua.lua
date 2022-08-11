return function()
    require('nvim-tree').setup({
        disable_netrw = true,
        sort_by = "case_sensitive",
        auto_reload_on_write = true,
        hijack_cursor = false,
        hijack_unnamed_buffer_when_opening = false,
        ignore_buffer_on_setup = false,
        open_on_setup = false,
        open_on_setup_file = false,
        open_on_tab = false,
        sort_by = "name",
        view = {
            adaptive_size = true,
            side = 'left',
            number = false,
            relativenumber = false,
            signcolumn = 'yes',
            hide_root_folder = false,
            preserve_window_proportions = false,
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
                quit_on_open = true,
                resize_window = true,
                window_picker = {
                    enable = true,
                    chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                    exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                    },
                },
            }
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        }
    })
    require('nvim-tree.events').on_file_created(function(file) vim.cmd("edit " .. file.fname) end)
end
