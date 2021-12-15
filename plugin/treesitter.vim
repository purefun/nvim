lua <<EOF

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    -- from maintained
    "javascript", "dockerfile", "dot", "lua", "go", "gomod", "graphql", "bash",
    "java", "html", "json", "css", "scss", "typescript", "tsx", "toml", "vue",
    "jsonc", "yaml", "query", "jsdoc", "comment", "vim", "json5",
    -- custom
    "http",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {"cmake"}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enabled = false
  }
}
EOF
