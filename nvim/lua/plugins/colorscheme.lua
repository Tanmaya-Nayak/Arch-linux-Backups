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
				-- Keywords — neon pink
				vim.api.nvim_set_hl(0, "@keyword",           { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@keyword.function",  { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "@keyword.return",    { fg = "#FF1744", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@keyword.operator",  { fg = "#FF007C", bold = true })
				-- Functions — neon lime (def) vs bright green (call)
				vim.api.nvim_set_hl(0, "@function",          { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@function.call",     { fg = "#39FF14", bold = true })
				vim.api.nvim_set_hl(0, "@function.builtin",  { fg = "#76FF03", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@method",            { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@method.call",       { fg = "#39FF14", bold = true })
				-- Strings — neon yellow
				vim.api.nvim_set_hl(0, "@string",            { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "@string.escape",     { fg = "#FF6D00", bold = true })
				vim.api.nvim_set_hl(0, "@string.special",    { fg = "#FFD600", bold = true })
				-- Numbers — neon orange
				vim.api.nvim_set_hl(0, "@number",            { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@float",             { fg = "#FFAB40", bold = true })
				-- Types — cyan family, each distinct
				vim.api.nvim_set_hl(0, "@type",              { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@type.builtin",      { fg = "#18FFFF", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@type.definition",   { fg = "#00E5FF", bold = true })
				vim.api.nvim_set_hl(0, "@type.qualifier",    { fg = "#FF007C", bold = true })
				-- Structs / classes — distinct from type
				vim.api.nvim_set_hl(0, "@structure",         { fg = "#00E5FF", bold = true })
				-- Variables — neon purple (no longer white)
				vim.api.nvim_set_hl(0, "@variable",          { fg = "#E040FB", bold = false })
				vim.api.nvim_set_hl(0, "@variable.builtin",  { fg = "#EA80FC", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@variable.member",   { fg = "#69FF47", bold = true })
				-- Parameters — deep orange (distinct from variable)
				vim.api.nvim_set_hl(0, "@parameter",         { fg = "#FF6B35", bold = true })
				vim.api.nvim_set_hl(0, "@parameter.reference", { fg = "#FF6B35", italic = true })
				-- Constants — red-orange (distinct from number orange)
				vim.api.nvim_set_hl(0, "@constant",          { fg = "#FF4500", bold = true })
				vim.api.nvim_set_hl(0, "@constant.builtin",  { fg = "#FF6E40", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@constant.macro",    { fg = "#FF1744", bold = true })
				-- Boolean — neon rose
				vim.api.nvim_set_hl(0, "@boolean",           { fg = "#FF4081", bold = true })
				-- Operators — hot pink (distinct from cyan)
				vim.api.nvim_set_hl(0, "@operator",          { fg = "#FF69B4", bold = true })
				-- Punctuation — cool grey
				vim.api.nvim_set_hl(0, "@punctuation.bracket",   { fg = "#B0BEC5", bold = true })
				vim.api.nvim_set_hl(0, "@punctuation.delimiter",  { fg = "#78909C" })
				vim.api.nvim_set_hl(0, "@punctuation.special",    { fg = "#FF69B4", bold = true })
				-- Namespace — ice cyan
				vim.api.nvim_set_hl(0, "@namespace",         { fg = "#18FFFF", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@module",            { fg = "#18FFFF", bold = true, italic = true })
				-- Fields / properties — lime green
				vim.api.nvim_set_hl(0, "@field",             { fg = "#69FF47", bold = true })
				vim.api.nvim_set_hl(0, "@property",          { fg = "#69FF47", bold = true })
				-- Include/imports — neon pink
				vim.api.nvim_set_hl(0, "@include",           { fg = "#FF007C", bold = true })
				-- Comments — muted blue-grey
				vim.api.nvim_set_hl(0, "@comment",           { fg = "#546E7A", italic = true })
				vim.api.nvim_set_hl(0, "@comment.todo",      { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "@comment.note",      { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@comment.warning",   { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@storageclass",      { fg = "#FF007C", bold = true })
				-- C/C++ classic syntax groups
				vim.api.nvim_set_hl(0, "Include",      { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Statement",    { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Keyword",      { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Conditional",  { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Repeat",       { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "Function",     { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "String",       { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "Number",       { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "Float",        { fg = "#FFAB40", bold = true })
				vim.api.nvim_set_hl(0, "Type",         { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "StorageClass", { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "Structure",    { fg = "#00E5FF", bold = true })
				vim.api.nvim_set_hl(0, "Constant",     { fg = "#FF4500", bold = true })
				vim.api.nvim_set_hl(0, "PreProc",      { fg = "#FF1744", bold = true })
				vim.api.nvim_set_hl(0, "Define",       { fg = "#FF1744", bold = true })
				vim.api.nvim_set_hl(0, "Macro",        { fg = "#FF1744", bold = true })
				vim.api.nvim_set_hl(0, "Operator",     { fg = "#FF69B4", bold = true })
				vim.api.nvim_set_hl(0, "Comment",      { fg = "#546E7A", italic = true })
				vim.api.nvim_set_hl(0, "Special",      { fg = "#FF6B35", bold = true })
				vim.api.nvim_set_hl(0, "SpecialChar",  { fg = "#FF6D00", bold = true })
				vim.api.nvim_set_hl(0, "Identifier",   { fg = "#E040FB" })
				vim.api.nvim_set_hl(0, "Field",        { fg = "#69FF47", bold = true })
				-- Cursor colors per mode (matches lualine neon theme)
				vim.api.nvim_set_hl(0, "Cursor",        { fg = "#000000", bg = "#FF007C" })
				vim.api.nvim_set_hl(0, "CursorInsert",  { fg = "#000000", bg = "#00FF00" })
				vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#000000", bg = "#FF8C00" })
				vim.api.nvim_set_hl(0, "CursorLine",    { bg = "#0a0a0a" })
				-- Black background
				vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "LineNr", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "#000000" })
				vim.api.nvim_set_hl(0, "IblIndent", { fg = "#000000" })
				vim.api.nvim_set_hl(0, "IblScope",  { fg = "#000000" })
				-- LSP semantic token overrides
				vim.api.nvim_set_hl(0, "@lsp.type.function",             { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.method",               { fg = "#39FF14", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.typemod.function.declaration", { fg = "#00FF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.keyword",              { fg = "#FF007C", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.variable",             { fg = "#E040FB" })
				vim.api.nvim_set_hl(0, "@lsp.type.parameter",            { fg = "#FF6B35", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.type",                 { fg = "#00FFFF", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.class",                { fg = "#00E5FF", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.struct",               { fg = "#00E5FF", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.enum",                 { fg = "#FFAB40", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.enumMember",           { fg = "#FF4500", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.interface",            { fg = "#18FFFF", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@lsp.type.namespace",            { fg = "#18FFFF", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@lsp.type.property",             { fg = "#69FF47", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.field",                { fg = "#69FF47", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.string",               { fg = "#FFFF00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.number",               { fg = "#FF8C00", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.boolean",              { fg = "#FF4081", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.comment",              { fg = "#546E7A", italic = true })
				vim.api.nvim_set_hl(0, "@lsp.type.operator",             { fg = "#FF69B4", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.macro",                { fg = "#FF1744", bold = true })
				vim.api.nvim_set_hl(0, "@lsp.type.decorator",            { fg = "#FF007C", bold = true, italic = true })
				vim.api.nvim_set_hl(0, "@lsp",                           { bold = true })
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
							theme = {
								normal = {
									a = { fg = "#000000", bg = "#FF007C", gui = "bold" }, -- pink
									b = { fg = "#FFFFFF", bg = "#1a1a1a" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
								insert = {
									a = { fg = "#000000", bg = "#00FF00", gui = "bold" }, -- neon lime
									b = { fg = "#FFFFFF", bg = "#1a1a1a" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
								visual = {
									a = { fg = "#000000", bg = "#FFFF00", gui = "bold" }, -- neon yellow
									b = { fg = "#FFFFFF", bg = "#1a1a1a" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
								replace = {
									a = { fg = "#000000", bg = "#FF8C00", gui = "bold" }, -- neon orange
									b = { fg = "#FFFFFF", bg = "#1a1a1a" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
								command = {
									a = { fg = "#000000", bg = "#00FFFF", gui = "bold" }, -- neon cyan
									b = { fg = "#FFFFFF", bg = "#1a1a1a" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
								inactive = {
									a = { fg = "#AAAAAA", bg = "#000000" },
									b = { fg = "#AAAAAA", bg = "#000000" },
									c = { fg = "#AAAAAA", bg = "#000000" },
								},
							},
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
