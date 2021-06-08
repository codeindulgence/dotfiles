local lsp = require('lspconfig')
require('lspinstall').setup()

function lspcmd(name, scope, cmd)
  lcmd(name, 'vim.lsp.'..scope..'.'..cmd)
end

function show_workspace_folders()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

hi('LspDiagnosticsUnderlineError', 'gui=underline guisp=#BF616A')
hi('LspDiagnosticsDefaultError', 'link', 'ErrorMsg')
hi('LspDiagnosticsDefaultWarning', 'link', 'WarningMsg')

lcmd('WSList',           'buf',        'show_workspace_folders')
lspcmd('WSAdd',          'buf',        'add_workspace_folder')
lspcmd('WSRemove',       'buf',        'remove_workspace_folder')
lspcmd('Definition',     'buf',        'definition')
lspcmd('Declaration',    'buf',        'declaration')
lspcmd('Implementation', 'buf',        'implementation')
lspcmd('SignatureHelp',  'buf',        'signature_help')
lspcmd('TypeDefinition', 'buf',        'type_definition')
lspcmd('RenameVar',      'buf',        'rename')
lspcmd('Hover',          'buf',        'hover')
lspcmd('CodeAction',     'buf',        'code_action')
lspcmd('References',     'buf',        'references')
lspcmd('Format',         'buf',        'formatting')
lspcmd('NextError',      'diagnostic', 'goto_prev')
lspcmd('PrevError',      'diagnostic', 'goto_next')
lspcmd('ShowError',      'diagnostic', 'show_line_diagnostics')

f.sign_define('LspDiagnosticsSignError',       {text = ''})
f.sign_define('LspDiagnosticsSignWarning',     {text = ''})
f.sign_define('LspDiagnosticsSignInformation', {text = ''})
f.sign_define('LspDiagnosticsSignHint',        {text = ''})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = '•', },
  }
)

local on_attach = function(c, b)
  bopt(b, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  bnmc(b, 'ge', 'ShowError')
  bnmc(b, 'gd', 'Definition')
  bnmc(b, 'K',  'Hover')
  bnmc(b, ']d', 'PrevError')
  bnmc(b, '[d', 'NextError')

  require'completion'.on_attach()
end

local servers = { 'gopls', 'lua' }
for _, server in ipairs(servers) do
  lsp[server].setup { on_attach = on_attach }
end

lsp.efm.setup {
  on_attach = on_attach,
  filetypes = { 'python', 'yaml' , 'markdown' },
}

lsp.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
      venvPath = "/Users/nick/.pyenv/versions/",
      venv = "dbe"
    }
  }
}
