return function()
  local home = os.getenv('HOME')
  local vim_conf_path = vim.fn.stdpath('config')
  local db = require('dashboard')
  db.session_directory = home .. '/.cache/nvim/sessions'

  if vim.g.nvui or vim.g.remoteSession then
    db.preview_command = 'cat | lolcat -F 0.2'
    db.preview_file_path = vim_conf_path .. '/static/neovim.cat'
    db.preview_file_height = 12
    db.preview_file_width = 100
  else
    db.preview_command = 'ueberzug'
    db.preview_file_path = vim_conf_path .. '/static/logo.png'
    db.preview_file_height = 15
    db.preview_file_width = 46
  end
  -- db.preview_command = 'cat | lolcat -F 0.3'
  db.hide_statusline = false
  db.hide_tabline = false
  db.header_pad = 1
  db.center_pad = 1
  db.footer_pad = 5
  local plugin_count = #vim.tbl_keys(packer_plugins)
  db.custom_footer = { '  Neovim Loaded ' .. plugin_count .. ' plugins' }
  db.custom_center = {
    {
      icon = '  ',
      icon_hl = { fg = '#e95678' },
      desc = 'Update Plugins             ',
      shortcut = 'SPC p u',
      action = 'PackerUpdate',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#fac661' },
      desc = 'Recently opened files      ',
      action = 'Telescope oldfiles',
      shortcut = 'SPC f h',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#36d0e0' },
      desc = 'Find  File                 ',
      action = 'Telescope find_files find_command=rg,--hidden,--files',
      shortcut = 'SPC f f',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#61afef' },
      desc = 'File Browser               ',
      action = 'Telescope file_browser',
      shortcut = 'SPC f b',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#de841b' },
      desc = 'Find  word                 ',
      action = 'Telescope live_grep',
      shortcut = 'SPC f b',
    },
    {
      icon = '  ',
      icon_hl = { fg = '#d16d9e' },
      desc = 'Open Personal dotfiles     ',
      action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
      shortcut = 'SPC f d',
    },
  }
  -- db.custom_header = {
  --             '                                                ',
  --             ' ██╗  ██╗███████╗ █████╗ ██╗  ████████╗██╗  ██╗ ',
  --             ' ██║  ██║██╔════╝██╔══██╗██║  ╚══██╔══╝██║  ██║ ',
  --             ' ███████║█████╗  ███████║██║     ██║   ███████║ ',
  --             ' ██╔══██║██╔══╝  ██╔══██║██║     ██║   ██╔══██║ ',
  --             ' ██║  ██║███████╗██║  ██║███████╗██║   ██║  ██║ ',
  --             ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝  ╚═╝ ',
  --             '                                                ',
  --             '                                                ',
  --             '      ███████╗██╗██████╗ ███████╗████████╗      ',
  --             '      ██╔════╝██║██╔══██╗██╔════╝╚══██╔══╝      ',
  --             '      █████╗  ██║██████╔╝███████╗   ██║         ',
  --             '      ██╔══╝  ██║██╔══██╗╚════██║   ██║         ',
  --             '      ██║     ██║██║  ██║███████║   ██║         ',
  --             '      ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝         ',
  --             '                                                ',
  -- }
  -- db.custom_header = {
  --             '┍━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┑',
  --             '│ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⣛⣿⣿⣟⡻⢿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣆⣾⡿⠻⢻⣿⡿⣱⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢕⣾⣿⢟⣉⣙⣻⠷⣜⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣼⣹⣿⠁⢈⣼⡿⢑⣛⣛⣃⣛⣛⣻⣿⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣿⣿⣿⣿⠟⣁⢌⠉⠩⠭⢍⢛⢿⣿⣿⣿⡏⢎⣾⣿⢏⣾⣿⣿⣿⣿⡞⡞⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⡿⣿⠇⠀⠿⡋⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣿⣿⣿⢫⡖⢰⣿⢡⣤⣶⣦⣤⣢⠻⣿⣿⣘⣾⡿⡝⢬⡍⣉⣧⠻⠿⣿⢹⢸⣿⣿⣿⣿⡇⣿⣿⣿⣛⣛⣛⣛⠿⣿⣇⣷⠸⣠⠣⠟⣳⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣿⣿⢣⡟⣼⢸⣿⣿⣿⣿⢿⣿⣷⡵⡝⡇⢿⡿⡱⣱⣦⣤⣿⣡⡃⠉⡂⢠⠎⣿⣿⣿⣿⡇⣿⣿⣶⣶⣶⣾⣷⡇⣿⣿⣶⢸⡿⡆⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣿⢣⡿⠉⡟⢸⢃⣿⠯⠾⠓⣽⠛⣩⣹⡹⡼⣱⢱⣿⣿⣏⡛⣻⣿⣿⠃⢸⠀⣿⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⡖⡆⢝⡻⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢟⢻⣿⣿⣿⣿ │',
  --             '│ ⣿⢸⠋⡜⣼⢌⢩⠖⠂⠀⣲⣇⢀⣠⡄⡆⢧⠇⡼⣿⣟⢉⠀⢻⣿⡇⠘⠨⠈⢸⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣇⢿⣌⢿⢳⣶⣶⣾⣷⣾⣭⠍⣣⣶⢣⣿⣿⣿⣿⣿ │',
  --             '│ ⡟⢿⢸⣼⡏⡈⢸⣶⣶⣿⡿⣿⡜⣿⣿⠃⠘⢀⣇⠘⣫⡱⣤⢸⣭⣀⣀⡀⠀⡼⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⢸⣿⢰⠿⢿⣿⡿⠿⢿⣿⣷⣜⠃⣾⣿⣿⣿⣿⣿ │',
  --             '│ ⢁⣿⢸⠘⡠⢎⣿⣿⣿⣿⣳⠖⠮⠙⡿⣷⠀⢀⣴⣾⣿⣇⢿⣎⠉⢩⣭⠉⡅⣧⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⡏⣷⣿⣿⣿⣿⡇⡟⡿⣗⠿⣿⣶⣾⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿ │',
  --             '│ ⣾⢇⡾⠀⣷⡤⡘⢿⣿⣿⠃⣠⠄⠀⡇⢇⣴⣿⡿⣿⡟⣿⡈⢇⠾⢩⡁⡼⠀⠸⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣧⠇⣷⣝⡈⣛⣿⣿⣿⣿⣿⣿⢀⠎⠻⣿⣿⣿⣿ │',
  --             '│ ⡴⠋⣄⡴⢣⡇⢸⢄⠻⣿⡧⣉⣉⢅⣴⣿⣟⡛⠧⢙⢿⡜⣃⡆⠀⡿⠇⣄⡂⢽⣦⣿⣿⡇⣛⣛⣛⣿⣿⡏⣼⢸⣿⣭⣭⣭⣭⠤⣭⣭⣭⣭⣥⠭⠭⠭⠭⠭⠤⢤⣤⣭⣭⣭⣭ │',
  --             '│ ⠖⠊⠙⠚⠂⢠⠈⢳⠳⡨⠙⠛⣵⣿⣿⣿⡟⡀⣾⢘⣶⣾⡟⠀⠀⡆⢀⢸⢧⣼⣿⣿⣿⡇⣿⣿⣿⣿⣿⡿⠼⢸⣿⣿⢟⣫⡖⣬⣭⣝⠿⠿⢿⣿⣿⣿⣿⡿⣛⣛⢃⢶⣶⣎⣿ │',
  --             '│ ⣿⠿⣛⣦⡄⠀⠡⠱⠇⢇⣵⣿⣿⣿⣿⡿⣰⢡⢰⢿⣹⢟⡵⠰⠁⠇⡼⢨⢸⣿⣿⣿⣿⡇⠭⠉⣉⣀⣰⡐⢆⢸⣿⠑⣲⣮⠍⡚⢛⠶⣖⡭⣥⣆⣤⠤⢠⢮⣈⠁⣴⢲⡖⠂⣸ │',
  --             '│ ⣶⠛⢑⣢⣶⡀⠀⢇⣴⣿⣿⣿⣿⣿⡟⣰⣿⣿⡦⡈⣫⣾⢃⡒⠀⢱⠃⠆⠸⡫⠏⣻⣿⡇⠙⠛⠛⠋⠁⣬⣷⣿⣿⣔⣈⠝⠈⢂⠅⠋⠚⠡⢉⣘⡣⣃⣙⠥⠂⠘⠒⣢⣞⢠⣿ │',
  --             '│ ⣱⣾⣿⣿⣿⠟⣰⣿⣿⣿⣿⣿⣿⠏⣸⣿⣿⡏⡇⣿⡘⡇⣀⠃⠀⠈⠀⠀⣈⢌⡞⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣤⣤⣀⣀⣈⣉⣉⣉⣉⠉⠉⣀⣠⣴⣾⣿ │',
  --             '│ ⣿⣿⣿⡿⣣⣾⣿⣿⣿⣿⣿⣿⠏⠐⢸⣿⡿⡱⢧⢯⣧⠡⣷⠀⢀⠀⠀⢁⣷⡈⡒⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟ │',
  --             '┕━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┙',
  --             '                        Get back to work!                            ',
  --             '                          給我回去工作！                             ',
  -- }
end
