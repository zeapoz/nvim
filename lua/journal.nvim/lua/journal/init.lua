local M = {}

--- @class JournalOpts
--- @field journal_dir string
--- @field filename_fmt string
--- @field template function|nil
M.opts = {
  journal_dir = "~/journal",
  filename_fmt = "%Y/%m/%d.md",
  template = nil,
}

--- @param opts table
function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

-- Open up a new buffer for today's journal entry.
function M.open_today()
  -- Ensure the journal directory exists.
  local filepath = vim.fn.expand(M.opts.journal_dir .. "/" .. vim.fn.strftime(M.opts.filename_fmt))
  vim.fn.mkdir(vim.fn.fnamemodify(filepath, ":h"), "p")

  -- If the file does not exist, create it with the specified template (or default).
  if vim.fn.filereadable(filepath) == 0 then
    local lines
    if type(M.opts.template) == "function" then
      lines = M.opts.template(filepath) or {}
    else
      lines = { vim.fn.strftime("# %Y-%m-%d") }
    end

    vim.fn.writefile(lines, filepath)
  end

  -- Open the file in a new buffer.
  vim.cmd("edit " .. filepath)
end

-- Find a journal entry.
function M.find_entry()
  Snacks.picker.files({ dirs = { M.opts.journal_dir } })
end

-- Open journal directory.
function M.explore()
  Snacks.picker.explorer({
    cwd = M.opts.journal_dir,
    layout = "default_solid",
    auto_close = true,
  })
end

-- Find in journal entry.
function M.search_entries()
  Snacks.picker.grep({ dirs = { M.opts.journal_dir } })
end

return M
