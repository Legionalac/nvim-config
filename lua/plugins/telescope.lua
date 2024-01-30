local mapvimkey = require("util.keymapper").mapvimkey

local config = function()
	local telescope = require("telescope")
	telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        },
		defaults = {
            file_igore_patterns = {"node_modules/*",".git/*","build/*"},
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
				},
			},
		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = true,
				hidden = true,
			},
			live_grep = {
				theme = "dropdown",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = true,
			},
		},
	})
    require('telescope').load_extension('fzf')
end

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.3",
	lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },
	config = config,
	keys = {
		mapvimkey("<leader>fk", "Telescope keymaps", "Show Keymaps"),
		mapvimkey("<leader>ft", "Telescope help_tags", "Show Help Tags"),
		mapvimkey("<c-p>", "Telescope git_files", "Find Git Files"),
		mapvimkey("<c-f>", "Telescope find_files", "Find Files"),
		mapvimkey("<C-G>", "Telescope live_grep", "Live Grep"),
		mapvimkey("<c-q>", "Telescope buffers", "Find Buffers"),
	},
}
