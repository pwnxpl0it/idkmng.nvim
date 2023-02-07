
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.config = {
    theme = {} -- default telescope theme
}

M.initialize = function()
    local templates = {}
    local files = io.popen("ls ~/.config/idkmng/templates")
    for file in files:lines() do
        if file ~= "." and file ~= ".." then
            file = string.gsub(file,".toml","") -- making it shorter
            table.insert(templates, file)
        end
    end

    local template = function(opts)
        pickers.new(opts, {
            prompt_title = "Select Template 🔍:",
            finder = finders.new_table {
                results = templates
            },
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    vim.cmd(":vsp term://idkmng " .. selection[1])
                    vim.api.nvim_feedkeys('i','n',true)
                end)
                return true
            end,
        }):find()
    end

   template(M.config.theme)
end

M.setup = function(config)
    if config ~= nil then
        M.config = config
    end
end

return M
