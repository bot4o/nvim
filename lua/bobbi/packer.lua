vim.cmd.packadd('packer.nvim')
--Packer.Nvim
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    --Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    --RosePine ColorScheme
    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })
    --[[

    --OneDark ColorScheme
    require('onedark').setup {
        style = 'darker'
    }
    require('onedark').load()
    --]] 

    use({
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    })
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use {
        'nvim-lualine/lualine.nvim',
<<<<<<< HEAD
        requires = { 'kyazdani42/nvim-web-devicons'}
=======
        requires = { 'nvim-tree/nvim-web-devicons'}
>>>>>>> 03d7a6b337d28da70982073be24b61ac007698d5
    }
    use('jlcrochet/vim-razor')
    --lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }
end)
