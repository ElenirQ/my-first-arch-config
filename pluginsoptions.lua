
-- PLUGIN CONFIGS

--COLORSCHEME

vim.cmd.colorscheme "catppuccin-mocha"


-- Treesitter config

require("nvim-treesitter.configs").setup({
  highlight = { enable = true },
  matchup = { enable = true },
  }
)


-- Lualine

require("lualine").setup()


-- NvimTree

require("nvim-tree").setup()


-- Scratch

require("scratch").setup({
  use_telescope = true,
  -- fzf-lua is recommanded, since it will order the files by modification datetime desc. (require rg)
  file_picker = "telescope", -- "fzflua" | "telescope" | nil
  filetypes = { "lua", "js", "sh", "ts" }, -- you can simply put filetype here
  }
)


-- CSVView

require("csvview").setup({
  parser = { comments = { "#", "//" } },
  keymaps = {
    -- Text objects for selecting fields
    textobject_field_inner = { "if", mode = { "o", "x" } },
    textobject_field_outer = { "af", mode = { "o", "x" } },
    -- Excel-like navigation:
    -- Use <Tab> and <S-Tab> to move horizontally between fields.
    -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
    -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
    jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
    jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
    jump_next_row = { "<Enter>", mode = { "n", "v" } },
    jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },
)


-- PaperPlanes

-- options shown with default values
require("paperplanes").setup({
  register = "+",
  provider = "0x0.st",  -- paste.rs or https://0x0.st/ 
  provider_options = {},
  notifier = vim.notify or print,
  save_history = true
  }
)


-- Relative Toggle

require("relative-toggle").setup({
    pattern = "*",
    events = {
        on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
        off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
    },
})


-- S2cretch
require("scretch").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below

})

