local actions = require'telescope.actions'
local actions_set = require'telescope.actions.set'
local actions_state = require'telescope.actions.state'
local conf = require'telescope.config'.values
local entry_display = require'telescope.pickers.entry_display'
local finders = require'telescope.finders'
local from_entry = require'telescope.from_entry'
local pickers = require'telescope.pickers'
local utils = require'telescope.utils'
local Path = require'plenary.path'

local os_home = vim.loop.os_homedir()

local M = {}

local function gen_from_ghq(opts)
  local displayer = entry_display.create{
    items = {{}},
  }

  local function make_display(entry)
    local dir = (function(path)
      if path == Path.path.root() then return path end

      local p = Path:new(path)
      if opts.tail_path then
        local parts = p:_split()
        return parts[#parts]
      end

      if opts.shorten_path then return p:shorten() end

      if vim.startswith(path, opts.cwd) and path ~= opts.cwd then
        return Path:new(p):make_relative(opts.cwd)
      end

      if vim.startswith(path, os_home) then
        return (Path:new'~' / p:make_relative(os_home)).filename
      end
      return path
    end)(entry.path)

    return displayer{dir}
  end

  return function(line)
    return {
      value = line,
      ordinal = line,
      path = line,
      display = make_display,
    }
  end
end

M.list = function(opts)
  opts = opts or {}
  opts.bin = opts.bin and vim.fn.expand(opts.bin) or 'ghq'
  -- opts.cwd = utils.get_lazy_default(opts.cwd, vim.loop.cwd)
  opts.cwd = '/Users/Nil/dev/sources'
  opts.entry_maker = utils.get_lazy_default(opts.entry_maker, gen_from_ghq, opts)

  local bin = vim.fn.expand(opts.bin)
  pickers.new(opts, {
    prompt_title = 'Repositories managed by ghq',
    finder = finders.new_oneshot_job(
      {bin, 'list', '--full-path'},
      opts
    ),
    previewer = false,
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions_set.select:replace(function(_, type)
        local entry = actions_state.get_selected_entry()
        actions._close(prompt_bufnr, 'keepinsert')
        local dir = from_entry.path(entry)
        if type == 'default' then
          require'telescope.builtin'.git_files{cwd = dir}
        elseif type == 'horizontal' then
          vim.cmd('cd '..dir)
          print('chdir to '..dir)
        elseif type == 'vertical' then
          vim.cmd('lcd '..dir)
          print('lchdir to '..dir)
        elseif type == 'tab' then
          vim.cmd('tcd '..dir)
          print('tchdir to '..dir)
        end
      end)
      return true
    end,
  }):find()
end

return M
