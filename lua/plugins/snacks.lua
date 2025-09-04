return {
  "folke/snacks.nvim",
  opts = {
    scroll = { enabled = false },
    picker = {
      sources = {
        explorer = { layout = "sidebar_solid" },
        select = { layout = { preset = "select_solid" } },
      },
      layout = "default_solid",
      layouts = {
        default_solid = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = "solid",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "solid", width = 0.5 },
          },
        },
        sidebar_solid = {
          preview = "main",
          layout = {
            backdrop = false,
            width = 40,
            min_width = 40,
            height = 0,
            position = "left",
            border = "none",
            box = "vertical",
            {
              win = "input",
              height = 1,
              border = "bottom",
              title = "{title} {live} {flags}",
              title_pos = "center",
            },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
        select_solid = {
          preview = false,
          layout = {
            backdrop = false,
            width = 0.5,
            min_width = 80,
            height = 0.4,
            min_height = 3,
            box = "vertical",
            border = "solid",
            title = "{title}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
      },
    },
    scratch = { win = { border = "solid" } },
    terminal = {
      win = {
        position = "float",
        border = "solid",
      },
    },
    dashboard = {
      preset = {
        header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]],
      },
    },
  },
  keys = {
    {
      "<leader>e",
      function()
        require("snacks.explorer").open({
          cwd = LazyVim.root(),
          layout = "default_solid",
          auto_close = true,
        })
      end,
      desc = "Explorer Snacks (root-dir)",
    },
    {
      "<leader>E",
      function()
        require("snacks.explorer").open({
          layout = "default_solid",
          auto_close = true,
        })
      end,
      desc = "Explorer Snacks (cwd)",
    },
    {
      "<leader>.",
      function()
        require("snacks.picker").files()
      end,
      desc = "Find Files (cwd)",
    },
    {
      "<leader>z",
      function()
        require("snacks").scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
  },
}
