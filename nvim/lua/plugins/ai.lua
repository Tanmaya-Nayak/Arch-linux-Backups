return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		provider = "gemini",
		input = {
			provider = "dressing",
		},
		providers = {
			gemini = {
				api_key = os.getenv("GEMINI_API_KEY"),
				model = "gemini-2.5-flash",
			},
		},
	},
}
