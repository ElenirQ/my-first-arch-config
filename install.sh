#!/bin/bash




DEPENDENCE="
git curl
"


sudo pacman -S $DEPENDENCE


#variabes

DESKTOP="

"

PYTHON="

"

TERMINAL="
q
"

TERMINALAPPS="

"

APPS="

"

OTHER="

"

FISH="
fish fisher
"

FISHPLUGINS="catppuccin/fish jethrokuan/z PatrickF1/fzf.fish jorgebucaran/replay.fish jorgebucaran/nvm.fish jorgebucaran/spark.fish joseluisq/gitnow jorgebucaran/autopair.fish nickeb96/puffer-fish"

ISHTHEME="Catppuccin Mocha"
#fish

sudo pacman $FISH

fisher install $FISHPLUGINS

fish_config theme save $FISHTHEME
#config files

NVIMINIT='
require("config.options")
require("config.keymap")
require("config.lazy")
'

NVIMLAZY='
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


-- PLUGIN SETUP
require("lazy").setup({

  root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
  
  defaults = {
    
    -- Set this to `true` to have all your plugins lazy-loaded by default.
    -- Only do this if you know what you are doing, as it can lead to unexpected behavior.
    lazy = false, -- should plugins be lazy-loaded?
    
    -- Its recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = nil, -- always use the latest git commit
    
    -- version = "*", -- try installing the latest stable version for plugins that support semver
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
 },
   
  -- import your plugins
  spec = require("cofig.plugins"), 
  
  local_spec = true, -- load project specific .lazy.lua spec files. They will be added at the end of the spec.
  
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  
  ---@type number? limit the maximum amount of concurrent tasks
  concurrency = jit.os:find("Windows") and (vim.uv.available_parallelism() * 2) or nil,
  

  git = {
    
    -- defaults for the `Lazy log` command
    -- log = { "--since=3 days ago" }, -- show commits from the last 3 days
    log = { "-8" }, -- show the last 8 commits
    
    timeout = 120, -- kill processes that take more than 2 minutes
    
    url_format = "https://github.com/%s.git",
    
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
    
    -- rate of network related git operations (clone, fetch, checkout)
    throttle = {
      
      enabled = false, -- not enabled by default
      
      -- max 2 ops every 5 seconds
      rate = 2,
      
      duration = 5 * 1000, -- in ms
    },
    
    -- Time in seconds to wait before running fetch again for a plugin.
    -- Repeated update/check operations will not run again until this
    -- cooldown period has passed.
    cooldown = 0,
  },
  
  
  pkg = {
    
    enabled = true,
    
    cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
    
    -- the first package source that is found for a plugin will be used.
    sources = {
      
      "lazy",
      
      "rockspec", -- will only be used when rocks.enabled is true
      
      "packspec",
    },
  },
  
  rocks = {
    
    enabled = true,
    
    root = vim.fn.stdpath("data") .. "/lazy-rocks",
    
    server = "https://nvim-neorocks.github.io/rocks-binaries/",
    
    -- use hererocks to install luarocks?
    -- set to `nil` to use hererocks when luarocks is not found
    -- set to `true` to always use hererocks
    -- set to `false` to always use luarocks
    hererocks = nil,
  },
  
  dev = { enabled = false }, -- dev mode off
  
  --if dev need 
  --dev = {
  --  
  --  -- Directory where you store your local plugin projects. If a function is used,
  --  -- the plugin directory (e.g. `~/projects/plugin-name`) must be returned.
  --  ---@type string | fun(plugin: LazyPlugin): string
  --  path = "~/projects",
  --  
  --  ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
  --  patterns = {}, -- For example {"folke"}
  --  
  --  fallback = false, -- Fallback to git when local plugin doesnt exist
  --},
  
  
  install = {
    
    -- install missing plugins on startup. This doesnt increase startup time.
    missing = true,
    
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  
  
  ui = {
    
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    
    wrap = true, -- wrap the lines in the ui
    
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",
    
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 60,
    
    title = nil, ---@type string only works when border is not "none"
    
    title_pos = "center", ---@type "center" | "left" | "right"
    
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    
    icons = {
      
      cmd = " ",
      config = "",
      debug = "● ",
      event = " ",
      favorite = " ",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      require = "󰢱 ",
      source = " ",
      start = " ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    
    throttle = 1000 / 30, -- how frequently should the ui process render events
    
    custom_keys = {
      
      -- You can define custom key maps here. If present, the description will
      -- be shown in the help menu.
      -- To disable one of the defaults, set it to false.

      ["<localleader>l"] = {
        function(plugin)
          require("lazy.util").float_term({ "lazygit", "log" }, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open lazygit log",
s      },

      ["<localleader>i"] = {
        function(plugin)
          Util.notify(vim.inspect(plugin), {
            title = "Inspect " .. plugin.name,
            lang = "lua",
          })
        end,
        desc = "Inspect Plugin",
      },

      ["<localleader>t"] = {
        function(plugin)
          require("lazy.util").float_term(nil, {
            cwd = plugin.dir,
          })
        end,
        desc = "Open terminal in plugin dir",
      },
    },
  },
  
  -- Output options for headless mode
  headless = {
    
    -- show the output from process commands like git
    process = true,
    
    -- show log messages
    log = true,
    
    -- show task start/end
    task = true,
    
    -- use ansi colors
    colors = true,
  },
  diff = {
    
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "git",
  },
  
  checker = {
    
    -- automatically check for plugin updates
    enabled = false,
    
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    
    notify = true, -- get a notification when new updates are found
    
    frequency = 3600, -- check for updates every hour
    
    check_pinned = false, -- check for pinned packages that cant be updated
  },
  
  change_detection = {
    
    -- automatically check for config file changes and reload the ui
    enabled = true,
    
    notify = true, -- get a notification when changes are found
  },
  
  performance = {
    
    cache = {
      enabled = true,
    },
    
    reset_packpath = true, -- reset the package path to improve startup time
    
    rtp = {
      
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        
        -- "gzip",
        -- "tarPlugin",
        -- "zipPlugin",
        "matchit",
        "matchparen",
        "netrwPlugin",
        -- "tohtml",
        "tutor",
      },
    },
  },
  
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that dont have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    
    enabled = true,
    
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    
    files = { "README.md", "lua/**/README.md" },
    
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  
  state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
  
  -- Enable profiling of lazy.nvim. This will add some overhead,
  -- so only enable this when you are debugging lazy.nvim
  profiling = {
    
    -- Enables extra stats on the debug tab related to the loader cache.
    -- Additionally gathers stats about all package.loaders
    loader = false,
    
    -- Track each new require in the Lazy profiling tab
    require = false,
  },
})

require("config.pluginsoptions")
'

NVIMPLUGINS='
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    "andymass/vim-matchup",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true
  },
  {
    "rachartier/tiny-glimmer.nvim",
    event = "VeryLazy",
    priority = 10, -- Needs to be a really low priority, to catch others plugins keybindings.
  },
  {"nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate"
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
    "jbyuki/instant.nvim"
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









}
'

NVIMPLUGINSOPTIONS='
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
'

NVIMOPTIONS='

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.termguicolors = true

'

NVIMKEYMAP='

'


#update system

sudo pacman -Suy


#install yay

#sudo pacman -S --needed git base-devel
#git clone https://aur.archlinux.org/yay.git
#cd ~/yay
#makepkg -si


#NVIM

sudo pacman -S nvim
mkdir ~/.config/nvim
echo -e "$NVIMINIT" > ~/.config/nvim/init.lua
mkdir ~/.config/nvim/config
echo -e "$NVIMOPTIONS" > ~/.config/nvim/config/options.lua
echo -e "$NVIMKEYMAP" > ~/.config/nvim/config/ketmap.lua

#nvim plaugins manager

echo -e "$NVIMLAZY" > ~/.config/nvim/config/lazy.lua
echo -e "$NVIMPLUGINS" > ~/.config/nvim/config/plugins.lua
echo -e "$NVIMPLUGINSOPTIONS" > ~/.config/nvim/config/pluginsoptions.lua



#install outher pkg

sudo pacman -S $DESKTOP $PYTHON $TERMINAL $TERMINALAPPS $APPS $OTHER


