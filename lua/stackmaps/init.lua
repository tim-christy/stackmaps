--[[
What is this plugin?

This will alter the keymaps depending on the file you are working on. On a
certain event, make a bunch of keymaps - my own custom mode. E.g. when I enter
a debugger, I get a bunch of custom keymaps. When I exit, my keymaps reset.
Normally, the keymaps wouldn't reset, you'd just lose them

Functions we need:
- vim.keymap.set(...)  -> create new keymaps
- nvim_get_keymap("n") -> nvim_... functions are in vim.api

lua require('mapstack').push('debug_mode', {...mappings...})
...
lua require('mapstack').pop('debug_mode')

Notes:
vim.api is like the standard library for neovim


--]]

local M = {}

local find_mapping = function(maps, lhs)
	for _, v in ipairs(maps) do
		if v.lhs == lhs then
			return v
		end
		-- P(v)
		-- break
	end
end

-- Push to save the original keymappings
--[[
lua require("mapstack").push("debug_mode", "n", {
  ["<leader><leader>s"] = "echo 'Hello'",
  ["<leader><leader>sz"] = "echo 'Goodbye'",
})
--]]
M.push = function(name, mode, mappings)
	local maps = vim.api.nvim_get_keymap(mode)

	P(find_mapping(maps, "<Esc>"))

	-- P(maps)
end

-- Pop to restore the original keymappings
M.pop = function(name) end

M.push("debug_mode", "n", {
	["<leader><leader>s"] = "echo 'Hello'",
	["<leader><leader>sz"] = "echo 'Goodbye'",
})
return M
