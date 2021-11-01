local Loader = {}

local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.vim"
local package_root = vim.fn.stdpath("data") .. "/site/pack"

function Loader:load()
    local plugins = require("myplugins")
    Add_packer_if_needed()
    local packer = require('packer')
    Packer_init(packer)
    Load_plugins(packer, plugins)
end

function Add_packer_if_needed()
    if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
        vim.fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", package_root }
        vim.cmd "packadd packer.nvim"
    end
end

function Packer_init(packer)
    packer.init {
        package_root = package_root,
        git = { clone_timeout = 300 },
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end
        }
    }
end

function Load_plugins(packer, plugins)
    packer.startup(function(use)
        for _, plugin in ipairs(plugins) do
            use(plugin)
        end
    end)
end

return Loader
