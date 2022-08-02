vim.api.nvim_create_autocmd('BufWritePost', {
	group = vim.api.nvim_create_augroup('PACKER', {clear = true }),
	pattern = 'plugins.lua',
	command = 'source <afile> | PackerCompile',
})

return require('packer').startup(function()
     use 'wbthomason/packer.nvim'
	-- use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
     use 'itchyny/lightline.vim'
     use 'tpope/vim-fugitive'
     use 'nelstrom/vim-markdown-folding'
     use 'machakann/vim-highlightedyank'
     use 'junegunn/fzf'
     use 'dylanaraps/wal.vim'
     use 'scrooloose/nerdtree'
     use 'scrooloose/nerdcommenter'
     use 'glepnir/dashboard-nvim'
     use 'kovetskiy/sxhkd-vim'
end)
