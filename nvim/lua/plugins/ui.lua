-- ============================================================
--  UI Plugins
-- ============================================================
return {
	-- ── Lualine (configured in colorscheme.lua after catppuccin loads) ──
	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
		opts = {},
	},
	-- ── Bufferline ────────────────────────────────────────────
	{
		"akinsho/bufferline.nvim",
		event = "VimEnter",
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("bufferline").setup({
				options = {
					mode = "buffers",
					style_preset = require("bufferline").style_preset.default,
					numbers = "none",
					close_command = "bdelete! %d",
					diagnostics = "nvim_lsp",
					diagnostics_indicator = function(_, _, diagnostics_dict)
						local s = " "
						for e, n in pairs(diagnostics_dict) do
							local sym = e == "error" and " " or (e == "warning" and " " or "")
							s = s .. n .. sym
						end
						return s
					end,
					offsets = {
						{ filetype = "neo-tree", text = "  Explorer", text_align = "center", separator = true },
					},
					separator_style = "slant",
					always_show_bufferline = true,
				},
			})
		end,
	},
	-- ── Telescope ─────────────────────────────────────────────
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					prompt_prefix = "  ",
					selection_caret = " ",
					path_display = { "smart" },
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = { prompt_position = "top", preview_width = 0.55 },
						vertical = { mirror = false },
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_ignore_patterns = { "node_modules", ".git/", "__pycache__", "*.class", "build/", "target/" },
				color_devicons = true,
				preview = { treesitter = true },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-c>"] = actions.close,
							["<Down>"] = actions.move_selection_next,
							["<Up>"] = actions.move_selection_previous,
							["<CR>"] = actions.select_default,
							["<C-x>"] = actions.select_horizontal,
							["<C-v>"] = actions.select_vertical,
							["<C-t>"] = actions.select_tab,
							["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
						},
					},
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					["ui-select"] = {
						require("telescope.themes").get_dropdown({ winblend = 10, width = 0.5 }),
					},
				},
			}
		end,
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("fzf")
			telescope.load_extension("ui-select")
			-- Neon telescope highlights
			vim.api.nvim_set_hl(0, "TelescopeBorder",         { fg = "#00FFFF" })
			vim.api.nvim_set_hl(0, "TelescopePromptBorder",   { fg = "#FF007C" })
			vim.api.nvim_set_hl(0, "TelescopeResultsBorder",  { fg = "#00FFFF" })
			vim.api.nvim_set_hl(0, "TelescopePreviewBorder",  { fg = "#FF007C" })
			vim.api.nvim_set_hl(0, "TelescopePromptTitle",    { fg = "#000000", bg = "#FF007C", bold = true })
			vim.api.nvim_set_hl(0, "TelescopeResultsTitle",   { fg = "#000000", bg = "#00FFFF", bold = true })
			vim.api.nvim_set_hl(0, "TelescopePreviewTitle",   { fg = "#000000", bg = "#FF007C", bold = true })
			vim.api.nvim_set_hl(0, "TelescopeSelection",      { fg = "#39FF14", bg = "#0D0D0D", bold = true })
			vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { fg = "#FF007C", bold = true })
			vim.api.nvim_set_hl(0, "TelescopeMatching",       { fg = "#FFFF00", bold = true })
			vim.api.nvim_set_hl(0, "TelescopePromptNormal",   { fg = "#00FFFF" })
			vim.api.nvim_set_hl(0, "TelescopePromptPrefix",   { fg = "#FF007C", bold = true })
		end,
	},
	-- ── Neo-tree ──────────────────────────────────────────────
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			close_if_last_window = true,
			popup_border_style = "rounded",
			default_component_configs = {
				indent = { padding = 1 },
				icon = { folder_closed = "", folder_open = "", folder_empty = "󰜌" },
				git_status = {
					symbols = {
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "󰁕",
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				width = 35,
				mappings = { ["<space>"] = "toggle_node", ["<cr>"] = "open" },
			},
			filesystem = {
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = false,
				filtered_items = {
					visible = false,
					hide_dotfiles = false,
					hide_gitignored = true,
				},
			},
		},
	},
	-- ── Noice ─────────────────────────────────────────────────
	{
		"folke/noice.nvim",
		event = "VimEnter",
		dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = false,
				lsp_doc_border = true,
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
		},
	},
	-- ── Notify ────────────────────────────────────────────────
	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			vim.notify = require("notify")
		end,
	},
	-- ── Devicons ──────────────────────────────────────────────
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	-- ── Dashboard (Alpha) ─────────────────────────────────────
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
				"                                                     ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("f", "󰈞  Find file", "<cmd>Telescope find_files<CR>"),
				dashboard.button("r", "󰄉  Recent files", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("g", "󰊄  Live grep", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("e", "  File tree", "<cmd>Neotree toggle<CR>"),
				dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
				dashboard.button("m", "  Mason", "<cmd>Mason<CR>"),
				dashboard.button("q", "󰗼  Quit", "<cmd>qa<CR>"),
			}
			alpha.setup(dashboard.opts)
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = "⚡ Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},

	-- ── Smear Cursor (animated neon trail) ────────────────────
	{
		"sphamba/smear-cursor.nvim",
		event = "VimEnter",
		opts = {
			smear_between_buffers = true,
			smear_between_neighbor_lines = true,
			scroll_buffer_space = true,
			legacy_computing_symbols_support = false,
			stiffness = 0.8,
			trailing_stiffness = 0.5,
			distance_stop_animating = 0.5,
			hide_target_hack = true,
			cursor_color = "#00FFFF",
			normal_bg = "#000000",
		},
	},
}