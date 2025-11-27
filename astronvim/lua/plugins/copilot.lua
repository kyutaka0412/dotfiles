-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "User AstroFile",
--     opts = { suggestion = { auto_trigger = true, debounce = 150 } },
--   },
--   {
--     "CopilotC-Nvim/CopilotChat.nvim",
--     branch = "main",
--     dependencies = {
--       { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
--       { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
--     },
--     opts = {
--       debug = true, -- Enable debugging
--       -- See Configuration section for rest
--     },
--     -- See Commands section for default commands if you want to lazy load on them
--   },
-- }

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	build = ":Copilot auth",
	event = "BufReadPost",
	opts = {
		suggestion = {
			keymap = {
				accept = false, -- handled by completion engine
			},
		},
	},
	specs = {
		{
			"AstroNvim/astrocore",
			opts = {
				options = {
					g = {
						-- set the ai_accept function
						ai_accept = function()
							if require("copilot.suggestion").is_visible() then
								require("copilot.suggestion").accept()
								return true
							end
						end,
					},
				},
			},
		},
	},
}
