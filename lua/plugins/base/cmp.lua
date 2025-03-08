--- source: mgastonportillo

---@diagnostic disable: different-requires

---@type NvPluginSpec
return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    { "hrsh7th/cmp-cmdline" },
    { "brenoprata10/nvim-highlight-colors" },
    { "mlaursen/vim-react-snippets" },
    -- { "github/copilot.vim" },
  },

  ---@type cmp.ConfigSchema
  opts = {
    mapping = {
      ["<Tab>"] = function(fallback)
        fallback()
      end,
      ["<S-Tab>"] = function(fallback)
        fallback()
      end,
    },
    completion = { completeopt = "menu,menuone,noinsert" },

    config = function(_, opts)
      local cmp = require "cmp"

      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = { "sql", "mysql", "plsql" },
      --   callback = function()
      --     cmp.setup.buffer {
      --       sources = {
      --         { name = "vim-dadbod-completion" },
      --       },
      --     }
      --   end,
      -- })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline" },
          { name = "path" },
          { name = "noice_popupmenu" },
          {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          },
        },
      })

      -- cmp.setup.cmdline({ "/", "?" }, {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer" },
      --   },
      -- })

      -- Set up lspconfig.
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      -- require("lspconfig")["lua_ls"].setup {
      --   capabilities = capabilities,
      -- }
      cmp.setup {
        enabled = function()
          -- disable completion in comments
          local context = require "cmp.config.context"
          -- keep command mode completion enabled when cursor is in a comment
          if vim.api.nvim_get_mode().mode == "c" then
            return true
          else
            return not context.in_treesitter_capture "comment" and not context.in_syntax_group "Comment"
          end
        end,
      }

      local cmp_ui = require("nvconfig").ui.cmp
      local cmp_style = cmp_ui.style

      local colors = require "nvim-highlight-colors.color.utils"
      local utils = require "nvim-highlight-colors.utils"

      local field_arrangement = {
        atom = { "kind", "abbr", "menu" },
        atom_colored = { "kind", "abbr", "menu" },
      }

      opts.formatting = {
        fields = field_arrangement[cmp_style] or { "abbr", "menu", "kind" },

        format = function(entry, item)
          local icons = require "nvchad.icons.lspkind"
          icons.Color = "󱓻"

          local icon = (cmp_ui.icons and icons[item.kind]) or ""

          if cmp_style == "atom" or cmp_style == "atom_colored" then
            icon = " " .. icon .. " "
            item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
            item.kind = icon
          else
            icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
            item.kind = string.format("%s%s ", icon, cmp_ui.lspkind_text and item.kind or "")
          end

          local entryItem = entry:get_completion_item()
          if entryItem == nil then
            return item
          end

          local entryDoc = entryItem.documentation
          if entryDoc == nil or type(entryDoc) ~= "string" then
            return item
          end

          local color_hex = colors.get_color_value(entryDoc)
          if color_hex == nil then
            return item
          end

          local highlight_group = utils.create_highlight_name("fg-" .. color_hex)
          vim.api.nvim_set_hl(0, highlight_group, { fg = color_hex, default = true })
          item.kind_hl_group = highlight_group

          return item
        end,
      }

      cmp.setup(opts)
    end,
  },
}
