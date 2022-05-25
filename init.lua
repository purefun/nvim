vim.g['polyglot_disabled'] = {}

require 'options'
require 'mappings'
require 'autocmd'
require 'reload'
require 'settings'
require 'plugins'

require("zk").setup {
  picker = "telescope"
}
