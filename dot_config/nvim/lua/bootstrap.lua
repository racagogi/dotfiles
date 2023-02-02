local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<s-v>', '<c-v>', opts)
vim.keymap.set('n', '<c-s>', ':wq<CR>', opts)
vim.keymap.set('n', '<c-q>', ':qa<CR>', opts)
vim.keymap.set('n', 'gj', 'j', opts)
vim.keymap.set('n', 'gk', 'k', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)
vim.keymap.set('n', '<F5>', ':w<CR>', opts)

require("lazy").setup("plugins")
