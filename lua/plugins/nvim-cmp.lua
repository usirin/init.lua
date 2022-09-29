local cmp = require("cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

local fn = vim.fn

local M = {}

M.setup = function()
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
        cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
      end, { "i", "s" }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(function() cmp.complete() end, { "i", "s" }),

      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),

    sources = cmp.config.sources({
      { name = "ultisnips", keyword_length = 2, max_item_count = 3 },
      { name = "nvim_lsp" },
      { name = "tmux" },
      {
        name = "buffer",
        keyword_length = 3,
        option = {
          -- complete from visible buffers
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
      { name = "path" },
    }),
  })
end

return M
