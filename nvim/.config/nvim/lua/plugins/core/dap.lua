local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}
return {
  "mfussenegger/nvim-dap",
  enabled = false,
  config = function()
    local dap = require("dap")
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch with node.js",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach a node.js process",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Start Chrome with localhost",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:5173",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
          protocol = "inspector",
          sourceMaps = true,
        },
      }
    end
    -- Set custom breakpoint icons
    local breakpoint_icons = {
      Breakpoint = "",
      BreakpointCondition = "",
      BreakpointRejected = "",
      LogPoint = "",
      Stopped = "",
    }
    for type, icon in pairs(breakpoint_icons) do
      local hl = (type == "Stopped") and "DapStop" or "DapBreak"
      vim.fn.sign_define("Dap" .. type, { text = icon, texthl = hl, numhl = hl })
    end
    vim.api.nvim_set_hl(0, "DapBreak", { fg = "#aa1400" })
    vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })

    -- Keybindings

    -- Conditional breakpoint
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Breakpoint with condition" })
  end,
  keys = {
    { "<leader>d", desc = "Debugger" },
    {
      "<leader>da",
      function()
        if vim.fn.filereadable(".vscode/launch.json") then
          local dap_vscode = require("dap.ext.vscode")
          dap_vscode.load_launchjs(nil, {
            ["pwa-node"] = js_based_languages,
            ["chrome"] = js_based_languages,
            ["pwa-chrome"] = js_based_languages,
          })
        end
        require("dap").continue()
      end,
      desc = "Run with Args",
    },
    { "<leader>dO", ":DapStepOut<cr>", desc = "Step Out", silent = true },
    { "<leader>db", ":DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint", silent = true },
    { "<leader>dc", ":DapContinue<cr>:Neotree close<cr>", desc = "Start/Continue", silent = true },
    {
      "<leader>dC",
      ":DapClearBreakpoints<cr>:echo 'Breakpoints cleared'<cr>",
      desc = "Clear all breakpoints",
      silent = true,
    },
    { "<leader>di", ":DapStepInto<cr>", desc = "Step Into", silent = true },
    { "<leader>do", ":DapStepOver<cr>", desc = "Step Over", silent = true },
    { "<leader>dt", ":DapTerminate<cr>", desc = "Terminate debugging", silent = true },
    { "<leader>dv", ":DapVirtualTextToggle<cr>", desc = "Toggle DAP virtual text ", silent = true },
  },

  dependencies = {
    { "nvim-neotest/nvim-nio" },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        local dapui = require("dapui")
        dapui.setup()
        local dap = require("dap")

        -- Toggle dap-ui
        vim.keymap.set(
          "n",
          "<leader>du",
          require("dapui").toggle,
          { desc = "Toggle Dap UI (Last state of debugger)", silent = true }
        )

        vim.keymap.set("n", "<leader>de", function()
          require("dapui").eval()
        end, { desc = "Float eval expression", silent = true })

        vim.keymap.set("n", "<leader>df", function()
          require("dapui").float_element()
        end, { desc = "DAP float", silent = true })

        dap.listeners.after.event_initialized["dapui_config"] = dapui.open
        dap.listeners.before.event_terminated["dapui_config"] = dapui.close
        dap.listeners.before.event_exited["dapui_config"] = dapui.close
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      config = function()
        require("nvim-dap-virtual-text").setup({
          highlight_new_as_changed = true,
        })
      end,
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "williamboman/mason.nvim" },
      config = function()
        require("mason-nvim-dap").setup({
          automatic_installation = true,
          handlers = {},
          ensure_installed = {
            "js-debug-adapter",
          },
        })
      end,
    },
    {
      "microsoft/vscode-js-debug",
      -- After install, build it and rename the dist directory to out
      build = "npm install --legacy-peer-deps --no-save && npx gulp vsDebugServerBundle && rm -rf out && mv dist out",
      version = "1.*",
    },
    {
      "mxsdev/nvim-dap-vscode-js",
      config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("dap-vscode-js").setup({

          debugger_path = vim.fn.resolve(vim.fn.stdpath("data") .. "/lazy/vscode-js-debug"),

          -- which adapters to register in nvim-dap
          adapters = {
            "chrome",
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "pwa-extensionHost",
            "node-terminal",
            "chrome",
          },
        })
      end,
    },
    {
      "Joakker/lua-json5",
      build = "./install.sh",
    },
  },
}
