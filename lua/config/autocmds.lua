vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    --- Link a highlight group to just the bg of another highlight group.
    --- @param target string
    --- @param source string
    local function link_bg(target, source)
      local src = vim.api.nvim_get_hl(0, { name = source })
      local dst = vim.api.nvim_get_hl(0, { name = target })
      dst.bg = src.bg
      ---@diagnostic disable-next-line:param-type-mismatch
      vim.api.nvim_set_hl(0, target, dst)
    end

    -- Extend CursorLine past line number column when changing color schemes.
    link_bg("CursorLineNr", "CursorLine")
    link_bg("CursorLineSign", "CursorLine")
  end,
})
