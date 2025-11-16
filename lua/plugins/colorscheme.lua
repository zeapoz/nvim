return {
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "kanagawa" },
  },

  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    -- https://github.com/rebelot/kanagawa.nvim/issues/243
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.api.nvim_set_hl(0, "StatusLine", { link = "lualine_c_normal" })
        end,
      })
    end,
    opts = {
      transparent = false,
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
      overrides = function(colors)
        local theme = colors.theme
        return {
          CursorLineNr = { bg = theme.ui.bg_p2 },
          CursorLineSign = { bg = theme.ui.bg_p2 },

          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1, blend = 0 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },

          -- Treesitter capture groups.
          ["@module"] = { fg = theme.syn.constant },
          ["@function.macro"] = { fg = theme.syn.preproc },
          ["@lsp.type.macro"] = { fg = theme.syn.prepoc },
          ["@lsp.type.decorator"] = { fg = theme.syn.prepoc },
          ["@operator.try"] = { fg = theme.syn.special3 },
          ["@keyword.await"] = { fg = theme.syn.special3 },
          ["@keyword.import"] = { fg = theme.syn.keyword },
        }
      end,
      theme = "wave",
      background = {
        dark = "wave",
        light = "lotus",
      },
    },
  },
  { "webhooked/kanso.nvim" },
  { "tiagovla/tokyodark.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/everforest" },
  { "sainnhe/sonokai" },
}
