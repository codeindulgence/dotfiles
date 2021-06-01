require('nvim-treesitter.configs').setup {
  indent = { enable = true },
  highlight = { enable = true }
}

require('vgit').setup {
  blames_enabled = false,
  hls = { VGitBlame = { fg = '#4c566a' } }
}
