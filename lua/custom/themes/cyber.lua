-- TODO: My theme here

local lush = require('lush')
local hsl = lush.hsl


-- Colour scheme

-- a2018d -  purple pink
-- 6cff67 - light green
-- 2d2e2f - depth black
-- D3245B - rouge red
-- 7ca5b8 - muted blue

local highlight = hsl("#a2018d").lighten(20)
local background = hsl("#2d2e2f")
local primary = hsl("#D3245B")
local tertiary = hsl("#7ca5b8")

local theme = lush(function()
	return {
		-- Modes
		Normal { bg = background, fg = primary },
		Insert { Normal },
		Visual { bg = highlight, fg = tertiary },
		Command { fg = primary },
		-- Comments
		Comment { fg = tertiary.rotate(120) },

		-- LineNr
		LineNr { fg = highlight, bg = background },

		-- Cursor
		Cursor { fg = tertiary }, CursorLineNr { fg = tertiary, bg = background },
		Type { fg = primary },
		Keyword { fg = primary.rotate(-55).lighten(30) },

	}
end)
return {}
