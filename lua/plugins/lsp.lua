return {
  {
    'williamboman/mason.nvim',
    lazy = false,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
  },
  {'hrsh7th/cmp-nvim-lsp'},
  {'saadparwaiz1/cmp_luasnip'},
  {'L3MON4D3/LuaSnip'},
  {
    'hrsh7th/nvim-cmp',
    config = function ()
      local luasnip = require('luasnip')
      luasnip.config.setup {}
      local cmp = require('cmp')
      -- local cmp_select = {behavior = cmp.SelectBehavior.Select}
      cmp.setup({
        sources = {
          {name = 'path'},
          {name = 'nvim_lsp'},
          {name = 'luasnip'},
          {name = 'buffer'},
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<C-q>'] = cmp.mapping.abort(),
          ['<C-Space>'] = cmp.mapping.complete(),
          -- ['<C-b>'] = cmp.scroll_docs(-4),
          -- ['<C-f>'] = cmp.scroll_docs(4),
        }),
      })
    end
  },
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v3.x',
  --   config = function ()
  --     local lsp_zero = require('lsp-zero')
  --     lsp_zero.preset('recommended')
  --
  --     lsp_zero.on_attach(function(client, bufnr)
  --       -- see :help lsp-zero-keybindings
  --       -- to learn the available actions
  --       lsp_zero.default_keymaps({buffer = bufnr})
  --     end)
  --   end
  -- },
}

