require('vgit').setup {
  blames_enabled = false,
  hls = { VGitBlame = { fg = '#4c566a' } },
  hunk_sign = { signs = {
    add    = { text = "┃" },
    remove = { text = "┃" },
    change = { text = "┃" },
  } }
}
