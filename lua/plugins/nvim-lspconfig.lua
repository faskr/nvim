return {
  {
    'neovim/nvim-lspconfig',
    config = function ()
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if client.server_capabilities.hoverProvider then
            args.desc = 'hover'
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
          end
          if client.server_capabilities.signatureHelpProvider then
            args.desc = 'signature help'
            vim.keymap.set({ 'n', 'i' }, '<c-k>', vim.lsp.buf.signature_help, { buffer = args.buf })
          end
          if client.server_capabilities.declarationProvider then
            args.desc = 'declaration'
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf })
          end
          if client.server_capabilities.definitionProvider then
            args.desc = 'definition'
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
          end
          if client.server_capabilities.typeDefinitionProvider then
            args.desc = 'type definition'
            vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, { buffer = args.buf })
          end
          if client.server_capabilities.implementationProvider then
            args.desc = 'implementation'
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })
          end
          if client.server_capabilities.referencesProvider then
            args.desc = 'references'
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = args.buf })
          end
          if client.server_capabilities.renameProvider then
            args.desc = 'rename'
            vim.keymap.set('n', 'cr', vim.lsp.buf.rename, { buffer = args.buf })
          end
          if client.server_capabilities.codeActionProvider then
            args.desc = 'code action'
            vim.keymap.set('n', 'cx', vim.lsp.buf.code_action, { buffer = args.buf })
          end

          vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = args.buf })
          vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = args.buf })
          vim.keymap.set('n', '<space>', vim.diagnostic.open_float, { buffer = args.buf })
          vim.api.nvim_create_user_command('Dllist', vim.diagnostic.setloclist, {})
          vim.api.nvim_create_user_command('Dclist', vim.diagnostic.setqflist, {})
        end,
      })
    end
  },
}

