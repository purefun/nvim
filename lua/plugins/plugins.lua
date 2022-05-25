return {
  "wbthomason/packer.nvim",

-- popular deps ------------------------------------------------

  'nvim-lua/plenary.nvim',
  "kyazdani42/nvim-web-devicons",

-- completion --------------------------------------------------

  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-vsnip",
  "hrsh7th/vim-vsnip",
  "hrsh7th/vim-vsnip-integ",
  "hrsh7th/nvim-cmp",
  'hrsh7th/cmp-nvim-lsp-signature-help',
  -- { 'neoclide/coc.nvim', branch = 'release' },

-- File Explorer -----------------------------------------------

  { 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' },
  -- "kyazdani42/nvim-tree.lua",
  -- 'obaland/vfiler.vim',

-- LSP ---------------------------------------------------------

  "neovim/nvim-lspconfig",
  'williamboman/nvim-lsp-installer',
  "simrat39/symbols-outline.nvim",
  'jose-elias-alvarez/null-ls.nvim',
  'folke/trouble.nvim',
  -- "nvim-lua/lsp-status.nvim",
  -- "ray-x/lsp_signature.nvim",

-- editing -----------------------------------------------------

  "ggandor/lightspeed.nvim",
  'phaazon/hop.nvim',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'jiangmiao/auto-pairs',
  'dhruvasagar/vim-table-mode',
  'mattn/emmet-vim',
  -- Find the enemy and replace them with dark power.
  'windwp/nvim-spectre',

-- UI ----------------------------------------------------------

  'feline-nvim/feline.nvim',
  'voldikss/vim-floaterm',
  'akinsho/toggleterm.nvim',
  'norcalli/nvim-colorizer.lua',
  'folke/which-key.nvim',
  -- 'glepnir/galaxyline.nvim',
  --  nvim-lualine/lualine.nvim',

-- Git ---------------------------------------------------------

  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  'junegunn/gv.vim',
  'tpope/vim-rhubarb',
  'sindrets/diffview.nvim',

-- Languages ---------------------------------------------------

  'buoto/gotests-vim',
  'thinca/vim-quickrun',
  'NTBBloodbath/rest.nvim',
  "b0o/schemastore.nvim",
  'ray-x/go.nvim',
  'fatih/vim-go',
  { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install' },

-- Debug -------------------------------------------------------

  'mfussenegger/nvim-dap',
  'theHamsta/nvim-dap-virtual-text',
  'rcarriga/nvim-dap-ui',
  'leoluz/nvim-dap-go',

-- others ------------------------------------------------------

  'mickael-menu/zk-nvim',
  'MunifTanjim/prettier.nvim',
  "folke/zen-mode.nvim",
  'rktjmp/lush.nvim',
  'tyru/open-browser.vim',
  'ianva/vim-youdao-translater',
  'ekickx/clipboard-image.nvim',
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'nvim-telescope/telescope.nvim', requires = {
    {'nvim-lua/plenary.nvim'},
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    {'nvim-telescope/telescope-node-modules.nvim'},
    {'nvim-telescope/telescope-ghq.nvim'},
    {'nvim-telescope/telescope-github.nvim'},
    {'fannheyward/telescope-coc.nvim'},
    {'edolphin-ydf/goimpl.nvim'} }
  },
}
