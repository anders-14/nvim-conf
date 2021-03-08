local nvim_lsp = require'lspconfig'
local map = require('utils').map
local buf_get_filetype = require('utils').buf_get_filetype

local custom_on_attach = function(client)
  -- require'completion'.on_attach(client)
  map('n', '<leader>rn', '<cmd> lua vim.lsp.buf.rename()<CR>')
  map('n', '<leader>rf', '<cmd> lua vim.lsp.buf.references()<CR>')
  map('n', 'K',          '<cmd> lua vim.lsp.buf.hover()<CR>')
  map('n', 'gd',         '<cmd> lua vim.lsp.buf.definition()<CR>')
  map('n', '<leader>e',  '<cmd> lua vim.lsp.diagnostic.goto_next()<CR>')
  -- map('i', '<c-space>',  '<cmd> lua vim.lsp.buf.completion()<CR>')
end

-- Go
nvim_lsp.gopls.setup{
  on_attach=custom_on_attach
}

-- Python
nvim_lsp.jedi_language_server.setup{
  on_attach=custom_on_attach
}

-- JS AND TS
nvim_lsp.tsserver.setup{
  on_attach=custom_on_attach
}

-- VimScript
nvim_lsp.vimls.setup{
  on_attach=custom_on_attach
}

-- Bash
nvim_lsp.bashls.setup{
  on_attach=custom_on_attach
}

-- SNIPPETS FOR HTML
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- HTML
nvim_lsp.html.setup{
  on_attach=custom_on_attach,
  capabilities = capabilities
}

-- CSS
nvim_lsp.cssls.setup{
  on_attach=custom_on_attach,
  capabilities = capabilities
}

if (buf_get_filetype(0) ~= "md") then
  require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'disable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;

    source = {
      path = true;
      buffer = true;
      calc = true;
      vsnip = true;
      nvim_lsp = true;
      nvim_lua = true;
      spell = true;
      tags = true;
      snippets_nvim = true;
      treesitter = true;
    };
  }
end
