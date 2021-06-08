local M = {}

-- Buffer Option
function M.bopt(bufnr, name, value)
  vim.api.nvim_buf_set_option(bufnr, name, value)
end

-- Buffer Normal Map
function M.bnm(bufnr, lhs, rhs)
  local opts = { noremap=true, silent=true }
  local cmd = rhs..'<CR>'
  vim.api.nvim_buf_set_keymap(bufnr, 'n', lhs, cmd, opts)
end

-- Buffer Normal Map Command
function M.bnmc(bufnr, lhs, rhs)
  M.bnm(bufnr, lhs, '<Cmd>'..rhs)
end

-- Buffer Normal Map Lua
function M.bnml(bufnr, lhs, rhs)
  M.bnmc(bufnr, lhs, 'lua '..rhs)
end

-- Create Lua Function Command
function M.lcmd(name, fn)
  Cmd('command '..name..' lua '..fn..'()')
end

-- Highlight
function M.hi(name, values, link)
  if(values == 'link') then
    Cmd('highlight! default link '..name..' '..link)
  else
    Cmd('highlight! '..name..' '..values)
  end
end

return M
