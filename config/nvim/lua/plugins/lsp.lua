local lsp = require('lspconfig')

local function lspcmd(name, scope, cmd)
  U.lcmd(name, 'vim.lsp.'..scope..'.'..cmd)
end

function _G.show_workspace_folders()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end
U.hi('LspDiagnosticsUnderlineError', 'gui=underline guisp=#BF616A')
U.hi('LspDiagnosticsDefaultError', 'link', 'ErrorMsg')
U.hi('LspDiagnosticsDefaultWarning', 'link', 'WarningMsg')
U.lcmd('WSList',      'show_workspace_folders')
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

F.sign_define('LspDiagnosticsSignError',       {text = ''})
F.sign_define('LspDiagnosticsSignWarning',     {text = ''})
F.sign_define('LspDiagnosticsSignInformation', {text = ''})
F.sign_define('LspDiagnosticsSignHint',        {text = ''})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = '•', },
  }
)

local on_attach = function(_, b)
  U.bopt(b, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  U.bnmc(b, 'ge', 'ShowError')
  U.bnmc(b, 'gd', 'Definition')
  U.bnmc(b, 'K',  'Hover')
  U.bnmc(b, ']d', 'PrevError')
  U.bnmc(b, '[d', 'NextError')

  require'completion'.on_attach()
end

lsp.gopls.setup { on_attach = on_attach }

lsp.efm.setup {
  on_attach = on_attach,
  filetypes = { 'python', 'yaml' , 'markdown' },
}

lsp.sumneko_lua.setup {
  cmd = { Data..'/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server' },
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
    }
  },
}

lsp.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "strict",
      },
    }
  }
}
