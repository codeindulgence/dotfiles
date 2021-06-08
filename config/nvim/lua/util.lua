-- Aliases
cmd = vim.cmd
f   = vim.fn
DATA_PATH = vim.fn.stdpath('data')

-- Buffer Option
function bopt(bufnr, name, value)
  vim.api.nvim_buf_set_option(bufnr, name, value)
end

-- Buffer Normal Map
function bnm(bufnr, lhs, rhs)
  local opts = { noremap=true, silent=true }
  local cmd = rhs..'<CR>'
  vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, cmd, opts)
end

-- Buffer Normal Map Command
function bnmc(bufnr, lhs, rhs)
  bnm(bufnr, lhs, '<Cmd>'..rhs)
end

-- Buffer Normal Map Lua
function bnml(bufnr, lhs, rhs)
  bnmc(bufnr, lhs, 'lua '..rhs)
end

-- Create Lua Function Command
function lcmd(name, fn)
  cmd(':command '..name..' lua '..fn..'()')
end

-- Highlight
function hi(name, values, link)
  if(values == 'link') then
    cmd('highlight! default link '..name..' '..link)
  else
    cmd('highlight! '..name..' '..values)
  end
end
