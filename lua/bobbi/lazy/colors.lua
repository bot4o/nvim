function ColorMyPencils(color)
    color = color or "tokusa"
    vim.cmd.colorscheme(color)

    local highlights = {
        Normal       = { bg = "NONE" },
        NormalFloat  = { bg = "NONE" },
        LineNr       = { fg = "#007755", bg = "NONE" },
        CursorLineNr = { fg = "#38ffb0", bg = "NONE", bold = true },
        SignColumn   = { bg = "NONE" },
        Visual       = { fg = "#38ffb0", bg = "#1B5A3F" },
        StatusLine   = { fg = "#38ffb0", bg = "#081A12" },
        StatusLineNC = { fg = "#38ffb0", bg = "#081A12" },
        ColorColumn  = { bg = "#081A12" },
        CursorLine   = { bg = "#103726" },
    }

    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end
end
vim.opt.cursorline = true
vim.opt.number = true
return {

    {
        "erikbackman/brightburn.vim",
    },

    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            ColorMyPencils()
        end
    },
    {
        "oskarnurm/koda.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            -- require("koda").setup({ transparent = true })
            vim.cmd("colorscheme koda")
        end,
    },
    {
        "aidyak/tokusa",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function(_, opts)
            require("tokusa").setup(opts)
            vim.cmd.colorscheme("tokusa")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
            require("gruvbox").setup({
                terminal_colors = true, -- add neovim terminal colors
                undercurl = true,
                underline = false,
                bold = true,
                italic = {
                    strings = false,
                    emphasis = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                strikethrough = true,
                invert_selection = false,
                invert_signs = false,
                invert_tabline = false,
                invert_intend_guides = false,
                inverse = true, -- invert background for search, diffs, statuslines and errors
                contrast = "", -- can be "hard", "soft" or empty string
                palette_overrides = {},
                overrides = {},
                dim_inactive = false,
                transparent_mode = false,
            })
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
                transparent = true, -- Enable this to disable setting the background color
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    -- Style to be applied to different syntax groups
                    -- Value is any valid attr-list value for `:help nvim_set_hl`
                    comments = { italic = false },
                    keywords = { italic = false },
                    -- Background styles. Can be "dark", "transparent" or "normal"
                    sidebars = "dark", -- style for sidebars, see below
                    floats = "dark", -- style for floating windows
                },
            })
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },


}
