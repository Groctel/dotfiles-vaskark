return require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }, 
        config = function() require('plugins.lualine') end
    }
    -- use { 'itchyny/lightline.vim',
        -- config = function() require('plugins.lightline') end
    -- }
    use 'tpope/vim-fugitive'
    use { 'machakann/vim-highlightedyank',
        config = function() require('plugins.highlightedyank') end
    }
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.telescope') end
    }
    use 'nvim-treesitter/nvim-treesitter'
    use 'dylanaraps/wal.vim'
    use { 'scrooloose/nerdcommenter',
        config = function() require('plugins.nerdcommenter') end
    }
    use 'kovetskiy/sxhkd-vim'
    use { 'akinsho/bufferline.nvim', tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.bufferline') end
    }
    use { 'goolord/alpha-nvim', 
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.alpha') end
    }
    use { 'akinsho/toggleterm.nvim', tag = 'v2.*',
        config = function() require('plugins.toggleterm') end
    }
    use { 'kyazdani42/nvim-tree.lua', tag = 'nightly', 
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('plugins.nvim-tree') end
    }
    use { 'samodostal/image.nvim', 
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('plugins.image') end
    }
end)
