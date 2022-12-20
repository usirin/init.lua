local cmp = require("cmp")
-- local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local fn = vim.fn

local M = {}

local setup_cmp = function()
  cmp.setup({
    snippet = {
      expand = function(args)
        fn["UltiSnips#Anon"](args.body)
      end,
    },

    window = {
      documentation = cmp.config.window.bordered(),
      completion = cmp.config.window.bordered(),
    },

    mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
        -- cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
        -- cmp_ultisnips_mappings.jump_backwards(fallback)
      end, { "i", "s" }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(function()
        cmp.complete()
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping.select_next_item(),
      ["<C-k>"] = cmp.mapping.select_prev_item(),

      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = "nvim_lsp_signature_help" },
      { name = "nvim_lsp" },
      { name = "ultisnips", keyword_length = 3 },
      { name = "tmux", max_item_count = 5 },
      {
        name = "buffer",
        keyword_length = 3,
      },
      { name = "path" },
    }),
  })
end

local setup_search = function()
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
end

local setup_exmode = function()
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

M.setup = function()
  setup_cmp()
  setup_search()
  setup_exmode()
end

return M
