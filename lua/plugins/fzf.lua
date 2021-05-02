local utils = require('utils')

utils.keymap('n', '<C-p>', ':ProjectRootExe Files<CR>')
utils.keymap('n', '<C-t>', ':GFiles<CR>')
utils.keymap('n', '<C-f>f', ':<C-u>ProjectRootExe Ag <CR>')
utils.keymap('n', '<leader>b', ':<C-u>Buffers<CR>')
