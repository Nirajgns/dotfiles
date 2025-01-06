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
          -- { action = "Mason",                                          desc = " Mason",           icon = "󰏗 ", key = "m" },
          {action=function() require("persistence").select() end,      desc="Sessions",     icon="💾 ",   key="s"},
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
        packages = { enable = false },
        project = {
          enable = true, --FIX: in issue with dashboard, try disabling and re-enabling this
          limit = 9,
          action = function()
            require("persistence").load()
            vim.defer_fn(function()
              vim.cmd("Neotree show")
            end, 250)
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

--FIX: this for line 126 assert issue

-- local function read_project(data)
--   local res = {}
--
--   -- Ensure data is a valid string
--   data = string.gsub(data, '%z', '') -- Remove null characters
--
--   -- Safely try to load and execute the string
--   local ok, dump = pcall(loadstring, data)
--   if not ok or type(dump) ~= "function" then
--     table.insert(res, (' '):rep(3) .. ' Failed to load projects')
--     table.insert(res, '')
--     return res
--   end
--
--   local list = dump() -- Execute the loaded string (if valid)
--   if list then
--     list = vim.list_slice(list, #list - config.project.limit)
--   end
--
--   for _, dir in ipairs(list or {}) do
--     dir = dir:gsub(vim.env.HOME, '~') -- Replace $HOME with ~
--     table.insert(res, (' '):rep(3) .. ' ' .. dir)
--   end
--
--   if #res == 0 then
--     table.insert(res, (' '):rep(3) .. ' empty project')
--   else
--     reverse(res)
--   end
--
--   table.insert(res, 1, config.project.icon .. config.project.label)
--   table.insert(res, 1, '')
--   table.insert(res, '')
--
--   return res
-- end
