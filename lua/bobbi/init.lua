require("bobbi.lazy_init")

require("bobbi.remap")
require("bobbi.set")

vim.opt.encoding = 'utf-8'
vim.lsp.handlers["textDocument/references"] = function() end
vim.lsp.set_log_level("debug")
