# MdTodo.nvim

> Minimal plugin for Managing Todo Comments in a Markdown file

## Installation

```lua
return {
  "maduki-tech/mdtodo",
  config = function()
    require("mdtodo").setup({
      insert_new_line = true,
      keymaps = {
        insert_todo = '<C-t>',
      },
    })
  end,
}
```
