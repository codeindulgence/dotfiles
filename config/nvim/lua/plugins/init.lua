-- Extended configs
require('plugins.treesitter')
require('plugins.lsp')

-- Basic configs
require('vgit').setup({
  settings = {
    live_blame = { enabled = false }
  }
})
