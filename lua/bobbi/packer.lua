vim.cmd.packadd('packer.nvim')

--Packer.Nvim
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    --Telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
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
    --GruvBox
    --use { "ellisonleao/gruvbox.nvim" }
    --EverForest
    --[[
    use({
        "neanias/everforest-nvim",
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup()
        end,
    })
    --]]
    --AtomOne
    --[[
    use 'navarasu/onedark.nvim'
    --]]
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use("theprimeagen/harpoon")
    use("theprimeagen/refactoring.nvim")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons'},
        requires = { 'nvim-tree/nvim-web-devicons'}
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
    use('Hoffs/omnisharp-extended-lsp.nvim')
    --use('jiangmiao/auto-pairs')
    use('BurntSushi/ripgrep')
    use {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = {
                        "                                                                       ",
                        "                                                                       ",
                        "                                                                       ",
                        "                                                                       ",
                        "                                                                     ",
                        "       ████ ██████           █████      ██                     ",
                        "      ███████████             █████                             ",
                        "      █████████ ███████████████████ ███   ███████████   ",
                        "     █████████  ███    █████████████ █████ ██████████████   ",
                        "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
                        "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
                        " ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
                        "                                                                       ",
                        "                                                                       ",
                        "                                                                       ",
                    },
                    shortcut = {
                        { 
                            desc = '󰊳 Update', 
                            group = 'Identifier', 
                            action = 'Telescope find_files cwd=~/.config/nvim', 
                            key = 'u' 
                        },
                        {
                            desc = '󰈔 New File',
                            group = 'Label',
                            action = 'enew',  
                            key = 'n',
                        },
                        {
                            icon = ' ',
                            desc = 'Files',
                            group = 'String',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = '󱎸 Find Text',
                            group = 'String',
                            action = 'Telescope live_grep',  
                            key = 'g',
                        },
                        {
                            desc = '󱎘 Quit',
                            group = 'Error',
                            action = 'qa',  
                            key = 'q',
                        },
                    },
                },
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
end)
