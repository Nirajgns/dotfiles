return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[                                                                       
                                                                           
             ████ ██████           █████      ██                     
            ███████████             █████                             
            █████████ ███████████████████ ███   ███████████   
           █████████  ███    █████████████ █████ ██████████████   
          █████████ ██████████ █████████ █████ █████ ████ █████   
        ███████████ ███    ███ █████████ █████ █████ ████ █████  
       ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                             ]]

    logo = string.rep("\n", 1) .. logo .. "\n"

    local opts = {
      theme = "hyper",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        shortcut = {
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "Mason",                                          desc = " Mason",           icon = "󰏗 ", key = "m" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        packages = { enable = false },
        project = {
          enable = true, --FIX: in issue with dashboard, try disabling and re-enabling this
          limit = 9,
          action = function()
            require("persistence").load()
            require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
            vim.cmd("Neotree close")
            vim.cmd("Neotree show")
          end,
        },
        mru = { limit = 8, cwd_only = false },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            "   " .. stats.loaded .. "/" .. stats.count .. " in " .. "⏲  " .. ms .. " ms",
          }
        end,
      },
    }

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    vim.keymap.set("n", "<leader>qb", ":Dashboard<cr>:Neotree close<cr>", { silent = true, desc = "Dashboard" })

    return opts
  end,
}
