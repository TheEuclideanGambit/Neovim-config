require'nvim-treesitter.configs'.setup {
    ensure_installed = { "lua", "python", "javascript", "html", "css", "bash" }, 
  highlight = {
    enable = true,                 
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",        
      node_incremental = "<TAB>",     
      scope_incremental = "<S-TAB>", 
    },
  },
  indent = {
    enable = true,                 
  },
}

