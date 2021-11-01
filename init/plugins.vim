finish " migrated to Packer.nvim

call plug#begin('~/.vim/plugged')

"----------------------------------------------------------------
" UI
"----------------------------------------------------------------

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " treesitter configuration
Plug 'nvim-treesitter/playground'                           " View treesitter information directly
Plug 'norcalli/nvim-colorizer.lua'                          " A high-performance color highlighter
" Plug 'voldikss/vim-floaterm'                                " terminal in the floating/popup window.
" Plug 'glepnir/galaxyline.nvim'                              " statusline plugin written in lua
" Plug 'rktjmp/lush.nvim', { 'branch': 'main' }               " define neovim themes as a DSL in lua
Plug 'folke/zen-mode.nvim'                                  " Distraction-free coding
Plug 'folke/twilight.nvim'                                  " dims inactive portions of the code
Plug 'lukas-reineke/indent-blankline.nvim'                  " indent guides

" Plug 'famiu/feline.nvim'                                  " A minimal, stylish and customizable statusline

"----------------------------------------------------------------
" Finder & Explorer
"----------------------------------------------------------------

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " an alternative to netrw
Plug 'nvim-lua/popup.nvim'                                " required by telescope.vim
" Plug 'nvim-lua/plenary.nvim'                              " required by telescope.vim
" Plug 'nvim-telescope/telescope.nvim'                      " a highly extendable fuzzy finder over lists
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'camgraff/telescope-tmux.nvim'

"----------------------------------------------------------------
" Lang
"----------------------------------------------------------------

" Plug 'fatih/vim-go'      " Go development plugin
" Plug 'buoto/gotests-vim' " generate test code
Plug 'thinca/vim-quickrun'
Plug 'b4b4r07/vim-sqlfmt'
" Plug 'ivy/vim-ginkgo' " Go syntax highlighting and snippets for Ginkgo specs and matchers.
" Plug 'styled-components/vim-styled-components'
"----------------------------------------------------------------
" LSP
"----------------------------------------------------------------

" Plug 'neoclide/coc.nvim', { 'branch': 'release' } " language servers
" Plug 'liuchengxu/vista.vim'                       " Viewer & Finder for LSP symbols and tags

"----------------------------------------------------------------
" Editing
"----------------------------------------------------------------

" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-repeat'
" Plug 'junegunn/vim-easy-align'
" Plug 'jiangmiao/auto-pairs'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'mattn/emmet-vim'

"----------------------------------------------------------------
" Git & GitHub
"----------------------------------------------------------------

" Plug 'tpope/vim-fugitive'     " an awesome Git wrapper
" Plug 'airblade/vim-gitgutter' " git sign column
" Plug 'junegunn/gv.vim'        " a git commit browser
" Plug 'tpope/vim-rhubarb'      " :GBrowse handler
" Plug 'pwntester/octo.nvim'    " Edit and review GitHub issues and pull requests
" Plug 'mattn/vim-gist'         " github gist editor

"----------------------------------------------------------------
" Filetype
"----------------------------------------------------------------

" Plug 'sheerun/vim-polyglot'

"----------------------------------------------------------------
" Mixes
"----------------------------------------------------------------

" Plug 'tyru/open-browser.vim'       " open URI with your favorite browser
" Plug 'ianva/vim-youdao-translater' " view cword translation in cmd line
" Plug 'mattn/webapi-vim'            " reuiqred by vim-gist
" Plug 'NTBBloodbath/rest.nvim'      " http client
" Plug 'diepm/vim-rest-console'      " http playground
Plug 'chrisbra/unicode.vim'        " search unicode
Plug 'junegunn/goyo.vim'           " Distraction-free writing

call plug#end()
