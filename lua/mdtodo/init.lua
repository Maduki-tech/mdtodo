local config = require('mdtodo.config')

local function aucommand()
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'markdown' },
    callback = function()
      vim.keymap.set('i', '<CR>', function()
        local line = vim.api.nvim_get_current_line()
        local is_todo = line:match('^%S*%- %[[ xX]%]')

        if is_todo then
          local indent = line:match('^(%s*)%- %[[ xX]%]') or ''
          return '\n' .. indent .. '- [ ] '
        else
          return '\n'
        end
      end, { buffer = true, expr = true, desc = 'Continue TODO on New Line' })
    end,
  })
end

local M = {}

---@param opts mdtodo.Config
function M.setup(opts)
  config.setup(opts)
  local cfg = config.options

  if opts.insert_new_line then
    aucommand()
  end

  vim.keymap.set({ 'n', 'i' }, cfg.keymaps.insert_todo, M.insert_todo, { desc = 'Insert TODO' })
end

function M.insert_todo()
  local line = vim.api.nvim_get_current_line()

  if line:match('%- %[x%]') then
    line = line:gsub('%- %[x%]', '- [ ]')
  elseif line:match('%- %[ ]') then
    line = line:gsub('%- %[ ]', '- [x]')
  else
    line = '- [ ] ' .. line
  end
  vim.api.nvim_set_current_line(line)
  -- Move the cursor to the end of the line
  local col = #line
  vim.api.nvim_win_set_cursor(0, { vim.api.nvim_win_get_cursor(0)[1], col })
end

return M
