vim.api.nvim_command('set runtimepath^=~/.vim runtimepath+=~/.vim/after')
vim.api.nvim_command('let &packpath = &runtimepath')
vim.api.nvim_command('source ~/.vimrc')
