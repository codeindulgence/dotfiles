Cmd = vim.cmd
F   = vim.fn
U = require('util')
Data = F.stdpath('data')
require('plugins')
I = function(...)
  print(vim.inspect(...))
end

