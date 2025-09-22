---@param plugins table
local function disable_plugins(plugins)
  local M = {}
  for _, name in ipairs(plugins) do
    table.insert(M, { name, enabled = false })
  end
  return M
end

return disable_plugins({
  "mason-org/mason.nvim",
  "mason-org/mason-lspconfig.nvim",
})
