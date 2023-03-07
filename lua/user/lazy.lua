local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup {
  {
    "folke/tokyonight.nvim",
    commit = "e52c41314e83232840d6970e6b072f9fba242eb9",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require "user.colorscheme"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "8299fe7703dfff4b1752aeed271c3b95281a952d",
    event = "BufReadPre",
    config = function()
      require "user.indentline"
    end,
  },
  {
    "folke/which-key.nvim",
    commit = "5224c261825263f46f6771f1b644cae33cd06995",
    event = "VeryLazy",
    config = function()
      require("which-key").setup {}
    end,
  },
  { "nvim-lua/plenary.nvim", commit = "9a0d3bf7b832818c042aaf30f692b081ddd58bd9", lazy = true },
  {
    "windwp/nvim-autopairs",
    commit = "0e065d423f9cf649e1d92443c939a4b5073b6768",
    event = "InsertEnter",
    config = function()
      require "user.autopairs"
    end,
  },
  {
    "numToStr/Comment.nvim",
    commit = "eab2c83a0207369900e92783f56990808082eac2",
    event = "BufRead",
    config = function()
      require "user.comment"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "d3a68725e8349212a359d1914fc6e86ff31e4142",
    event = "BufReadPost",
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        event = "VeryLazy",
        commit = "a0f89563ba36b3bacd62cf967b46beb4c2c29e52",
      },
      {
        "kyazdani42/nvim-web-devicons",
        config = function()
          require("nvim-web-devicons").setup {
            override = {
              zsh = {
                icon = "",
                color = "#428850",
                cterm_color = "65",
                name = "Zsh",
              },
            },
            color_icons = true,
            default = true,
          }
        end,
      },
    },
    config = function()
      require "user.treesitter"
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    commit = "59e65d88db177ad1e6a8cffaafd4738420ad20b6",
    config = function()
      require "user.nvim-tree"
    end,
  },
  {
    "akinsho/bufferline.nvim",
    commit = "c7492a76ce8218e3335f027af44930576b561013",
    config = function()
      require "user.bufferline"
    end,
  },
  {
    "moll/vim-bbye",
    commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
  },
  {
    "nvim-lualine/lualine.nvim",
    commit = "0050b308552e45f7128f399886c86afefc3eb988",
    config = function()
      require "user.lualine"
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    commit = "19aad0f41f47affbba1274f05e3c067e6d718e1e",
    event = "VeryLazy",
    config = function()
      require "user.toggleterm"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    commit = "203bf5609137600d73e8ed82703d6b0e320a5f36",
    event = "Bufenter",
    cmd = { "Telescope" },
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4",
        config = function()
          require "user.project"
        end,
      },
    },
    config = function()
      require "user.telescope"
    end,
  },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      require "user.alpha"
    end,
  },
  {
    "lunarvim/darkplus.nvim",
    commit = "1826879d9cb14e5d93cd142d19f02b23840408a6",
  },
  {
    "hrsh7th/nvim-cmp",
    commit = "cfafe0a1ca8933f7b7968a287d39904156f2c57d",
    event = {
      "InsertEnter",
      "CmdlineEnter",
    },
    dependencies = {
      {
        "hrsh7th/cmp-nvim-lsp",
        commit = "0e6b2ed705ddcff9738ec4ea838141654f12eeef",
      },
      {
        "hrsh7th/cmp-buffer",
        commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
      },
      {
        "hrsh7th/cmp-path",
        commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
      },
      {
        "hrsh7th/cmp-cmdline",
        commit = "23c51b2a3c00f6abc4e922dbd7c3b9aca6992063",
      },
      {
        "saadparwaiz1/cmp_luasnip",
        commit = "18095520391186d634a0045dacaa346291096566",
      },
      {
        "hrsh7th/cmp-nvim-lua",
        commit = "f3491638d123cfd2c8048aefaf66d246ff250ca6",
      },
    },
    config = function()
      require "user.cmp"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    commit = "9bff06b570df29434a88f9c6a9cea3b21ca17208",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
      commit = "a6f7a1609addb4e57daa6bedc300f77f8d225ab7",
    },
  },
  {
    "neovim/nvim-lspconfig",
    commit = "649137cbc53a044bffde36294ce3160cb18f32c7",
    lazy = true,
  },
  {
    "williamboman/mason.nvim",
    commit = "4546dec8b56bc56bc1d81e717e4a935bc7cd6477",
    cmd = "Mason",
    event = "BufReadPre",
    config = function()
      require "user.lsp.mason"
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        commit = "93e58e100f37ef4fb0f897deeed20599dae9d128",
        lazy = true,
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    commit = "60b4a7167c79c7d04d1ff48b55f2235bf58158a7",
    config = function()
      require "user.lsp.null-ls"
    end,
  },
  {
    "RRethy/vim-illuminate",
    commit = "d6ca7f77eeaf61b3e6ce9f0e5a978d606df44298",
    event = "VeryLazy",
    config = function()
      require "user.illuminate"
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    commit = "ec4742a7eebf68bec663041d359b95637242b5c3",
    event = "BufReadPre",
    config = function()
      require "user.gitsigns"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    commit = "6b12294a57001d994022df8acbe2ef7327d30587",
    event = "VeryLazy",
    config = function()
      require "user.dap"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    commit = "1cd4764221c91686dcf4d6b62d7a7b2d112e0b13",
    event = "VeryLazy",
    config = function()
      require "user.dapui"
    end,
  },
  {
    "ravenxrz/DAPInstall.nvim",
    commit = "8798b4c36d33723e7bba6ed6e2c202f84bb300de",
    lazy = true,
    config = function()
      require("dap_install").setup {}
      require("dap_install").config("python", {})
    end,
  },
}
