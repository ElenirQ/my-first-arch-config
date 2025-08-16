-- LOCAL VAR

local cmp = require("cmp")
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()


--COLORSCHEME


-- Set colorscheme
vim.cmd.colorscheme "catppuccin-mocha"


-- PLUGIN CONFIGS


-- Autocompletion setup
cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
  }, {
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls", "tsserver" },
  automatic_installation = true,
})

-- LSP setup handlers
require("mason-lspconfig").setup_handlers({
  -- Default for all servers
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,

  -- Special config for lua_ls
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    })
  end,
})

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
  file_picker = "telescope",
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

