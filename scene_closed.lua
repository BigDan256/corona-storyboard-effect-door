-- Get required modules
local storyboard = require("storyboard")
local door_effects = require("door_effects")

-- Build a new scene
local scene = storyboard.newScene()
local right_door

-- A timer for timed scene change
local timer_fade
local function _onSplashTimeout()
	storyboard.gotoScene("scene_opened", "door_open", 1000)
	return true
end

-- Scene creation event
function scene:createScene(event)
	local group = self.view
	local left_door = display.newImageRect("left_door.png", 285, 360)
	left_door:setReferencePoint(display.CenterReferencePoint)
	left_door.x = 98
	left_door.y = 160
	group:insert(left_door)

	right_door = display.newImageRect("right_door.png", 285, 360)
	right_door:setReferencePoint(display.CenterReferencePoint)
	right_door.x = 382
	right_door.y = 160
	group:insert(right_door)
end

-- Scene entered event
function scene:enterScene(event)
	timer_fade = timer.performWithDelay(1000, _onSplashTimeout)
end

-- Scene exit event
function scene:exitScene(event)
	timer.cancel(timer_fade)
	timer_fade = nil
end

-- Scene creation event
function scene:willEnterScene(event)
	-- Add global reference to DisplayGroup
	_G.second_half = right_door
end

-- Scene exit event
function scene:didExitScene(event)
	-- Remove global reference to DisplayGroup
	_G.second_half = nil
end

scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("willEnterScene", scene)
scene:addEventListener("didExitScene", scene)
return scene
