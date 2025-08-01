-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("dashboard").setup {
					theme = "hyper",
					config = {
						header = {
							"███╗   ██╗██╗   ██╗██╗███╗   ███╗",
							"████╗  ██║██║   ██║██║████╗ ████║",
							"██╔██╗ ██║██║   ██║██║██╔████╔██║",
							"██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
							"██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
							"╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝"
						}
					}
				}
			end,
			dependencies = { {"nvim-tree/nvim-web-devicons"}}
		},
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvitree/nvim-web-devicons" },
			config = function()
				require("lualine").setup()
			end
		},
		{
			"xiyaowong/transparent.nvim",
			config = function()
				require("transparent").setup()
			end
		},
		{
			"nvim-neo-tree/neo-tree.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons",
				"MunifTanjim/nui.nvim"
			},
			lazy = false,
		},
		{
			"neoclide/coc.nvim",
			branch = "release"
		},
		{
			"Civitasv/cmake-tools.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim"
			}
		},
		{
			"rust-lang/rust.vim"
		},
		{
			"preservim/tagbar"
		},
		{
			"mbbill/undotree",
			config = function()
				vim.keymap.set("n", "<F5>", vim.cmd.UndotreeToggle)
			end
		},
		{
			"kdheepak/lazygit.nvim"
		}

	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "default" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
