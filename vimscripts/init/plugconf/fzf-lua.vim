" ===
" === fzf-lua
" ===
noremap <silent> <leader>f :FzfLua files<CR>
noremap <silent> <leader>w :FzfLua grep_project<cr>
noremap <silent> <leader>h :FzfLua oldfiles cwd=~<CR>
noremap <silent> <leader>p :FzfLua builtin<CR>
noremap <silent> <leader>b :FzfLua buffers<CR>
" noremap <silent> <C-t> :FzfLua lines<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
noremap <silent> z= :FzfLua spell_suggest<CR>
" noremap <leader>; :History:<CR>
augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end
" if g:nvim_plugins_installation_completed == 1
lua <<EOF
local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
	global_resume = true,
	global_resume_query = true,
	winopts = {
		height = 0.95,
		width  = 0.95,
		preview = {
			scrollbar = 'float',
		},
		fullscreen = false,
		vertical   = 'down:45%',      -- up|down:size
		horizontal = 'right:60%',     -- right|left:size
		hidden     = 'nohidden',
		title      = true,
        border     = 'single',
        hl = {
           normal         = 'Normal',        -- window normal color (fg+bg)
           border         = 'Normal',        -- border color (try 'FloatBorder')
           -- Only valid with the builtin previewer:
           cursor         = 'Cursor',        -- cursor highlight (grep/LSP matches)
           cursorline     = 'CursorLine',    -- cursor line
           search         = 'Search',        -- search matches (ctags)
           -- title       = 'Normal',        -- preview border title (file/buffer)
           -- scrollbar_f = 'PmenuThumb',    -- scrollbar "full" section highlight
           -- scrollbar_e = 'PmenuSbar',     -- scrollbar "empty" section highlight
        },
	},
	keymap = {
		-- These override the default tables completely
		-- no need to set to `false` to disable a bind
		-- delete or modify is sufficient
		builtin = {
			["<c-f>"]       = "toggle-fullscreen",
			["<c-r>"]       = "toggle-preview-wrap",
			["<c-p>"]       = "toggle-preview",
			["<c-down>"]    = "preview-page-down",
			["<c-up>"]      = "preview-page-up",
			-- ["<S-left>"] = "preview-page-reset",
		},
		fzf = {
			-- ["esc"]        = "abort",
			-- ["ctrl-h"]     = "unix-line-discard",
			-- ["ctrl-k"]     = "half-page-down",
			-- ["ctrl-b"]     = "half-page-up",
			-- ["ctrl-"]      = "beginning-of-line",
			-- ["ctrl-a"]     = "end-of-line",
			["ctrl-a"]        = "toggle-all",
			-- ["f3"]         = "toggle-preview-wrap",
			-- ["f4"]         = "toggle-preview",
			-- ["shift-down"] = "preview-page-down",
			-- ["shift-up"]   = "preview-page-up",
			["ctrl-j"]        = "down",
			["ctrl-k"]        = "up",
		},
	},
    actions = {
        -- These override the default tables completely
        -- no need to set to `false` to disable an action
        -- delete or modify is sufficient
        files = {
            -- providers that inherit these actions:
            --   files, git_files, git_status, grep, lsp
            --   oldfiles, quickfix, loclist, tags, btags
            --   args
            -- default action opens a single selection
            -- or sends multiple selection to quickfix
            -- replace the default action with the below
            -- to open all files whether single or multiple
            ["default"]     = actions.file_edit,
            ["default"]     = actions.file_edit_or_qf,
            ["ctrl-s"]      = actions.file_split,
            ["ctrl-l"]      = actions.file_vsplit,
            ["ctrl-t"]      = actions.file_tabedit,
            ["alt-q"]       = actions.file_sel_to_qf,
        },
        buffers = {
            -- providers that inherit these actions:
            --   buffers, tabs, lines, blines
            ["default"]     = actions.buf_edit,
            ["ctrl-s"]      = actions.buf_split,
            ["ctrl-l"]      = actions.buf_vsplit,
            ["ctrl-t"]      = actions.buf_tabedit,
        }
    },
    previewers = {
        cat = {
           cmd             = "cat",
           args            = "--number",
        },
        bat = {
            cmd             = "bat",
            args            = "--style=numbers,changes --color always",
            theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
            config          = nil,            -- nil uses $BAT_CONFIG_PATH
        },
        head = {
            cmd             = "head",
            args            = nil,
        },
        git_diff = {
            cmd_deleted     = "git diff --color HEAD --",
            cmd_modified    = "git diff --color HEAD",
            cmd_untracked   = "git diff --color --no-index /dev/null",
            -- pager        = "delta",      -- if you have `delta` installed
        },
        man = {
            cmd             = "man -c %s | col -bx",
        },
        builtin = {
            syntax          = true,         -- preview syntax highlight?
            syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
            syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
        },
    },
    files = {
        -- previewer      = "bat",          -- uncomment to override previewer
                                            -- (name from 'previewers' table)
                                            -- set to 'false' to disable
        prompt            = 'Files❯ ',
        multiprocess      = true,           -- run command in a separate process
        git_icons         = true,           -- show git icons?
        file_icons        = true,           -- show file icons?
        color_icons       = true,           -- colorize file|git icons
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
        -- default options are controlled by 'fd|rg|find|_opts'
        -- NOTE: 'find -printf' requires GNU find
        -- cmd            = "find . -type f -printf '%P\n'",
        find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts           = "--color=never --files --hidden --follow -g '!.git'",
        fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
    },
    buffers = {
        prompt            = 'Buffers❯ ',
        file_icons        = true,         -- show file icons?
        color_icons       = true,         -- colorize file|git icons
        sort_lastused     = true,         -- sort buffers() by last used
    },
}
EOF
