local js_based_languages = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "vue",
}
return {
  "mfussenegger/nvim-dap",
  keys = {

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
    { "<leader>dO", ":DapStepOut<cr>", desc = "Step Out" },
    { "<leader>db", ":DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
    { "<leader>dc", ":DapContinue<cr>:Neotree close<cr>", desc = "Start/Continue" },
    { "<leader>di", ":DapStepInto<cr>", desc = "Step Into" },
    { "<leader>do", ":DapStepOver<cr>", desc = "Step Over" },
    { "<leader>dt", ":DapTerminate<cr>", desc = "Terminate debugging" },
  },

  dependencies = {
    { "nvim-neotest/nvim-nio" },
    {
      "rcarriga/nvim-dap-ui",
      config = function()
        local dapui = require("dapui")
        dapui.setup()
        local dap = require("dap")

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

  config = function()
    local dap = require("dap")
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file with pwa-node",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
        },
        --NOTE: (add --inspect flag when you run the node or nodemon process esle debugger won't attach)
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach PWA node",
          processId = require("dap.utils").pick_process,
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
        },
        -- Debug web applications (client-side) with pwa-chrome
        {
          type = "pwa-chrome", -- Change from "chrome" to "pwa-chrome"
          request = "launch",
          name = "Launch & Debug PWA Chrome",
          url = function()
            local co = coroutine.running()
            return coroutine.create(function()
              vim.ui.input({
                prompt = "Enter URL: ",
                default = "http://localhost:3000",
              }, function(url)
                if url == nil or url == "" then
                  return
                else
                  coroutine.resume(co, url)
                end
              end)
            end)
          end,
          webRoot = vim.fn.getcwd(),
          protocol = "inspector",
          sourceMaps = true,
          userDataDir = false,
        },
        {
          name = "----- ↓ launch.json configs ↓ -----",
          type = "",
          request = "launch",
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

    -- Toggle dap-ui
    vim.keymap.set("n", "<leader>dut", require("dapui").toggle, { desc = "Debug: See last session result." })
  end,
}
