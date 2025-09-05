--- Maps a key to a command or function.
--- @param mode string
--- @param key string
--- @param command string|function
--- @param opts? table
local function map(mode, key, command, opts)
  vim.keymap.set(mode, key, command, opts)
end

--- Returns a mapping that appends the given character to the current line.
--- @param char string
local function map_append_char(char)
  return map("n", "ga" .. char, function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("norm A" .. char)
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end)
end

map_append_char(",")
map_append_char(".")
map_append_char(";")

-- Center view after scrolling.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center view after search.
map("n", "n", "nzz")
map("n", "N", "Nzz")
