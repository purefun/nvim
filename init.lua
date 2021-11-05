_G.import = function (path)
  if _G.__is_dev then
    return R(path)
  else
    local check, detail = pcall(require,path)
    if check then
      return detail
    else
      print("Import module error: " .. path)
      error(debug.traceback(detail))
    end
  end
end

_G.R = function(name)
    require('plenary.reload').reload_module(name)
    return require(name)
end

import('options')
import("settings")
import('mappings')
import('autocmd')
import('plugins')
