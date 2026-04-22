-- share clipboard with OS
vim.opt.clipboard:append('unnamedplus,unnamed')

vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.scrolloff = 3

vim.opt.whichwrap = 'b,s,h,l,<,>,[,],~'


vim.api.nvim_create_user_command(
  'InitLua',
  function()
    vim.cmd.edit(vim.fn.stdpath('config')..'/init.lua')
  end,
  {desc = 'Open init.lua'}
)

