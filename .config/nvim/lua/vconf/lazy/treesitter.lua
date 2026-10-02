return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",

	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"rust",
				"cpp",
				"python",
				"lua",
				"vim",
				"vimdoc",
				"c",
				"query",
				"java",
				"html",
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = {
				enable = true,
				disable = { "python", "c" },
			},
		})
	end,
}
