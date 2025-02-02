-- Default options:
-- require("gruvbox").setup({
--   terminal_colors = true, -- add neovim terminal colors
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = {
--     strings = true,
--     emphasis = true,
--     comments = true,
--     operators = false,
--     folds = true,
--   },
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "", -- can be "hard", "soft" or empty string
--   palette_overrides = {},
--   overrides = {},
--   dim_inactive = false,
--   transparent_mode = false,
-- })
-- -- Lua
-- require('onedark').setup  {
--     -- Main options --
--     style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
--     transparent = false,  -- Show/hide background
--     term_colors = true, -- Change terminal color as per the selected theme style
--     ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
--     cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu
-- 
-- 
--     -- Change code style ---
--     -- Options are italic, bold, underline, none
--     -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
--     code_style = {
--         comments = 'italic',
--         keywords = 'none',
--         functions = 'none',
--         strings = 'none',
--         variables = 'none'
--     },
-- 
--     -- Lualine options --
--     lualine = {
--         transparent = false, -- lualine center bar transparency
--     },
-- 
--     -- Custom Highlights --
--     colors = {}, -- Override default colors
--     highlights = {}, -- Override highlight groups
-- 
--     -- Plugins Config --
--     diagnostic = {
--         darker = true, -- darker colors for diagnostic
--         undercurl = true,   -- use undercurl instead of underline for diagnostics
--         background = true,    -- use background color for virtual text
--     },
-- }
--require('onedark').load()
-- require('lualine').setup {
--   options = {
--     theme = 'rose-pine'
--     -- ... your lualine config
--   }
-- }



vim.cmd("colorscheme everforest")
function ColorMyPencils(color) 
	color = color or "everforest"
	vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    --vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
end

ColorMyPencils()
