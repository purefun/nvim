return {
  "wbthomason/packer.nvim",
  "kyazdani42/nvim-tree.lua",
  "ggandor/lightspeed.nvim",
  "folke/zen-mode.nvim",
  "neovim/nvim-lspconfig",
  "kyazdani42/nvim-web-devicons",
  'voldikss/vim-floaterm',
  'glepnir/galaxyline.nvim',
  'rktjmp/lush.nvim',
  'liuchengxu/vista.vim',
  'tpope/vim-commentary',
  -- 'numToStr/Comment.nvim',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'junegunn/vim-easy-align',
  'jiangmiao/auto-pairs',
  'dhruvasagar/vim-table-mode',
  'mattn/emmet-vim',
  'tpope/vim-fugitive',
  -- 'airblade/vim-gitgutter',
  { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim' },
  'junegunn/gv.vim',
  'tpope/vim-rhubarb',
  'pwntester/octo.nvim',
  -- 'sheerun/vim-polyglot',
  'tyru/open-browser.vim',
  'ianva/vim-youdao-translater',
  'fatih/vim-go',
  'buoto/gotests-vim',
  'thinca/vim-quickrun',
  'norcalli/nvim-colorizer.lua',
  'rcarriga/nvim-notify',
  'phaazon/hop.nvim',
  'ekickx/clipboard-image.nvim',
  { 'windwp/nvim-spectre', requires = 'nvim-lua/plenary.nvim' },
  { 'mfussenegger/nvim-dap', requires = { 'theHamsta/nvim-dap-virtual-text', 'rcarriga/nvim-dap-ui' } },
  { 'NTBBloodbath/rest.nvim', requires = 'nvim-lua/plenary.nvim' },
  { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' },
  { 'mattn/vim-gist', requires = 'mattn/webapi-vim', },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' },
  { 'obaland/vfiler.vim' },
  { 'neoclide/coc.nvim', branch = 'release' },
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-node-modules.nvim'},
      {'nvim-telescope/telescope-ghq.nvim'},
      {'nvim-telescope/telescope-github.nvim'},
      {'fannheyward/telescope-coc.nvim'},
      {'edolphin-ydf/goimpl.nvim'},
    }
  },
}
