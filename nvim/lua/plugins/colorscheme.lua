-- ============================================================
--  Tokyonight — Most Bright & Colorful Setup
-- ============================================================
return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			style = "moon",
			light_style = "day",
			transparent = false,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true, bold = true },
				functions = { bold = true },
				variables = {},
				sidebars = "dark",
				floats = "dark",
			},
			on_highlights = function(hl, c)
				-- Keywords — bright purple
				hl["@keyword"] = { fg = c.purple, bold = true, italic = true }
				hl["@keyword.function"] = { fg = c.magenta, bold = true }
				hl["@keyword.return"] = { fg = c.red, bold = true }
				-- Functions — bright blue
				hl["@function"] = { fg = c.blue, bold = true }
				hl["@function.call"] = { fg = c.cyan, bold = true }
				hl["@method"] = { fg = c.blue1, bold = true }
				-- Strings — bright green
				hl["@string"] = { fg = c.green }
				hl["@string.escape"] = { fg = c.yellow, bold = true }
				-- Numbers — bright orange
				hl["@number"] = { fg = c.orange, bold = true }
				hl["@float"] = { fg = c.orange }
				-- Types — bright yellow
				hl["@type"] = { fg = c.yellow, bold = true }
				hl["@type.builtin"] = { fg = c.yellow1, bold = true }
				-- Variables
				hl["@variable"] = { fg = c.fg }
				hl["@variable.builtin"] = { fg = c.red, bold = true }
				-- Constants — bright orange
				hl["@constant"] = { fg = c.orange, bold = true }
				hl["@constant.builtin"] = { fg = c.orange, bold = true }
				-- Comments — visible but subtle
				hl["@comment"] = { fg = c.comment, italic = true }
				-- Operators — bright teal
				hl["@operator"] = { fg = c.cyan, bold = true }
				-- Punctuation
				hl["@punctuation.bracket"] = { fg = c.blue5 }
				hl["@punctuation.delimiter"] = { fg = c.blue5 }
				-- Parameters — bright red
				hl["@parameter"] = { fg = c.red1 }
				-- Include/imports
				hl["@include"] = { fg = c.magenta, bold = true }
				-- C/C++ specific
				hl["@type.qualifier"] = { fg = c.purple, bold = true }
				hl["@storageclass"] = { fg = c.purple, bold = true }
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd.colorscheme("tokyonight-moon")
			vim.defer_fn(function()
				local ok, lualine = pcall(require, "lualine")
				if ok then
					lualine.setup({
						options = {
							theme = "tokyonight",
							globalstatus = true,
							component_separators = { left = "", right = "" },
							section_separators = { left = "", right = "" },
							disabled_filetypes = { statusline = { "dashboard", "alpha" } },
						},
						sections = {
							lualine_a = { { "mode", icon = "" } },
							lualine_b = {
								"branch",
								{ "diff", symbols = { added = " ", modified = " ", removed = " " } },
							},
							lualine_c = {
								{ "filename", path = 1, symbols = { modified = "●", readonly = "", unnamed = "" } },
								{
									"diagnostics",
									sources = { "nvim_lsp" },
									symbols = { error = " ", warn = " ", hint = "󰠠 ", info = " " },
								},
							},
							lualine_x = {
								{
									function()
										return require("noice").api.status.command.get()
									end,
									cond = function()
										return package.loaded["noice"] and require("noice").api.status.command.has()
									end,
								},
								"encoding",
								"fileformat",
								{ "filetype", icon_only = false },
							},
							lualine_y = { "progress" },
							lualine_z = { { "location", icon = "" } },
						},
					})
				end
			end, 500)
		end,
	},
	-- Keep catppuccin installed for fallback
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 999,
		lazy = true,
	},
}
