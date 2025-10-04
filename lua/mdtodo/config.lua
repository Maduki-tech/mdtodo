--- @class mdtodo.Keymaps
--- @field insert_todo? string Key mapping to insert a new todo item

--- @class mdtodo.Config
--- @field insert_new_line? boolean Whether to insert a new line after toggling a todo item
--- @field keymaps? mdtodo.Keymaps Key mappings for the plugin

--- @type mdtodo.Config
local default_config = {
  insert_new_line = true,
  keymaps = {
    insert_todo = '<C-t>',
  },
}

local M = {}

--- @type mdtodo.Config
M.options = {}

M.setup = function(opts)
  M.options = vim.tbl_deep_extend('force', {}, default_config, opts or {})
end

return M
