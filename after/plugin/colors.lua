function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "NormalNC", {bg = "NONE" })
    vim.api.nvim_command('hi EndOfBuffer guibg=NONE ctermbg=NONE')
end

ColorMyPencils()
