---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "gruvchad",
  theme_toggle = { "gruvchad", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  
  telescope = {
    style = "borderless",
  },
  
  -- statusline = {
    -- theme = "default"
  -- },
  lsp = {
  signature = {
    disabled = false,
    silent = true,
  }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
