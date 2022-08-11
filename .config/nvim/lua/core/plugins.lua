-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    -- use 'itchyny/lightline.vim'
    use 'tpope/vim-fugitive'
    use 'nelstrom/vim-markdown-folding'
    use 'machakann/vim-highlightedyank'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = 'nvim-lua/plenary.nvim'}
    use 'nvim-treesitter/nvim-treesitter'
    use 'dylanaraps/wal.vim'
    use 'scrooloose/nerdcommenter'
    use 'kovetskiy/sxhkd-vim'
    use {'akinsho/bufferline.nvim', tag = "latest", requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'akinsho/toggleterm.nvim', tag = 'v2.*'}
    use {'kyazdani42/nvim-tree.lua', tag = 'nightly', requires = {'kyazdani42/nvim-web-devicons' }}

end)
