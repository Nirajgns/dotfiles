return {
  "nvim-lualine/lualine.nvim",
  event = function()
    return { "BufReadPost", "BufWritePost", "BufNewFile" }
  end,
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- Set an empty statusline until lualine loads
      vim.o.statusline = " "
    else
      -- Hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local icons = LazyVim.config.icons
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        section_separators = { left = "", right = "" },
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          {
            --to show root directory
            function()
              local cwd = vim.fn.getcwd() -- Get current working directory
              return vim.fn.fnamemodify(cwd, ":t") -- Extract the last part (project name)
            end,
          },
          { "branch" },
        },
        lualine_c = {
          LazyVim.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_x = {
          {
            "lsp_status",
            icon = " ",
            symbols = {
              spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
              done = "✓",
              separator = ",",
            },
          },
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
          },
          {
            function()
              return require("noice").api.status.mode.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.mode.has()
            end,
          },
          { "overseer" },
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
          },
          {
            -- this function is for vgit
            function()
              local status = vim.b.vgit_status
              if type(status) == "table" then
                -- Extract the values
                local added = status.added or 0
                local removed = status.removed or 0
                local changed = status.changed or 0

                -- Format the output with color codes, but only if the value is greater than 0
                local added_text = (added > 0) and string.format("%%#Added#  %d", added) or ""
                local changed_text = (changed > 0) and string.format("%%#Changed#  %d", changed) or ""
                local removed_text = (removed > 0) and string.format("%%#Removed#  %d", removed) or ""

                -- Set the colors
                vim.api.nvim_set_hl(0, "Added", { fg = "#98c379" }) -- Green
                vim.api.nvim_set_hl(0, "Changed", { fg = "#e5c07b" }) -- Yellow
                vim.api.nvim_set_hl(0, "Removed", { fg = "#e06c75" }) -- Red

                -- Return the concatenated string, but skip empty values
                local result = table.concat({ added_text, changed_text, removed_text }, " ")
                return result
              end
              return ""
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return "  " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
