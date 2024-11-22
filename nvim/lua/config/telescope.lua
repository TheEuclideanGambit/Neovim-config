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
            show_scores = true,       -- Show scores for recent files
            show_unindexed = true,    -- Include files not indexed in the database
            ignore_patterns = {"*.git/*", "*/tmp/*"}, -- Ignore patterns
        },
    },
})

-- Load the frecency extension
pcall(function()
    require('telescope').load_extension('frecency')
end)

