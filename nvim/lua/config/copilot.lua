-- Load and configure Copilot and Copilot-cmp

require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = '<C-a>',
      accept_word = false,
      accept_line = false,
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
  },
  panel = {
    enabled = false, -- Disable floating panel if you don't use it
  },
})

-- Configure copilot-cmp
require('copilot_cmp').setup()

