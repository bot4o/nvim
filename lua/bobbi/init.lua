require("bobbi.remap")
require("bobbi.set")

    
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename', 'filesize'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'nvim-tree'}
}

return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			config = {
				header = {
					"                                                                                                    ",
					"                                                                                                    ",
					"                                                                                                    ",
					"                         .^!^                                           .!~:                        ",
					"                    ^!JPB&B7.                                            !&&BPJ!:                   ",
					"                ^?P#@@@@@G.                   :       :                   ~@@@@@&B5!:               ",
					"             ^JB@@@@@@@@@7                   .#~     ?G                   .&@@@@@@@@&G?:            ",
					"          .7G@@@@@@@@@@@@#!                  7@&^   ~@@^                 .5@@@@@@@@@@@@@G7.         ",
					"        .?#@@@@@@@@@@@@@@@@BY!^.             B@@&BBB&@@Y              :~Y#@@@@@@@@@@@@@@@@#?.       ",
					"       !#@@@@@@@@@@@@@@@@@@@@@@#G5Y?!~^:..  ~@@@@@@@@@@#.   ..::^!7J5B&@@@@@@@@@@@@@@@@@@@@@#!      ",
					"     .5@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&&##B#@@@@@@@@@@@BBBB##&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Y     ",
					"    :B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5    ",
					"   .B@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@J   ",
					"   5@&#BGGPPPPPGGB&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&BGGP555PPGBB#&#:  ",
					"   ^:.            .^!YB@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@&57^.            .:^.  ",
					"                       ~G@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@5:                      ",
					"                         P@@@#BGGGGB#@@@@@@@@@@@@@@@@@@@@@@@@@#BP5555PG#@@@P                        ",
					"                         :J!:.      .^!JG&@@@@@@@@@@@@@@@@#57^.        .:!5~                        ",
					"                                         :?G@@@@@@@@@@@@P!.                                         ",
					"                                            ~5@@@@@@@@5^                                            ",
					"                                              ^P@@@@G^                                              ",
					"                                                !#@?                                                ",
					"                                                 :^                                                 ",
					"                                                                                                    ",
					"                                                                                                    ",
					"                                                                                                    ",
					-- "",
					-- "⣿⠟⣽⣿⣿⣿⣿⣿⢣⠟⠋⡜⠄⢸⣿⣿⡟⣬⢁⠠⠁⣤⠄⢰⠄⠇⢻⢸",
					-- "⢏⣾⣿⣿⣿⠿⣟⢁⡴⡀⡜⣠⣶⢸⣿⣿⢃⡇⠂⢁⣶⣦⣅⠈⠇⠄⢸⢸",
					-- "⣹⣿⣿⣿⡗⣾⡟⡜⣵⠃⣴⣿⣿⢸⣿⣿⢸⠘⢰⣿⣿⣿⣿⡀⢱⠄⠨⢸",
					-- "⣿⣿⣿⣿⡇⣿⢁⣾⣿⣾⣿⣿⣿⣿⣸⣿⡎⠐⠒⠚⠛⠛⠿⢧⠄⠄⢠⣼",
					-- "⣿⣿⣿⣿⠃⠿⢸⡿⠭⠭⢽⣿⣿⣿⢂⣿⠃⣤⠄⠄⠄⠄⠄⠄⠄⠄⣿⡾",
					-- "⣼⠏⣿⡏⠄⠄⢠⣤⣶⣶⣾⣿⣿⣟⣾⣾⣼⣿⠒⠄⠄⠄⡠⣴⡄⢠⣿⣵",
					-- "⣳⠄⣿⠄⠄⢣⠸⣹⣿⡟⣻⣿⣿⣿⣿⣿⣿⡿⡻⡖⠦⢤⣔⣯⡅⣼⡿⣹",
					-- "⡿⣼⢸⠄⠄⣷⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣕⡜⡌⡝⡸⠙⣼⠟⢱⠏",
					-- "⡇⣿⣧⡰⡄⣿⣿⣿⣿⡿⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣋⣪⣥⢠⠏⠄",
					-- "⣧⢻⣿⣷⣧⢻⣿⣿⣿⡇⠄⢀⣀⣀⡙⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠂⠄⠄",
					-- "⢹⣼⣿⣿⣿⣧⡻⣿⣿⣇⣴⣿⣿⣿⣷⢸⣿⣿⣿⣿⣿⣿⣿⣿⣰⠄⠄⠄",
					-- "⣼⡟⡟⣿⢸⣿⣿⣝⢿⣿⣾⣿⣿⣿⢟⣾⣿⣿⣿⣿⣿⣿⣿⣿⠟⠄⡀⡀",
					-- "⣿⢰⣿⢹⢸⣿⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠉⠄⠄⣸⢰⡇",
					-- "⣿⣾⣹⣏⢸⣿⣿⣿⣿⣿⣷⣍⡻⣛⣛⣛⡉⠁⠄⠄⠄⠄⠄⠄⢀⢇⡏⠄",
					-- "",
				},
				footer = {},
				packages = { enable = false },
				project = {
					enable = false,
				},
				mru = {
					limit = 5,
				},
				shortcut = {
					{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						desc = "Files",
						group = "@property",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Grep",
						group = "@property",
						action = "Telescope grep_string",
						key = "g",
					},
				},
			},
		})
	end,
}
