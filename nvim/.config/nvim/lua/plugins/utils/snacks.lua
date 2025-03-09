return {
  "folke/snacks.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    -- "3rd/image.nvim",  --requires luarocks
  },
  keys = {
    {
      "<leader>qb",
      function()
        Snacks.dashboard()
      end,
      desc = "Dashboard",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>/",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader><space>",
      function()
        Snacks.picker.files({
          formatters = {
            file = {
              filename_first = true, -- display filename before the file path
            },
          },
        })
      end,
      desc = "Find Files",
    },
    -- find
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- git
    {
      "<leader>gc",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    -- Grep
    {
      "<leader>sb",
      function()
        Snacks.picker.lines()
      end,
      desc = "Buffer Lines",
    },
    {
      "<leader>sB",
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = "Grep Open Buffers",
    },
    {
      "<leader>sg",
      function()
        Snacks.picker.grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>sw",
      function()
        Snacks.picker.grep_word()
      end,
      desc = "Visual selection or word",
      mode = { "n", "x" },
    },
    -- search
    {
      '<leader>s"',
      function()
        Snacks.picker.registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>sa",
      function()
        Snacks.picker.autocmds()
      end,
      desc = "Autocmds",
    },
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>sC",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.help()
      end,
      desc = "Help Pages",
    },
    {
      "<leader>sH",
      function()
        Snacks.picker.highlights()
      end,
      desc = "Highlights",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sM",
      function()
        Snacks.picker.man()
      end,
      desc = "Man Pages",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>sR",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>uC",
      function()
        Snacks.picker.colorschemes()
      end,
      desc = "Colorschemes",
    },
    {
      "<leader>qp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>'",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks Picker",
    },
    {
      "<leader>uu",
      function()
        Snacks.picker.undo()
      end,
      desc = "Undo Tree",
    },

    -- {
    --   "<leader>e",
    --   function()
    --     Snacks.explorer()
    --   end,
    --   desc = "Undo Tree",
    -- },
    {
      "<leader>e",
      false,
      desc = "Undo Tree",
    },

    -- LSP
    -- {
    --   "gd",
    --   function()
    --     Snacks.picker.lsp_definitions()
    --   end,
    --   desc = "Goto Definition",
    -- },
    -- {
    --   "gr",
    --   function()
    --     Snacks.picker.lsp_references()
    --   end,
    --   nowait = true,
    --   desc = "References",
    -- },
    -- {
    --   "gI",
    --   function()
    --     Snacks.picker.lsp_implementations()
    --   end,
    --   desc = "Goto Implementation",
    -- },
    -- {
    --   "gy",
    --   function()
    --     Snacks.picker.lsp_type_definitions()
    --   end,
    --   desc = "Goto T[y]pe Definition",
    -- },
    -- {
    --   "<leader>ss",
    --   function()
    --     Snacks.picker.lsp_symbols()
    --   end,
    --   desc = "LSP Symbols",
    -- },
    -- {
    --   "<leader>ca",
    --   function()
    --     vim.lsp.buf.code_action()
    --   end,
    --   mode = { "v", "n" },
    --   desc = "Code Action",
    -- },
  },
  opts = {
    image = {
      enabled = not vim.g.neovide,
      explorer = { enabled = false },
      formats = {
        "png",
        "jpg",
        "jpeg",
        "gif",
        "bmp",
        "webp",
        "tiff",
        "heic",
        "avif",
        "mp4",
        "mov",
        "avi",
        "mkv",
        "webm",
      },
      force = true, -- try displaying the image, even if the terminal does not support it
      doc = {
        enabled = true,
        inline = true,
        float = true,
        max_width = 80,
        max_height = 40,
      },
      img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments" },
      wo = {
        wrap = false,
        number = false,
        relativenumber = false,
        cursorcolumn = false,
        signcolumn = "no",
        foldcolumn = "0",
        list = false,
        spell = false,
        statuscolumn = "",
      },
      cache = vim.fn.stdpath("cache") .. "/snacks/image",
      debug = {
        request = false,
        convert = false,
        placement = false,
      },
      env = {},
    },

    words = { enabled = true },
    scroll = {
      enabled = not vim.g.neovide,
    },
    zen = { enabled = false },
    animate = { enabled = false },
    indent = {
      indent = { enabled = false },
      chunk = {
        enabled = true,
        char = {
          horizontal = "-",
          corner_top = "╭",
          corner_bottom = "╰",
          arrow = "-",
        },
      },
    },
    terminal = {
      win = {
        wo = {
          winbar = "",
        },
        style = "float",
        -- relative = "editor",
        border = "rounded",
        -- width = 0.9,
        -- height = 0.9,
      },
    },
    picker = {
      ui_select = true,
      prompt = " 🔍  ",
      sources = {},
      focus = "input",
      layout = {
        cycle = true,
        --- Use the default layout or vertical if the window is too narrow
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
      icons = {
        indent = {
          vertical = "│ ",
          middle = "├╴",
          last = "╰-",
        },
      },
    },
    dim = {
      scope = {
        min_size = 5,
        max_size = 20,
        siblings = true,
      },
      animate = {
        enabled = vim.fn.has("nvim-0.10") == 1,
        easing = "outQuad",
        duration = {
          step = 20, -- ms per step
          total = 300, -- maximum duration
        },
      },
      filter = function(buf)
        return vim.g.snacks_dim ~= false and vim.b[buf].snacks_dim ~= false and vim.bo[buf].buftype == ""
      end,
    },
    dashboard = {
      enabled = true,
      preset = {
        header = string.rep("\n", 1)
          .. [[                                                                       
                                                                           
             ████ ██████           █████      ██                     
            ███████████             █████                             
            █████████ ███████████████████ ███   ███████████   
           █████████  ███    █████████████ █████ ██████████████   
          █████████ ██████████ █████████ █████ █████ ████ █████   
        ███████████ ███    ███ █████████ █████ █████ ████ █████  
       ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                             ]]
          .. "\n",

        keys = {

          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          -- stylua: ignore
          {action = function()require("persistence").select()end,desc = "Sessions",icon = "💾",key = "s",},
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = "⏲ ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      sections = {
        { section = "header", pane = 2 },
        {
          pane = 1,
          section = "terminal",
          cmd = "colorscript -e square && colorscript -e square",
          height = 10,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1, pane = 1 },
        {
          pane = 2,
          icon = "                               ",
          title = "Projects",
          section = "projects",
          indent = 20,
          padding = 1,
        },
        {
          pane = 2,
          icon = "                              ⏲ ",
          title = "Recent Files",
          section = "recent_files",
          indent = 20,
          padding = 1,
        },
        {
          pane = 1,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    notifier = { top_down = false, wo = { winblend = 1000 } },
  },
}
