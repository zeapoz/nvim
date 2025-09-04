return {
  {
    dir = vim.fn.stdpath("config") .. "/lua/journal.nvim",
    opts = {},
    -- stylua: ignore
    keys = function()
      local journal = require("journal")
      return {
      { "<leader>j", function() journal.open_today() end, desc = "Open Daily Journal" },
      { "<leader>fj", function() journal.find_entry() end, desc = "Find Journal Entry" },
      { "<leader>fJ", function() journal.explore() end, desc = "Explorer Journal" },
      { "<leader>sJ", function() journal.search_entries() end, desc = "Search Journal Entries" },
    }
    end,
  },

  {
    "kawre/leetcode.nvim",
    cmd = "Leet",
    opts = {
      lang = "rust",
    },
  },
}
