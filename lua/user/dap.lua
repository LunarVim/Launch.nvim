local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
  return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
  return
end


-- Supporting functions
local function get_args_from_user()
    local args_string = vim.fn.input('Debug Args: ')
    return vim.split(args_string, " ")
end

-- Python adapter configuration
dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      -- TODO add path, should this come from the config?
      command = config.pythonPath,
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.exists('$VIRTUAL_ENV') == 1 then
        return vim.fn.expand('$VIRTUAL_ENV') .. '/bin/python'
      elseif vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}
--
-- -- Node adapter configuration
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node-debug2-adapter',
--   args = {},
-- }
-- dap.configurations.javascript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   },
--   {
--     name = 'Attach to Docker Node',
--     type = 'node2',
--     request = 'attach',
--     address = 'localhost',
--     port = 9229,
--     localRoot = vim.fn.getcwd(),
--     remoteRoot = '/usr/src/app',
--     sourceMaps = true,
--     protocol = 'inspector',
--     skipFiles = {'<node_internals>/**'},
--   },
-- }
-- dap.configurations.typescript = {
--   {
--     name = 'Launch',
--     type = 'node2',
--     request = 'launch',
--     program = '${file}',
--     cwd = vim.fn.getcwd(),
--     sourceMaps = true,
--     protocol = 'inspector',
--     console = 'integratedTerminal',
--   },
--   {
--     name = 'Attach to process',
--     type = 'node2',
--     request = 'attach',
--     processId = require'dap.utils'.pick_process,
--   },
--   {
--     name = 'Attach to Docker Node',
--     type = 'node2',
--     request = 'attach',
--     address = 'localhost',
--     port = 9229,
--     localRoot = "${workspaceFolder}",
--     remoteRoot = '/usr/src/app',
--     skipFiles = {'<node_internals>/**'},
--   },
-- }
-- 

require('dap-vscode-js').setup({
  node_path = 'node',
  debugger_path = os.getenv('HOME') .. '/.DAP/vscode-js-debug',
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
})

local exts = {
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
  -- using pwa-chrome
  'vue',
  'svelte',
}

for _, ext in ipairs(exts) do
  dap.configurations[ext] = {
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Current File (pwa-node)',
      cwd = vim.fn.getcwd(),
      args = { '${file}' },
      sourceMaps = true,
      protocol = 'inspector',
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Current File (pwa-node with ts-node)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { '--loader', 'ts-node/esm' },
      runtimeExecutable = 'node',
      args = { '${file}' },
      sourceMaps = true,
      protocol = 'inspector',
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Current File (pwa-node with deno)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { 'run', '--inspect-brk', '--allow-all', '${file}' },
      runtimeExecutable = 'deno',
      attachSimplePort = 9229,
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Current File (pwa-node with jest)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
      runtimeExecutable = 'node',
      args = { '${file}', '--coverage', 'false'},
      rootPath = '${workspaceFolder}',
      sourceMaps = true,
      console = 'integratedTerminal',
      internalConsoleOptions = 'neverOpen',
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Current File (pwa-node with vitest)',
      cwd = vim.fn.getcwd(),
      program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
      args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
      autoAttachChildProcesses = true,
      smartStep = true,
      console = 'integratedTerminal',
      skipFiles = { '<node_internals>/**', 'node_modules/**' },
    },
    {
      type = 'pwa-node',
      request = 'launch',
      name = 'Launch Test Current File (pwa-node with deno)',
      cwd = vim.fn.getcwd(),
      runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
      runtimeExecutable = 'deno',
      attachSimplePort = 9229,
    },
    {
      type = 'pwa-chrome',
      request = 'attach',
      name = 'Attach Program (pwa-chrome = { port: 9222 })',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      port = 9222,
      webRoot = '${workspaceFolder}',
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach Program (Node2)',
      processId = require('dap.utils').pick_process,
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach Program (Node2 with ts-node)',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      skipFiles = { '<node_internals>/**' },
      port = 9229,
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach to Docker Node',
      address = 'localhost',
      sourceMaps = true,
      port = 9229,
      localRoot = vim.fn.getcwd(),
      remoteRoot = '/usr/src/app',
      skipFiles = {'<node_internals>/**'},
    },
    {
      type = 'pwa-node',
      request = 'attach',
      name = 'Attach Program (pwa-node)',
      cwd = vim.fn.getcwd(),
      processId = require('dap.utils').pick_process,
      skipFiles = { '<node_internals>/**' },
    },
  }
end

-- Go adapter configuration
dap.configurations.go = {
  {
    name = 'Launch',
    type = 'go',
    request = 'launch',
    program = '${file}',
  },
  {
    name = 'Launch w/ args',
    type = 'go',
    request = 'launch',
    program = '${file}',
    args = function()
      return get_args_from_user()
    end,
  },
  {
    name = 'Debug Test',
    type = 'go',
    request = 'launch',
    mode = 'test',
    program = '${fileDirname}',
  },
}
dap.adapters.go = {
  type = 'server',
  port = '${port}',
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/dlv',
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}


dapui.setup {
  expand_lines = true,
  icons = { expanded = "", collapsed = "", circular = "" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.33 },
        { id = "breakpoints", size = 0.17 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 0.33,
      position = "right",
    },
    {
      elements = {
        { id = "repl", size = 0.45 },
        { id = "console", size = 0.55 },
      },
      size = 0.27,
      position = "bottom",
    },
  },
  floating = {
    max_height = 0.9,
    max_width = 0.5, -- Floats will be treated as percentage of your screen.
    border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
