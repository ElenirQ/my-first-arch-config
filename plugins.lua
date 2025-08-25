return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },
  {"nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate"
  },
  {
    "andymass/vim-matchup",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, 
  },
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    dependencies = {
      {"nvim-telescope/telescope.nvim"},
    },
  },
  {
    "hat0uma/csvview.nvim",
    ---@module "csvview"
    ---@type CsvView.Options
    cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
  },
  {
    "mcauley-penney/visual-whitespace.nvim",
    config = true,
    event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode
  },
  {
    "code-biscuits/nvim-biscuits",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    build = ":TSUpdate",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
  },
  {
    "rktjmp/paperplanes.nvim"
  },
  {
    "rcarriga/nvim-notify"
  },
  {
    "cpea2506/relative-toggle.nvim"
  },
  {
    "0xJohnnyboy/scretch.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },
  
  
  --- Lsp and Autocompletion
  
  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",   -- buffer words
      "hrsh7th/cmp-path",     -- file paths
      "L3MON4D3/LuaSnip",     -- snippets
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- Installing LSP
  {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    },
  }
1








}
