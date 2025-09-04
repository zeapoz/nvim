return {
  {
    "folke/flash.nvim",
    opts = {
      label = { rainbow = { enabled = true } },
    },
  },

  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        diagnostics = {
          win = {
            position = "right",
            size = 0.3,
          },
          filter = function(items)
            local severity = vim.diagnostic.severity.HINT
            for _, item in ipairs(items) do
              severity = math.min(severity, item.severity)
            end
            return vim.tbl_filter(function(item)
              return item.severity == severity
            end, items)
          end,
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      win = {
        border = "solid",
      },
    },
  },

  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = "LazyFile",
    opts = function()
      vim.g.autosave = true

      -- Disable formatting before autosave.
      local group = vim.api.nvim_create_augroup("autosave_formatting", {})
      vim.api.nvim_create_autocmd("User", {
        pattern = "AutoSaveWritePre",
        group = group,
        callback = function()
          vim.b.autoformat = false
        end,
      })

      -- Re-enable formatting after autosave.
      vim.api.nvim_create_autocmd("User", {
        pattern = "AutoSaveWritePost",
        group = group,
        callback = function()
          vim.b.autoformat = true
        end,
      })

      Snacks.toggle({
        name = "Auto Save",
        get = function()
          return vim.g.autosave
        end,
        set = function()
          vim.cmd("ASToggle")
          vim.g.autosave = not vim.g.autosave
        end,
      }):map("<leader>uN")

      return {
        debounce_delay = 50,
      }
    end,
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    opts = {
      preset = "classic",
      options = {
        throttle = 0,
        multilines = {
          enabled = true,
          always_show = true,
        },
        show_all_diags_on_cursorline = true,
        severity = {
          vim.diagnostic.severity.ERROR,
          vim.diagnostic.severity.WARN,
          vim.diagnostic.severity.HINT,
        },
      },
    },
  },
}
