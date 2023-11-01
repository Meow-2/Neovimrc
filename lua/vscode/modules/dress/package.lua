local package = require('vscode.pack').package
local conf = require('vscode.pack'):config('modules.dress')

package({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })
