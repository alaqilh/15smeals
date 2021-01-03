
local composer = require( "composer" )
local scene = composer.newScene()
local background
local title
local button
local function changeScenes()
composer.gotoScene("view1",{effect="slideRight",time=1000})
end
function scene:create( event )
	local sceneGroup = self.view
	local background = display.newImageRect("background.png",900,1200)
	sceneGroup:insert(background)
	local title = display.newImageRect("logo.png",189,181)
	title.x=display.contentWidth-160
	title.y=display.contentHeight-450
	sceneGroup:insert( title )
	aa = display.viewableContentWidth
	bb = display.viewableContentHeight
	local Button = {};
	Button.new = function(params)
	
	local alnm = display.newGroup();
	
	local offIMG = params and params.off or "";
	local onIMG = params and params.on or "";
	
	local off = display.newImageRect(offIMG,100,50);
	local on = display.newImageRect(onIMG,80,80);
	
	on.alpha = 0;
	
	alnm:insert(off);
	alnm:insert(on);
	
	alnm.x = params and params.x or 0;
	alnm.y = params and params.y or 0;
	
	function alnm:touch(e)
		if(e.phase == "began")then
			on.alpha = 1;
			display.getCurrentStage():setFocus(self);
			self.hasFocus = true;
		elseif(self.hasFocus)then
			if(e.phase == "ended")then
	
			if(params)then
				if(params.callback)then
					params.callback(e);
					end
					end
					on.alpha =0
					display.getCurrentStage():setFocus(nil);
					self.hasFocus = false;
			end
		end
	end
	alnm:addEventListener("touch",alnm)
	return alnm;
	end
	
	
	local video1 = Button.new({
	off = "1.png",
	on = "kissing.png",
	x = aa*0.5,
	y = bb*0.5,
	callback = function (e)
	media.playVideo("simple.mp4",true,function(e)
		print("video ended");
		
	
	
	
	end)
		
	end
	
	
	})
	local video2 = Button.new({
	off = "2.png",
	on = "happy.png",
	x = aa*0.5,
	y = bb*0.9,
	callback = function (e)
	
	media.playVideo("pezza.mp4",true,function(e)
		print("video ended");
	end)
		
	end
	
	
	})
	local video3 = Button.new({ 
	off = "3.png",
	on = "in-love.png",
	x = aa*0.5,
	y = bb*0.7,
	callback = function (e)
	
	media.playVideo("masop.mp4",true,function(e)
		print("video ended");
	end)
		
	end
})
	
	
	
	
	end
		
	
	
	function scene:show( event )
		local sceneGroup = self.view
		local phase = event.phase
		
		if phase == "will" then
			-- Called when the scene is still off screen and is about to move on screen
		elseif phase == "did" then
			-- Called when the scene is now on screen
			-- 
			-- INSERT code here to make the scene come alive
			-- e.g. start timers, begin animation, play audio, etc.
		end	
	end
	
	function scene:hide( event )
		local sceneGroup = self.view
		local phase = event.phase
		
		if event.phase == "will" then
			-- Called when the scene is on screen and is about to move off screen
			--
			-- INSERT code here to pause the scene
			-- e.g. stop timers, stop animation, unload sounds, etc.)
		elseif phase == "did" then
			-- Called when the scene is now off screen
		end
	end
	
	function scene:destroy( event )
		local sceneGroup = self.view
		
		-- Called prior to the removal of scene's "view" (sceneGroup)
		-- 
		-- INSERT code here to cleanup the scene
		-- e.g. remove display objects, remove touch listeners, save state, etc.
	end
	
	---------------------------------------------------------------------------------
	
	-- Listener setup
	scene:addEventListener( "create", scene )
	scene:addEventListener( "show", scene )
	scene:addEventListener( "hide", scene )
	scene:addEventListener( "destroy", scene )
	
	-----------------------------------------------------------------------------------------
	
	return scene
	