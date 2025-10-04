local lick = require("libraries/lick")
lick.reset = true
lick.showReloadMessage = false

function love.load()
	wf = require("libraries.windfield.windfield")

	world = wf.newWorld(0, 1000)

	player = world:newRectangleCollider(350, 100, 80, 80)
	ground = world:newRectangleCollider(100, 400, 600, 100)
	ground:setType("static")
end

function love.update(dt)
	local px, py = player:getLinearVelocity()
	if love.keyboard.isDown("left") and px > -300 then
		player:applyForce(-8000, 0)
	elseif love.keyboard.isDown("right") and px < 300 then
		player:applyForce(8000, 0)
	end
	world:update(dt)
end

function love.draw()
	world:draw()
end

function love.keypressed(key)
	if key == "up" then
		player:applyLinearImpulse(0, -3999)
	end
end
