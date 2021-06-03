local lsp = require('lspconfig')

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

local on_attach = function(c, b)
  bopt(b, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  bnmc(b, 'gd', 'Definition')
  bnmc(b, 'K',  'Hover')
  bnmc(b, '[d', 'PrevError')
  bnmc(b, ']d', 'NextError')

  require'completion'.on_attach()
end

local servers = { 'gopls' }
for _, server in ipairs(servers) do
  lsp[server].setup { on_attach = on_attach }
end
