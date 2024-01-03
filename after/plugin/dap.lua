-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<F1>', ":lua require'dap'.step_into()<CR>")
vim.keymap.set('n', '<F2>', ":lua require'dap'.step_over()<CR>")
vim.keymap.set('n', '<F3>', ":lua require'dap'.step_out()<CR>")
vim.keymap.set('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set('n', '<leader>B',
":lua require'dap'.set_breakpoint(vim.fn.input 'Breakpoint condition: '")
-- vim.keymap.set('n', '<leader>dt', ":lua require'dap-go'.debug_test()<CR>")
vim.keymap.set('n', '<leader>do', ":lua require'dapui'.open()<CR>")
vim.keymap.set('n', '<leader>dc', ":lua require'dapui'.close()<CR>")
vim.keymap.set('n', '<leader>dg', ":lua require'dapui'.toggle()<CR>")

local config = {
    cmd ={'/home/dev/.local/share/nvim/mason/bin/jdtls'};
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)

local dap = require('dap')

dap.defaults.fallback.terminal_win_cmd = 'split'
dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/kitty';
    args = {'--title', 'nvim-dap', '-e'};
}

dap.configurations.java = {
    {
        type = 'java',
        name = 'Debug (Attach)',
        request = 'attach',
        hostName = 'localhost',
        port = 5005,
    },
    {
        type = 'java',
        name = 'Debug (Launch)',
        request = 'launch',
        mainClass = '${file}',
        args = {},
        cwd = '${workspaceFolder}',
        console = 'internalConsole',
        stopOnEntry = false,
    },
}

require('nvim-dap-virtual-text').setup()
require('dap-go').setup()
require('dapui').setup()


-- dap.adapters.java = {
--     type = 'executable',
--     command = 'java',
--     args = {
--         '-agentlib:jdwp=transport=dt_socket,server=y,address=localhost:5005, suspend=y',
--     },
--     env = {
--         JAVA_HOME = '/usr/lib/jvm/jdk-17',
--     },
--     cwd = '${workspaceFolder}',
--     name = 'Java Debug',
-- }
-- For more information, see |:help nvim-dap-ui|
-- require("dapui").setup() {
    --   -- Set icons to characters that are more likely to work in every terminal.
    --   --    Feel free to remove or use ones that you like more! :)
    --   --    Don't feel like these are good choices.
    --   icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
    --   controls = {
        --     icons = {
            --       pause = '⏸',
            --       play = '▶',
            --       step_into = '⏎',
            --       step_over = '⏭',
            --       step_out = '⏮',
            --       step_back = 'b',
            --       run_last = '▶▶',
            --       terminate = '⏹',
            --     },
            --   },
            -- }

            -- require("dapui").open()
            -- require("dapui").close()
            -- require("dapui").toggle()

            -- local dap, dapui = require("dap"), require("dapui")
            -- dap.listeners.after.event_initialized["dapui_config"] = function()
                --   dapui.open()
                -- end
                -- dap.listeners.before.event_terminated["dapui_config"] = function()
                    --   dapui.close()
                    -- end
                    -- dap.listeners.before.event_exited["dapui_config"] = function()
                        --   dapui.close()
                        -- end

                        -- -- Install golang specific config
                        -- require('dap-go').setup()
