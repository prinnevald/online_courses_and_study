function hi(name)
	print("Hello " .. name .. "!")
end

hi("Chuck")
hi("Bob")
hi("Jeff")

-- IMPORTANT INFO ABOUT TABLES --

x = {'a', 'b', 'c'}

dictionary = {apple = 'a red fruit', box = 'a rectangular shape'}

print(dictionary.apple)		--first way
print(dictionary["box"])	--second way

-- IMPORTANT INFO ABOUT TABLES #2 --

x = {}
x.a = function()	--ARRAY OF FUNCTIONS!?
	print("a")
end

x.a()	--prints "a"

-- LESSON FOUR --
-- This is a replica of the Adventure--

print("Welcome to the game.")

inv = {"coin", "sword", "armor"}	--kind of usind the array of some valuse. Can be anything~~ I think

function get_inv()
	for i,v in pairs(inv) do	--did not really get this one till the end, but it is definitely a for loop
	print(i .. "." .. v)		--serves for printing the inventory
	end
end

function inv_com()
	print("Wrong command...")	-- Functions in Lua work exactly the same as in C
end

function get_inp()
	print("What do you want to do?")
	i = io.read()
	return i
end

function push_inv(item)
	print("you now have " .. item)
	table.insert(inv, item)
end

function pop_inv(item)
	print("you lost " .. item)

	for i,v in pairs(inv) do
		if v == item then
		table.remove(inv, i)
		end
	end

end

-- {'command' = 'response', 'com2' = 'res2'}
function room(t)

	room_exit = false
	input = ""

	while not room_exit do	-- "~=" means "!="

	input = get_inp()
	valid = false
		
			for k,v in pairs(t) do

				if input == string.gsub(k, "_", " ") then
					if type(v) == "string" then
					print(v)
				else
					v()
				end
				valid = true
				end
			end


		if input == "inv" then
			get_inv()
		elseif valid == false then
			inv_com()
		end
	end
end

room_com = {look = "You are in the cave", 
	exit = function()
	print("You leave the cave")
	room_exit = true
	end
}

room(room_com)

room_com2 = {
	look = "You are at the base of a mountain. There is a path leading somewhere",
	follow_path = function()
		print("You followed the path")
		print("A skeleton! (run, attack)")

		tinput = io.read()

		if tinput == "attack" then
		print("Skeleton dies, and you continue the adventure")
		room_exit = true

		elseif tinput == "run" then
		print("You have lost your coin!")
		pop_inv("coin")
		room_exit = true

		else 
		print("Skeleton attacks and You die! GAME OVER")
		os.exit()
		end	
	end
}

room(room_com2)

have_key = false	--boolean

room_com3 = {

	look = function()
		if have_key == false then
			print("You are near the gate. It is locked. Key is somewhere in the  grass")
		elseif have_key == true then
			print("There is a gate")
		end
	end,

	pick_key = function()
		have_key = true
		print("You picked the key")
	end,

	open_gate = function()
		if have_key == true then
			print("You opened the gate and escaped")
			room_exit = true
		elseif have_key == false then
			print("Key needed")
		end
	
	end
}
	
room(room_com3)


-- The command to remove the item from the table is "table.remove(nameOfTable, indexOfItem)"
