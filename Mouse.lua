scriptId = 'com.sm1th.scripts.myfirstscript'

mouseEnabled = false

function activeAppName()
	return "My first script!"
end

function enableMouseControl()
	-- myo.centerMousePosition()
	myo.controlMouse(true)
end

function disableMouseControl()
	myo.controlMouse(false)
end


function onForegroundWindowChange(app, title)
    -- myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
	if app == "com.apple.iTunes" then
		return false
	else
		return true
	end
end

function mouseLeftClick()
	myo.mouse("left", "click")
end


function mouseRightClick()
	myo.mouse("right", "click")
end

function onPoseEdge(pose, edge)
	-- myo.debug("onPoseEdge: " .. pose .. ", " .. edge)

	-- To activate mouse movement
	if pose == "fingersSpread" then
		if mouseEnabled then
			disableMouseControl()
			mouseEnabled = false
		elseif not mouseEnabled then
			enableMouseControl()
			mouseEnabled = true
		end
	end

	-- To activate Left Mouse click
	if pose == "waveIn" and edge == "on" then
		mouseLeftClick()
	end

	-- To activate Right Mouse Click
	if pose == "waveOut" and edge == "on" then
		mouseRightClick()
	end

	-- To activate Click and Drag
	if pose == "fist" and edge == "on" then
		myo.controlMouse(true)
		mouseEnabled = true
		myo.mouse("left", "down")

	elseif pose =="fist" and edge == "off" then
		myo.controlMouse(false)
		mouseEnabled = false
		myo.mouse("left", "up")

	end
end
