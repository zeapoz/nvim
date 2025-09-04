return {
  -- LSP Config.
  {
    "neovim/nvim-lspconfig",
    opts = {
      codelens = {
        enabled = true,
      },
      diagnostics = {
        virtual_text = false,
      },
    },
  },

  -- LSP Keymaps.
  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()

      -- Incremental rename.
      keys[#keys + 1] = {
        "<leader>r",
        function()
          local inc_rename = require("inc_rename")
          return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
        end,
        expr = true,
        desc = "Rename (inc-rename.nvim)",
        has = "rename",
      }

      -- Code action.
      keys[#keys + 1] = {
        "g.",
        vim.lsp.buf.code_action,
        desc = "Code Action",
      }
    end,
  },
}
