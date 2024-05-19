local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require 'telescope.config'.values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local get_files = vim.split(vim.fn.glob('~/.config/nvim/'), '\n')

local config_files = function(opts)
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "dotfiles",
		finder = finders.new_table {},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, map)
			actions.set_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.api.nvim_put({ selection[1] }, "", false, true)
			end)
			return true
		end
	}):find()
end


config_files()
