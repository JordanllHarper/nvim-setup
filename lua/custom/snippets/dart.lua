require('luasnip.session.snippet_collection').clear_snippets "dart"
local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node


local fmt = require "luasnip.extras.fmt".fmt
local fmta = require "luasnip.extras.fmt".fmta

ls.add_snippets("dart", {
	s("sca", fmt("return Scaffold(body: {});", { i(1) })),
	--
	s("cubit", fmta([[
class (name)Cubit extends Cubit<(state)>{

	(finish)

}]], { name = i(1), state = i(2), finish = i(0) }, { delimiters = "()" })),
	--
	s({ trig = "fv", desc = "Create a final value" }, fmt("final {} = {};{}", { i(1), i(2), i(0) })),
	--
	s({ trig = "ff", desc = "Create a final field" }, fmt("final {} {};{}", { i(1), i(2), i(0) })),
	--
	s({ trig = "vv", desc = "Create a variable value" }, fmt("{} {} = {};{}", { i(1), i(2), i(3), i(0) })),
	--
	s({ trig = "vf", desc = "Create a variable field" }, fmt("{} {};{}", { i(1), i(2), i(0) })),
	--
	s("slw", fmta([[
class (name) extends StatelessWidget {

		(finish)

}
]], { name = i(1), finish = i(2) }, { delimiters = "()" })),
	--
	s("sfw", fmta([[
class (name) extends StatefulWidget {

	(finish)

}
]], { name = i(1), finish = i(2) }, { delimiters = "()" })),
})
