-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.encoding = "utf-8"
vim.scriptencoding = "utf-8"
vim.opt.guifont = { "CaskaydiaCove NFM", ":h11" }
vim.opt.listchars = {
  space = "·",
  --  tab = "‣",
  --  trail = "·",
  --  precedes = "«",
  --  extends = "»",
  --  eol = "¬",
}

local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

vim.filetype.add {
  extension = {
    qml = "qmljs",
  },
}

vim.g.python3_host_prog = "C:/Users/BV/.pyenv/pyenv-win/shims/python.bat"
vim.diagnostic.config { virtual_text = false }
