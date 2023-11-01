local package = require('lite.pack').package
local conf = require('lite.pack'):config('modules.dress')

package({ 'Meow-2/zephyr-nvim', config = conf('zephyr-nvim') })
