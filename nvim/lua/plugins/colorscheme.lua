-- ============================================================
--  Monokai Pro — Dark & High Contrast
-- ============================================================
return {
	{
		"tanvirtin/monokai.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			local monokai = require("monokai")
			monokai.setup({})

			vim.cmd.colorscheme("monokai_pro")
			local function set_highlights()
				-- Keywords — neon pink
				vim.api.nvim_set_hl(0, "@keyword", { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#FF007C", bold = true })
				-- Functions — neon lime
				vim.api.nvim_set_hl(0, "@function", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@function.call", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@method", { fg = "#00FF00", bold = true })
				-- Strings — neon yellow
				vim.api.nvim_set_hl(0, "@string", { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "@string.escape", { fg = "#FF6D00", bold = true })
				-- Numbers — neon orange
				vim.api.nvim_set_hl(0, "@number", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@float", { fg = "#FF8C00", bold = true })
				-- Types — neon cyan
				vim.api.nvim_set_hl(0, "@type", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#00FFFF", bold = true })
				-- Variables — pure white
				vim.api.nvim_set_hl(0, "@variable", { fg = "#FFFFFF" })
				vim.api.nvim_set_hl(0, "@variable.builtin", { fg = "#FF8C00", bold = true })
				-- Constants — neon orange
				vim.api.nvim_set_hl(0, "@constant", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#FF8C00", bold = true })
				-- Comments — brighter grey
				vim.api.nvim_set_hl(0, "@comment", { fg = "#AAAAAA", italic = true })
				-- Operators — neon cyan
				vim.api.nvim_set_hl(0, "@operator", { fg = "#00FFFF", bold = true })
				-- Punctuation — bright white
				vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#FFFFFF", bold = true })
				vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#FFFFFF" })
				-- Parameters — neon orange
				vim.api.nvim_set_hl(0, "@parameter", { fg = "#FF8C00", bold = true })
				-- Include/imports — neon pink
				vim.api.nvim_set_hl(0, "@include", { fg = "#FF007C", bold = true })
				-- C/C++ specific
				vim.api.nvim_set_hl(0, "@type.qualifier", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "@storageclass", { fg = "#FF007C", bold = true })
				-- C/C++ classic syntax groups
				vim.api.nvim_set_hl(0, "Include", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Statement", { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Keyword", { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Conditional", { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Repeat", { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Function", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "String", { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "Number", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "Type", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "StorageClass", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Structure", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "Constant", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "PreProc", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Define", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Macro", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Operator", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "Comment", { fg = "#AAAAAA", italic = true })
				vim.api.nvim_set_hl(0, "Special", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#FF8C00", bold = true })
				-- Black background
				vim.api.nvim_set_hl(0, "Normal", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "LineNr", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#0d0d0d" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#0d0d0d" })
				-- LSP semantic token overrides
				vim.api.nvim_set_hl(0, "@lsp.type.function", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.keyword", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.variable", { fg = "#FFFFFF" })
				vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.string", { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.number", { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.comment", { fg = "#AAAAAA", italic = true })
				vim.api.nvim_set_hl(0, "@lsp.type.operator", { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@lsp", { bold = true })
			end

			set_highlights()

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = set_highlights,
			})

			vim.defer_fn(function()
				local ok, lualine = pcall(require, "lualine")
				if ok then
					lualine.setup({
						options = {
							theme = "monokai_pro",
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
