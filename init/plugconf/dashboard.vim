" ===
" === dashboard
" ===
let g:mapleader="\<Space>"
let g:dashboard_default_executive ='fzf'
" nmap <Leader>ss :mksession! ~/.cache/nvim/last_session.vim<CR>
nnoremap <silent> <Leader>ss :SessionManager! save_current_session<CR>
nnoremap <silent> <Leader>sl :SessionManager! load_session<CR>
nnoremap <silent> <Leader>sd :SessionManager! delete_session<CR>
" nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
" nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>t :DashboardChangeColorscheme<CR>
" nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>m :DashboardJumpMark<CR>
nnoremap <silent> <Leader>n :DashboardNewFile<CR>
let g:dashboard_custom_shortcut={
            \ 'find_history'       : 'SPC h  ',
            \ 'find_file'          : 'SPC f  ',
            \ 'new_file'           : 'SPC n  ',
            \ 'change_colorscheme' : 'SPC t  ',
            \ 'find_word'          : 'SPC w  ',
            \ 'last_session'       : 'SPC sl ',
            \ 'book_marks'         : 'SPC m  ',
            \ }
let g:dashboard_custom_header = [
            \ '                                                ',
            \ ' ██╗  ██╗███████╗ █████╗ ██╗  ████████╗██╗  ██╗ ',
            \ ' ██║  ██║██╔════╝██╔══██╗██║  ╚══██╔══╝██║  ██║ ',
            \ ' ███████║█████╗  ███████║██║     ██║   ███████║ ',
            \ ' ██╔══██║██╔══╝  ██╔══██║██║     ██║   ██╔══██║ ',
            \ ' ██║  ██║███████╗██║  ██║███████╗██║   ██║  ██║ ',
            \ ' ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝  ╚═╝ ',
            \ '                                                ',
            \ '                                                ',
            \ '      ███████╗██╗██████╗ ███████╗████████╗      ',
            \ '      ██╔════╝██║██╔══██╗██╔════╝╚══██╔══╝      ',
            \ '      █████╗  ██║██████╔╝███████╗   ██║         ',
            \ '      ██╔══╝  ██║██╔══██╗╚════██║   ██║         ',
            \ '      ██║     ██║██║  ██║███████║   ██║         ',
            \ '      ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝         ',
            \ '                                                ',
            \]

