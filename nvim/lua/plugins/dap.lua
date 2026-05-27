return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "jay-babu/mason-nvim-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap   = require("dap")
      local dapui = require("dapui")

      require("mason-nvim-dap").setup({
        ensure_installed    = { "codelldb", "debugpy" },
        automatic_installation = true,
        handlers            = {},
      })

      require("nvim-dap-virtual-text").setup({
        enabled       = true,
        commented     = false,
        virt_text_pos = "eol",
      })

      dapui.setup({
        icons = { expanded = "", collapsed = "", current_frame = "" },
        layouts = {
          {
            elements = {
              { id = "scopes",      size = 0.35 },
              { id = "breakpoints", size = 0.15 },
              { id = "stacks",      size = 0.30 },
              { id = "watches",     size = 0.20 },
            },
            size = 40, position = "left",
          },
          {
            elements = {
              { id = "repl",    size = 0.5 },
              { id = "console", size = 0.5 },
            },
            size = 12, position = "bottom",
          },
        },
      })

      dap.listeners.after.event_initialized["dapui_config"]  = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"]  = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"]      = function() dapui.close() end

      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition" })
      vim.fn.sign_define("DapBreakpointRejected",  { text = "○", texthl = "DapBreakpointRejected" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine" })

      local codelldb_path = vim.fn.exepath("codelldb")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = { command = codelldb_path, args = { "--port", "${port}" } },
      }

      for _, lang in ipairs({ "c", "cpp", "rust" }) do
        dap.configurations[lang] = {
          {
            name    = "Launch file",
            type    = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
          {
            name    = "Attach to process",
            type    = "codelldb",
            request = "attach",
            pid     = require("dap.utils").pick_process,
            cwd     = "${workspaceFolder}",
          },
        }
      end

      require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")

      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { desc = "DAP: " .. desc })
      end
      map("<leader>db", dap.toggle_breakpoint, "Toggle Breakpoint")
      map("<leader>dc", dap.continue,          "Continue / Start")
      map("<leader>di", dap.step_into,         "Step Into")
      map("<leader>do", dap.step_over,         "Step Over")
      map("<leader>dO", dap.step_out,          "Step Out")
      map("<leader>du", dapui.toggle,          "Toggle UI")
      map("<leader>dq", dap.terminate,         "Terminate")
      map("<leader>dR", dap.run_last,          "Run Last")
      map("<leader>dr", dap.repl.open,         "Open REPL")
      map("<leader>dC", dap.clear_breakpoints, "Clear Breakpoints")
      map("<leader>dp", dap.pause,             "Pause")
      map("<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Condition: "))
      end, "Conditional Breakpoint")
      vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "DAP: Eval" })
    end,
  },
}