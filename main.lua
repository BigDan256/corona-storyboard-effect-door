
--- Main entry point for the project

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Start the application as a storyboard project
local storyboard = require("storyboard")

-- Enable Debug Mode
storyboard.isDebug = true
--storyboard.purgeOnSceneChange = true

_G.second_half = nil

storyboard.gotoScene("scene_closed")
