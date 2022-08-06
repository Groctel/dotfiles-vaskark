return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'itchyny/lightline.vim'
    use 'tpope/vim-fugitive'
    use 'nelstrom/vim-markdown-folding'
    use 'machakann/vim-highlightedyank'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} } }
    use 'nvim-treesitter/nvim-treesitter'
    use 'dylanaraps/wal.vim'
    use 'scrooloose/nerdtree'
    use 'scrooloose/nerdcommenter'
    use 'kovetskiy/sxhkd-vim'
end)
