return {
  "mfussenegger/nvim-dap",
  keys = "<leader>d",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    "theHamsta/nvim-dap-virtual-text",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {
        "js-debug-adapter",
      },
    })
    require("nvim-dap-virtual-text").setup({ highlight_new_as_changed = true })

    local wk = require("which-key")
    wk.add({
      { "<leader>d", group = "Debugger" },
      { "<leader>dO", ":DapStepOut<cr>", desc = "Step Out" },
      { "<leader>db", ":DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dc", ":DapContinue<cr>:Neotree close<cr>", desc = "Start/Continue" },
      { "<leader>di", ":DapStepInto<cr>", desc = "Step Into" },
      { "<leader>do", ":DapStepOver<cr>", desc = "Step Over" },
      { "<leader>dt", ":DapTerminate<cr>", desc = "Terminate debugging" },
    }, { prefix = "<leader>" })

    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Set Breakpoint with condition" })

    dapui.setup(
      -- Change breakpoint icons
      vim.api.nvim_set_hl(0, "DapBreak", { fg = "#aa1400" }),
      vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
    )
    local breakpoint_icons = vim.g.have_nerd_font
        and {
          Breakpoint = "",
          BreakpointCondition = "",
          BreakpointRejected = "",
          LogPoint = "",
          Stopped = "",
        }
      or {
        Breakpoint = "●",
        BreakpointCondition = "⊜",
        BreakpointRejected = "⊘",
        LogPoint = "◆",
        Stopped = "⭔",
      }
    for type, icon in pairs(breakpoint_icons) do
      local tp = "Dap" .. type
      local hl = (type == "Stopped") and "DapStop" or "DapBreak"
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end

    vim.keymap.set("n", "<F7>", dapui.toggle, { desc = "Debug: See last session result." })

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    --NOTE: Adapters for different languages and debuggers
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = 8123,
      executable = {
        command = "js-debug-adapter",
      },
    }

    -- dap.adapters.chrome = {
    --   type = "executable",
    --   command = "node",
    --   args = { os.getenv("HOME") .. "/code/vscode-chrome-debug/out/src/chromeDebug.js" },
    -- }
    --
    -- dap.configurations.javascriptreact = {
    --   {
    --     name = "Frontend Launch File",
    --     type = "chrome",
    --     request = "attach",
    --     program = "${file}",
    --     cwd = vim.fn.getcwd(),
    --     sourceMaps = true,
    --     protocol = "inspector",
    --     port = 9222,
    --     webRoot = "${workspaceFolder}",
    --   },
    -- }

    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
          runtimeExecutable = "node",
        },
      }
    end
  end,
}
