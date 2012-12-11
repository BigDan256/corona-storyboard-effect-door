
--- storyboard scene switching effect (sliding doors)

-- Add a new effect to storyboard (copy of the slideUp transition, with modifications)
local door_open_effect = {
	sceneAbove = false,
	concurrent = true,
	to = {},
	from = {
		xStart = 0, xEnd = -285,

		-- Modified transition
		transition = function(t, tMax, start, delta)
			local percent = t / tMax
			if _G.second_half then

				-- The right side starts at (1.5*screen width,0) and moves to (0.5*screen width,0)
				_G.second_half.x = 382 + 569 * percent

				-- The left side starts at (-0.5*screen width,0) and moves to (0,0)
				-- ie. the transition distance is halved, so we scale the function to match
				return percent * delta + start
			end
			return percent * delta + start
		end,
	},
}
local door_close_effect = {
	sceneAbove = true,
	concurrent = true,
	to = {
		xStart = -285, xEnd = 0,

		-- Modified transition
		transition = function(t, tMax, start, delta)
			local percent = t / tMax
			if _G.second_half then

				-- The right side starts at (1.5*screen width,0) and moves to (0.5*screen width,0)
				_G.second_half.x = 951 - 569 * percent

				-- The left side starts at (-0.5*screen width,0) and moves to (0,0)
				-- ie. the transition distance is halved, so we scale the function to match
				return percent * delta + start
			end
			return percent * delta + start
		end,
	},
	from = {},
}

-- Attach the effect to the storyboard effects list
local storyboard = require("storyboard")
storyboard.effectList.door_open = door_open_effect
storyboard.effectList.door_close = door_close_effect

return door_open_effect
