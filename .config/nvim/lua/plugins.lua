return require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    -- use 'itchyny/lightline.vim'
    use 'tpope/vim-fugitive'
    use 'nelstrom/vim-markdown-folding'
    use 'machakann/vim-highlightedyank'
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { 'nvim-lua/plenary.nvim' }}
    use 'nvim-treesitter/nvim-treesitter'
    use 'dylanaraps/wal.vim'
    use 'scrooloose/nerdcommenter'
    use 'kovetskiy/sxhkd-vim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'goolord/alpha-nvim', requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'akinsho/toggleterm.nvim', tag = 'v2.*'}
    use {'kyazdani42/nvim-tree.lua', tag = 'nightly', requires = { 'kyazdani42/nvim-web-devicons' }}

end)
