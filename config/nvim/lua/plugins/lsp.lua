require("mason").setup()
require("mason-lspconfig").setup()
local lsp = require('lspconfig')

local function lspcmd(name, scope, cmd)
  U.lcmd(name, 'vim.lsp.' .. scope .. '.' .. cmd)
end

function _G.show_workspace_folders()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

U.hi('LspDiagnosticsUnderlineError', 'gui=underline guisp=#BF616A')
U.hi('LspDiagnosticsDefaultError', 'link', 'ErrorMsg')
U.hi('LspDiagnosticsDefaultWarning', 'link', 'WarningMsg')
U.lcmd('WSList',         'show_workspace_folders')
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

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = { prefix = '•', },
  }
)

local on_attach = function(_, b)
  U.bopt(b, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  U.bnmc(b, 'ge', 'ShowError')
  U.bnmc(b, 'gd', 'Definition')
  U.bnmc(b, 'gh', 'SignatureHelp')
  U.bnmc(b, 'K',  'Hover')
  U.bnmc(b, ']e', 'PrevError')
  U.bnmc(b, '[e', 'NextError')
end

lsp.pylsp.setup { on_attach = on_attach }
lsp.lua_ls.setup {
  on_attach = on_attach,
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if not vim.loop.fs_stat(path..'/.luarc.json')
       and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
      client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
        Lua = {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        }
      })

      client.notify("workspace/didChangeConfiguration", {
        settings = client.config.settings
      })
    end
    return true
  end
}
