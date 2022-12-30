return {
	"nvim-lua/plenary.nvim",

	-- Colorschemes
	{
		"rose-pine/neovim",
		priority = 1000,
		lazy = false,
	},

	-- Treesitter(syntax highlighting)
	{ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
	"nvim-treesitter/nvim-treesitter-context",

	-- Navigation
	{ "ThePrimeagen/harpoon", lazy = true },
	{
		"kyazdani42/nvim-tree.lua",
		lazy = true,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
	"nvim-telescope/telescope.nvim",
	-- { 'ggandor/leap.nvim', lazy = true, },

	-- GIT
	{ "tpope/vim-fugitive" },
	{ "mbbill/undotree" },
	{ "lewis6991/gitsigns.nvim" },
	{ "pwntester/octo.nvim", event = "VeryLazy" },

	-- Bufferline
	"ojroques/nvim-hardline",

	-- Dashboard
	"glepnir/dashboard-nvim",

	-- Code
	{ "tpope/vim-commentary" },
	{ "tpope/vim-surround" }, -- FIXME: check for configure. s is braking
	{ "editorconfig/editorconfig-vim", lazy = true },
	{ "Vimjas/vim-python-pep8-indent", lazy = true },
	{ "puremourning/vimspector", event = "VeryLazy" },
	{ "vim-test/vim-test", lazy = true },
	{ "jgdavey/tslime.vim", lazy = true },
	"lukas-reineke/indent-blankline.nvim",

	-- cmp
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lua" },

	-- snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"saadparwaiz1/cmp_luasnip", -- for autocompletion

	-- lsp
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting and linting
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
}
