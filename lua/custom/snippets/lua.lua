require('luasnip.session.snippet_collection').clear_snippets "lua"
local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node


local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta


ls.add_snippets("lua", {
	s("keymap", fmt("vim.keymap.set(\"{}\", \"{}\", {}, {})", {
		i(1),
		i(2),
		i(3),
		i(4),
	}))
})
