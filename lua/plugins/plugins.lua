return {
  "wbthomason/packer.nvim",
  "junegunn/goyo.vim",
  "neovim/nvim-lspconfig",
  "kyazdani42/nvim-web-devicons",
  'voldikss/vim-floaterm',
  'glepnir/galaxyline.nvim',
  'rktjmp/lush.nvim',
  'liuchengxu/vista.vim',
  'tpope/vim-commentary',
  'tpope/vim-surround',
  'tpope/vim-repeat',
  'junegunn/vim-easy-align',
  'jiangmiao/auto-pairs',
  'dhruvasagar/vim-table-mode',
  'mattn/emmet-vim',
  'tpope/vim-fugitive',
  'airblade/vim-gitgutter',
  'junegunn/gv.vim',
  'tpope/vim-rhubarb',
  'pwntester/octo.nvim',
  'sheerun/vim-polyglot',
  'tyru/open-browser.vim',
  'ianva/vim-youdao-translater',
  'fatih/vim-go',
  'buoto/gotests-vim',
  'thinca/vim-quickrun',
  'norcalli/nvim-colorizer.lua',
  { 'ThePrimeagen/harpoon', requires = 'nvim-lua/plenary.nvim' },
  { 'mattn/vim-gist', requires = 'mattn/webapi-vim', },
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  { 'Shougo/defx.nvim', run = ':UpdateRemotePlugins' },
  { 'neoclide/coc.nvim', branch = 'release' },
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-node-modules.nvim'},
      {'danielpieper/telescope-tmuxinator.nvim'},
      {'fannheyward/telescope-coc.nvim'},
    }
  },
}
