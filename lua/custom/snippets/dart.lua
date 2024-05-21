require('luasnip.session.snippet_collection').clear_snippets "dart"
local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node


local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta

ls.add_snippets("dart", {
	s("scaffold", fmt("return Scaffold(body: {});", { i(1) })),
	s("cubit", fmta([[
class (name)Cubit extends Cubit<(state)>{

	(finish)

}
]], { name = i(1), state = i(2), finish = i(0) }, { delimiters = "()" })),
	s("fv", fmt("final {} = {};{}", { i(1), i(2), i(0) })),
})
