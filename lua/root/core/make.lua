-- Function to find the nearest Makefile directory
local function find_makefile_dir()
    local current_dir = vim.fn.expand('%:p:h')  -- Get current file's directory
    local path = current_dir
    -- Search up the directory tree for a Makefile
    while path ~= '/' do
        if vim.fn.filereadable(path .. '/Makefile') == 1 then
            return path
        end
        path = vim.fn.fnamemodify(path, ':h')
    end
    return nil
end

-- Function to get available make rules
local function get_make_rules()
    local makefile_dir = find_makefile_dir()
    if not makefile_dir then
        print("No Makefile found")
        return {}
    end
    -- Read Makefile content and extract rules
    local makefile = io.open(makefile_dir .. '/Makefile', 'r')
    if not makefile then return {} end
    local content = makefile:read('*a')
    makefile:close()
    local rules = {}
    for rule in string.gmatch(content, "^([%w-_]+):.-\n") do
        table.insert(rules, rule)
    end
    return rules
end

-- Function to execute make command
local function execute_make_command(command)
    local makefile_dir = find_makefile_dir()
    if not makefile_dir then
        print("No Makefile found in current or parent directories")
        return
    end
    local Terminal = require('toggleterm.terminal').Terminal
    local make_term = Terminal:new({
        cmd = string.format('cd %s && %s', makefile_dir, command),
        direction = 'float',
        float_opts = {
            border = 'curved',
            width = 70,
            height = 20,
            winblend = 3,
        },
        size = vim.o.columns * 0.4,
        close_on_exit = false,
        on_open = function(term)
            vim.cmd('startinsert!')
            print("Executing: " .. command .. " in " .. makefile_dir)
        end,
        on_exit = function(term, job_id, exit_code)
            if exit_code == 0 then
                print(command .. " completed successfully")
            else
                print(command .. " failed with exit code: " .. exit_code)
            end
        end,
    })
    make_term:toggle()
end

-- Function to prompt for custom make rule
local function custom_make_rule()
    -- Get available rules
    local rules = get_make_rules()
    -- Create input prompt with completion
    vim.ui.input({
        prompt = "Enter make rule: ",
        completion = function(arglead, cmdline, cursorpos)
            local matches = {}
            for _, rule in ipairs(rules) do
                if rule:match("^" .. arglead) then
                    table.insert(matches, rule)
                end
            end
            return matches
        end
    }, function(rule)
        if rule and rule ~= "" then
            execute_make_command('make ' .. rule)
        end
    end)
end

-- Standard make keymaps
vim.keymap.set('n', '<leader>m', function()
    execute_make_command('make')
end, { desc = 'Run make' })

vim.keymap.set('n', '<leader>mr', function()
    execute_make_command('make re')
end, { desc = 'Run make re' })

vim.keymap.set('n', '<leader>mc', function()
    execute_make_command('make clean')
end, { desc = 'Run make clean' })

vim.keymap.set('n', '<leader>mf', function()
    execute_make_command('make fclean')
end, { desc = 'Run make fclean' })

-- Custom rule keymap
vim.keymap.set('n', '<leader>mk', custom_make_rule, { desc = 'Run custom make rule' })
