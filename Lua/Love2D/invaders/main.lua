love.graphics.setDefaultFilter("nearest", "nearest")

enemy = {}
enemies_controller = {}
enemies_controller.enemies = {}
enemies_controller.image = love.graphics.newImage("lol.png")

function love.load()
	player = {}
	player.x = 0
	player.y = 540
	player.bullets = {}
	player.cd = 300
	player.speed = 1
	player.image = love.graphics.newImage("player.png")
	
	player.fire = function()
	
		if player.cd <= 0 then
			player.cd = 300
			bullet = {}
			bullet.x = player.x + 22
			bullet.y = player.y
			table.insert(player.bullets, bullet)
		end
	end

	enemies_controller:spawnEnemy(0, 0)
	enemies_controller:spawnEnemy(100, 0)

end

function enemies_controller:spawnEnemy(x, y)
	enemy = {}
	enemy.x = x
	enemy.y = y
	enemy.bullets = {}
	enemy.cd = 300
	enemy.speed = 1
	table.insert(self.enemies, enemy)
end

function enemy:fire()

	if self.cd <= 0 then
		self.cd = 300
		bullet = {}
		bullet.x = self.x + 22
		bullet.y = self.y
		table.insert(self.bullets, bullet)
	end	

end

function love.update(dt)

	player.cd = player.cd - 1

	if love.keyboard.isDown("right") then
	player.x = player.x + player.speed
	elseif love.keyboard.isDown("left") then
	player.x = player.x - player.speed
	end

	if love.keyboard.isDown("space") then
		player.fire()
	end

	for _,e in pairs(enemies_controller.enemies) do
		e.y = e.y + 0.05
	end

	for i,v in ipairs(player.bullets) do

		if v.y < -10 then
		table.remove(player.bullets, i)
		end

		v.y = v.y - 1
	end
end

function love.draw()
	--drawing player
	love.graphics.draw(player.image, player.x, player.y, 0, 5)

	--drawing enemies
	for _,e in pairs(enemies_controller.enemies) do
		love.graphics.draw(enemies_controller.image, e.x, e.y, 0, 5)
	end

	--drawing bullets	
	love.graphics.setColor(255, 255, 255)
	for _,v in pairs(player.bullets) do
		love.graphics.rectangle("fill", v.x, v.y + 32, 6, 10)
	end
end


