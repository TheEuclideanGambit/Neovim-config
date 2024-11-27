-- telescope.lua

require('telescope').setup({
    defaults = {
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
        },
    },
    extensions = {
        frecency = {
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = {"*.git/*", "*/tmp/*"},
        },
    },
})

-- Load the frecency extension
pcall(function()
    require('telescope').load_extension('frecency')
end)

