local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  -- Install a plugin
  {
    "kylechui/nvim-surround",
    lazy = false,
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      local ft = require "Comment.ft"
      ft.set("qmljs", { "//%s", "/*%s*/" })
    end,
  },
  -- {
  --   "hrsh7th/cmp-nvim-lsp-signature-help",
  --   lazy = false,
  -- },
  {
    "tpope/vim-sleuth",
    lazy = false,
  },
  {
    "simrat39/rust-tools.nvim",
    config = function()
      local status_ok, rust_tools = pcall(require, "rust-tools")
      if not status_ok then
        return
      end

      local opts = {
        tools = {
          executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
          reload_workspace_from_cargo_toml = true,
          inlay_hints = {
            auto = true,
            only_current_line = false,
            show_parameter_hints = true,
            parameter_hints_prefix = "<-",
            other_hints_prefix = "=>",
            max_len_align = false,
            max_len_align_padding = 3,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment",
          },
          hover_actions = {
            -- border = {
            --        { "╭", "FloatBorder" },
            --        { "─", "FloatBorder" },
            --        { "╮", "FloatBorder" },
            --        { "│", "FloatBorder" },
            --        { "╯", "FloatBorder" },
            --        { "─", "FloatBorder" },
            --        { "╰", "FloatBorder" },
            --        { "│", "FloatBorder" },
            -- },
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(_, _)
            -- local rt = require("rust-tools")
          end,
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
      --local extension_path = vim.fn.expand "~/" .. ".vscode/extensions/vadimcn.vscode-lldb-1.7.3/"

      --local codelldb_path = extension_path .. "adapter/codelldb"
      --local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

      --opts.dap = {
      --        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      --}
      rust_tools.setup(opts)
    end,
    ft = { "rust", "rs" },
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   config = function()
  --     require("nvim-treesitter.configs").setup {
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           keymaps = {
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             ["ic"] = "@class.inner",
  --           },
  --           selection_modes = {
  --             ["@function.outer"] = "V",
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      require("telescope").setup {
        extensions = {
          undo = {
            side_by_side = true,
            layout_strategy = "vertical",
            layout_config = {
              preview_height = 0.8,
            },
          },
        },
      }
      require("telescope").load_extension "undo"
      -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = false,
    config = function()
      vim.diagnostic.config { virtual_text = false }
      require("lsp_lines").setup()
      vim.diagnostic.config { virtual_text = false }
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },
}

return plugins
