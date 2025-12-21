return {
  -- nvim-cmp removed - using CoC for completion instead

  -- nvim-metals for scala lsp
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      -- Check if nvim-metals is available
      local metals_ok, metals = pcall(require, "metals")
      if not metals_ok then
        return
      end

      local metals_config = metals.bare_config()
      metals_config.settings = {
        showImplicitArguments = true,
        excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
      }
      metals_config.capabilities = vim.lsp.protocol.make_client_capabilities()
      metals_config.on_attach = function(client, bufnr)
        require("metals").setup_dap()
        
        local map = vim.keymap.set
        map("n", "gD", vim.lsp.buf.definition, { buffer = bufnr })
        map("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
        map("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
        map("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
        map("n", "gds", vim.lsp.buf.document_symbol, { buffer = bufnr })
        map("n", "gws", vim.lsp.buf.workspace_symbol, { buffer = bufnr })
        map("n", "<leader>cl", vim.lsp.codelens.run, { buffer = bufnr })
        map("n", "<leader>sh", vim.lsp.buf.signature_help, { buffer = bufnr })
        map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
        map("n", "<leader>f", vim.lsp.buf.format, { buffer = bufnr })
        map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        map("n", "<leader>ws", function() require("metals").hover_worksheet() end, { buffer = bufnr })
        map("n", "<leader>ns", function() require("metals").new_scala_file() end, { buffer = bufnr })
        map("n", "<Leader>ws", "<Plug>(coc-metals-expand-decoration)", { buffer = bufnr })
      end

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      dap.configurations.scala = {
        {
          type = "scala",
          request = "launch",
          name = "RunOrTest",
          metals = {
            runType = "runOrTestFile",
          },
        },
        {
          type = "scala",
          request = "launch",
          name = "Test Target",
          metals = {
            runType = "testTarget",
          },
        },
      }

      local map = vim.keymap.set
      map("n", "<leader>dc", function() require("dap").continue() end)
      map("n", "<leader>dr", function() require("dap").repl.toggle() end)
      map("n", "<leader>dK", function() require("dap.ui.widgets").hover() end)
      map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end)
      map("n", "<leader>dcl", function() require("dap").clear_breakpoints() end)
      map("n", "<leader>dso", function() require("dap").step_over() end)
      map("n", "<leader>dsi", function() require("dap").step_into() end)
      map("n", "<leader>dl", function() require("dap").run_last() end)

      vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
    end
  },

  -- dap-ui
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      local map = vim.keymap.set
      map("n", "<leader>bb", function() dapui.toggle_breakpoint() end)
      map("n", "<leader>bo", function() dapui.open() end)
      map("n", "<leader>bc", function() dapui.close() end)
    end
  },

  -- other scala related plugins from scala-config.lua
  { "nvim-telescope/telescope-packer.nvim" },
  { "nvim-neotest/nvim-nio" }
}
