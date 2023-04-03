---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["gt"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "goto next buffer",
    },
    ["gT"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "goto prev buffer",
    },
    ["<leader>la"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      "LSP Code Action",
    },
    ["<leader>wl"] = { "<CMD> vsplit <CR>", "Vertical Split" },
    ["<leader>wh"] = { "<CMD> split <CR>", "Horizontal Split" },
    ["<C-Tab>"] = { "<CMD>tabnext <CR>", "Next Tab" },
    ["<C-S-Tab>"] = { "<CMD>tabprev <CR>", "Next Tab" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fu"] = { "<cmd> Telescope undo <CR>", "undo tree" },
    ["<leader>ll"] = { "<cmd> lua require('lsp_lines').toggle<CR>", "toggle lsp lines" },
  },
}

-- more keybinds!

return M
