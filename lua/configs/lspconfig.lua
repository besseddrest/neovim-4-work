require("nvchad.configs.lspconfig").defaults()

local servers = {"html", "cssls", "ts_ls", "jsonls", "markdown_oxide", "qmlls" }

local htmlSettings = {
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html', 'templ' },
  root_markers = { 'package.json', '.git' },
  settings = {},
  init_options = {
    provideFormatter = true,
    embeddedLanguages = { css = true, javascript = true },
    configurationSection = { 'html', 'css', 'javascript' },
  },
}

local cssSettings = {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  init_options = { provideFormatter = true }, -- needed to enable formatting capabilities
  root_markers = { 'package.json', '.git' },
  settings = {
    css = { validate = true },
    scss = { validate = true },
    less = { validate = true },
  },
}

local tsSettings = {
  init_options = { hostInfo = 'neovim' },
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  handlers = {
    -- handle rename request for certain code actions like extracting functions / types
    ['_typescript.rename'] = function(_, result, ctx)
      local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      vim.lsp.util.show_document({
        uri = result.textDocument.uri,
        range = {
          start = result.position,
          ['end'] = result.position,
        },
      }, client.offset_encoding)
      vim.lsp.buf.rename()
      return vim.NIL
    end,
  },
  commands = {
    ['editor.action.showReferences'] = function(command, ctx)
      local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
      local file_uri, position, references = unpack(command.arguments)

      local quickfix_items = vim.lsp.util.locations_to_items(references, client.offset_encoding)
      vim.fn.setqflist({}, ' ', {
        title = command.title,
        items = quickfix_items,
        context = {
          command = command,
          bufnr = ctx.bufnr,
        },
      })

      vim.lsp.util.show_document({
        uri = file_uri,
        range = {
          start = position,
          ['end'] = position,
        },
      }, client.offset_encoding)

      vim.cmd('botright copen')
    end,
  },
  on_attach = function(client, bufnr)
    -- ts_ls provides `source.*` code actions that apply to the whole file. These only appear in
    -- `vim.lsp.buf.code_action()` if specified in `context.only`.
    vim.api.nvim_buf_create_user_command(bufnr, 'LspTypescriptSourceAction', function()
      local source_actions = vim.tbl_filter(function(action)
        return vim.startswith(action, 'source.')
      end, client.server_capabilities.codeActionProvider.codeActionKinds)

      vim.lsp.buf.code_action({
        context = {
          only = source_actions,
        },
      })
    end, {})
  end,
}

local jsonSettings = {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = {
    provideFormatter = true,
  },
  root_markers = { '.git' },
}

local markdownSettings = {
    cmd = {'markdown-oxide'},
    filetypes = {"markdown" },
    on_attach = {
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  filetypes = { 'markdown' },
  cmd = { 'markdown-oxide' },
  on_attach = function(client, bufnr)
    for _, cmd in ipairs({ 'today', 'tomorrow', 'yesterday' }) do
      vim.api.nvim_buf_create_user_command(bufnr, 'Lsp' .. ('%s'):format(cmd:gsub('^%l', string.upper)), function()
        command_factory(client, bufnr, cmd)
      end, {
        desc = ('Open %s daily note'):format(cmd),
      })
    end
  end,
},
root_markers = { ".git", ".obsidian", ".moxide.toml" }
}

local qmlSettings = {
  cmd = { 'qmlls' },
  filetypes = { 'qml', 'qmljs' },
  root_markers = { '.git' },
}

vim.lsp.enable(servers)
vim.lsp.config("html", htmlSettings)
vim.lsp.config("cssls", cssSettings)
vim.lsp.config("ts_ls", tsSettings)
vim.lsp.config("jsonls", jsonSettings)
vim.lsp.config("markdown_oxide", markdownSettings)
vim.lsp.config("qmlls", qmlSettings)

-- to configure lsps f:urther read :h vim.lsp.config
