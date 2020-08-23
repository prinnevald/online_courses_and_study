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


-- LESSON THREE --
-- This is a replica of the Adventure--

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
function room(exit_command, t)
	
	input = ""

	while input ~= exit_command do	-- "~=" means "!="

	input = get_inp()
	valid = false
		
			for k,v in pairs(t) do
				if input == k then
				print(v)
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

print("Welcome to the game.")

input = ""	--It is better to define the variable before using in lua (though it can work without it)
have_key = false	--boolean

room_com = {look = "You are in the cave", exit = "You leave the cave"}
room("exit", room_com)


--instead of the {} in Lua we use "do end" for loops and "then end" for if statements.

--Leave cave

while input ~= "follow the path" do

	input = get_inp()

	if input == "look" then
		print("You are at the base of a mountain. There is a path leading somewhere")	

	elseif input == "follow the path" then

		print("You followed the path")
		print("A skeleton! (run, attack)")

		tinput = io.read()

		if tinput == "attack" then
		print("Skeleton dies, and you continue the adventure")

		elseif tinput == "run" then
		print("You have lost your coin!")
		pop_inv("coin")

		else 
		print("Skeleton attacks and You die! GAME OVER")
		os.exit()
		end	


	elseif input == "inv" then
		get_inv()

	else
		inv_com()
	end

end

while not (have_key == true and input == "open gate") do	--interestingly, instead of "!" we can write "not"
								--and also "and" instead of &&

	input = get_inp()

	if input == "look" then

		if have_key == false then
			print("You are near the gate. It is locked. Key is somewhere in the  grass")
			print("Also there is some sort of strange stick laying there...")	
		elseif have_key == true then
			print("There is a gate")
		end

	elseif input == "pick key" then
		have_key = true
		print("You picked the key")

	elseif input == "open gate" then
	
		if have_key == true then
			print("You opened the gate and escaped")
		elseif have_key == false then
			print("Key needed")
		end

	elseif input == "inv" then
		get_inv()
	
	elseif input == "pick stick" then
		push_inv("magic wand")

	else
		inv_com()
	end

end

-- The command to remove the item from the table is "table.remove(nameOfTable, indexOfItem)"
