local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

-- ls.add_snippets(nil, {
-- 	all = {
-- 		snip({
-- 			trig = "\\begin",
-- 			namr = "Begin",
-- 			dscr = "Begins and ends environment in LATEX",
-- 		}, {
-- 			text({ "\\begin{" }), insert(1, "environment"),
-- 			text({ "}", "" }), insert(2, ""),
-- 			text({ "", "\\end{" }), insert(1, "environment"),
-- 			insert(0)
-- 		}),
-- 	},
-- })

ls.add_snippets(nil, {
	all = {
		snip(
			{
				trig = "hi",
			},
			{
				text("Hello, world!"),
			}
		)
	}

})
