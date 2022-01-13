# This is my shortcut in nvim

| Mode     | Key              | Map/effect                                                |
|----------|------------------|-----------------------------------------------------------|
| normal   | s                | :w<CR>                                                    |
| normal   | q                | :q!<CR>                                                   |
| normal   | Q                | q                                                         |
| normal   | H                | 0                                                         |
| normal   | J                | 5j                                                        |
| normal   | K                | 5k                                                        |
| normal   | L                | $                                                         |
| normal   | Y                | y$                                                        |
| normal   | R                | :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>            |
| normal   | T                | :FloatermNew --height=0.75 --width=0.7<cr>                |
| normal   | S                | <nop>                                                     |
| normal   | SH               | :set nosplitright<CR>:vsplit<CR>                          |
| normal   | SJ               | :set splitbelow<CR>:split<CR>                             |
| normal   | SK               | :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>        |
| normal   | SL               | :set splitright<CR>:vsplit<CR>                            |
| normal   | tt               | :CocCommand explorer<CR>                                  |
| normal   | to               | :XTabMode<CR>                                             |
| normal   | tn               | :tabe<CR>                                                 |
| normal   | tl               | :+tabnext<CR>                                             |
| normal   | tc               | :tabclose<CR>                                             |
| normal   | tmh              | :-tabmove<CR>                                             |
| normal   | tml              | :+tabmove<CR>                                             |
| normal   | gd               | <Plug>(coc-definition)                                    |
| normal   | gy               | <Plug>(coc-type-definition)                               |
| normal   | gi               | <Plug>(coc-implementation)                                |
| normal   | gr               | <Plug>(coc-references)                                    |
| normal   | \v               | v$h                                                       |
| normal   | \p               | :echo expand('%:p')<CR>                                   |
| normal   | <esc>            | <esc>:nohlsearch<cr>                                      |
| normal   | <C-a>            | ggVG                                                      |
| normal   | <C-y>            | :<C-u>CocList -A --normal yank<cr>                        |
| normal   | <C-f>            | :Rg<CR>                                                   |
| normal   | <C-h>            | :History<CR>                                              |
| normal   | <C-b>            | :Buffers<CR>                                              |
| normal   | <C-d>            | :BD<CR>                                                   |
| normal   | <C-t>            | :silent!Vista finder coc<CR>                              |
| normal   | <C-p>            | :Leaderf file<CR>                                         |
| normal   | <C-]>            | find tags by LeaderF                                      |
| normal   | <C-/>            | gcc                                                       |
| normal   | <c-l>            | 'Find Under' visual-multi                                 |
| normal   | <c-l>            | 'Find Subword Under' visual-multi                         |
| normal   | <c-j>            | 'Add Cursor Down' visual-multi                            |
| normal   | <c-k>            | 'Add Cursor Up' visual-multi                              |
| normal   | \\q              | 'Cancel the last Selected Cursor ' visual-multi           |
| normal   | <F1>             | :call f1map#source_vimrc_and_file_build()<cr>             |
| normal   | <F2>             | :AsyncTask file-run<cr>                                   |
| normal   | <F3>             | :call asyncrun#quickfix_toggle(6)<cr>                     |
| normal   | <F4>             | :tabclose<cr>                                             |
| normal   | <LEADER>i        | zf%                                                       |
| normal   | <LEADER>o        | za                                                        |
| normal   | <LEADER>h        | <C-w>h                                                    |
| normal   | <LEADER>j        | <C-w>j                                                    |
| normal   | <LEADER>k        | <C-w>k                                                    |
| normal   | <LEADER>l        | <C-w>l                                                    |
| normal   | <LEADER>c        | <C-w>c                                                    |
| normal   | <LEADER>=        | <C-w>=                                                    |
| normal   | <LEADER>p        | :call <SID>show_documentation()<CR>                       |
| normal   | <LEADER>v        | :Vista!!<CR>                                              |
| normal   | <LEADER>;        | :History:<CR>                                             |
| normal   | <LEADER>gi       | :FzfGitignore<CR>                                         |
| normal   | <LEADER>rc       | :e $HOME/.config/nvim/init.vim<CR>                        |
| normal   | <LEADER>-        | <Plug>(coc-diagnostic-prev)                               |
| normal   | <LEADER>=        | <Plug>(coc-diagnostic-next)                               |
| normal   | <LEADER>rn       | <Plug>(coc-rename)                                        |
| normal   | <LEADER>f        | <Plug>(coc-fix-current)                                   |
| normal   | <LEADER>aw       | <Plug>(coc-codeaction-selected)w                          |
| normal   | <LEADER>di       | <Plug>VimspectorBalloonEval                               |
| normal   | <LEADER>db       | :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR> |
| normal   | <LEADER>tm       | :TableModeToggle<CR>                                      |
| normal   | <LEADER><left>   | :vertical resize+5<CR>                                    |
| normal   | <LEADER><down>   | :res -5<CR>                                               |
| normal   | <LEADER><up>     | :res +5<CR>                                               |
| normal   | <LEADER><right>  | :vertical resize-5<CR>                                    |
| normal   | <LEADER><LEADER> | <esc>/<++><CR>:nohlsearch<CR>c4l                          |
| insert   | <C-l>            | <Plug>(coc-snippets-expand)                               |
| insert   | <C-j>            | <Plug>(coc-snippets-expand-jump)                          |
| insert   | <C-y>            | <esc>:<C-u>CocList -A --normal yank<cr>                   |
| insert   | <c-space>        | coc#refresh()                                             |
| visual   | <C-j>            | <Plug>(coc-snippets-select)                               |
| visual   | <C-/>            | gc                                                        |
| visual   | ga               | :Tabularize /                                             |
| visual   | y                | "+y                                                       |
| xmap     | if               | <Plug>(coc-funcobj-i)                                     |
| xmap     | af               | <Plug>(coc-funcobj-a)                                     |
| omap     | if               | <Plug>(coc-funcobj-i)                                     |
| omap     | af               | <Plug>(coc-funcobj-a)                                     |
| xmap     | ic               | <Plug>(coc-classobj-i)                                    |
| omap     | ic               | <Plug>(coc-classobj-i)                                    |
| xmap     | ac               | <Plug>(coc-classobj-a)                                    |
| omap     | ac               | <Plug>(coc-classobj-a)                                    |
| xmap     | <LEADER>a        | <Plug>(coc-codeaction-selected)                           |
| xmap     | <LEADER>di       | <Plug>VimspectorBalloonEval                               |
| terminal | <esc>            | <C-\><C-N>:q!<cr>                                         |













