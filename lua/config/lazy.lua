-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = 'yes'
vim.o.wrap = true
vim.o.termguicolors = true
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8

-- Set tab to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- move lines up and down - taken from https://github.com/radleylewis/nvim-lite/blob/youtube_demo/init.lua
-- changed to include visual line mode as well
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set({"v", "x"}, "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set({"v", "x"}, "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

-- persistent selections when indenting - also from same yt vid as above ^^
vim.keymap.set({"v", "x"}, "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set({"v", "x"}, ">", ">gv", { desc = "Indent right and reselect" })

vim.keymap.set('n', '<leader>o', ':update<CR> :so<CR>')
vim.keymap.set('n', '<leader>h', ':help ')

-- system clipboard
vim.keymap.set({'n', 'v', 'x'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v', 'x'}, '<leader>d', '"+d')
vim.keymap.set({'n', 'v', 'x'}, '<leader>p', '"+p')

-- highlight after yanking, from kickstart.nvim
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.keymap.set('n', '<leader>k', ':lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.o.winborder = 'double'

vim.opt.guicursor = table.concat({
	'n-v-c:block',
	'i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250',
	'r-cr:hor20',
	'o:hor50',
	'sm:block-blinkwait175-blinkoff150-blinkon175'
}, ',')

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  ui = { show = false },           -- disable the UI entirely
  checker = { enabled = true, notify = false },  -- auto-update silently
  change_detection = { notify = false },
  install = { colorscheme = {} },  -- no colorscheme prompt on install
})
