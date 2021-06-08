require('vgit').setup {
  blames_enabled = false,
  hls = {
    VGitBlame =      { fg = '#4c566a' },
    VGitSignAdd =    { fg = '#A3BE8C' },
    VGitSignRemove = { fg = '#BF616A' }
  },
  hunk_sign = { signs = {
    add    = { text = "┃" },
    remove = { text = "┃" },
    change = { text = "┃" },
  } }
}
