# Everything in this file is automatically run at runtime
print("hello from plugin/stackmaps")

local M = {}

M.check = function()
    print('check')
end

return M
