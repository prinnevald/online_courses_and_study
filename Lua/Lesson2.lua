
-- LESSON TWO --

--This is a replica of the Adventure--

print("Welcome to the game.")

input = ""	--It is better to define the variable before using in lua (though it can work without it)
		--Here, it is empty string

have_key = false	--boolean

inv = {"coin", "sword", "armor"}	--kind of usind the array of some valuse. Can be anything~~ I think

--table.insert(inv, "shoes")	--Adding the string, will appear at the end of the list with the last index
--table.remove(inv, 1)	--removes the item with index 1

for i,v in pairs(inv) do	--did not really get this one till the end, but it is definitely a for loop
	print(i,v)		--serves for printing the inventory
end

while input ~= "exit" do	-- "~=" means "!="

	print("What do you want to do?")
	input = io.read()

	if input == "inspect" then
	print("You are in the cave")	
	elseif input == "exit" then	--elseif structure is pretty similar to C
	print("You left the cave")
	elseif input == "inv" then
		for i,v in pairs(inv) do
		print(i,v)
		end
	else
	print("Wrong command...")
	end

end

--instead of the {} in Lua we use "do end" for loops and "then end" for if statements.

--Leave cave

while input ~= "follow the path" do

	print("What do you want to do?")
	input = io.read()

	if input == "inspect" then
	print("You are at the base of a mountain. There is a path leading somewhere")	

	elseif input == "follow the path" then
	print("You followed the path")
	print("A skeleton! (run, attack)")

		tinput = io.read()

		if tinput == "attack" then
		print("Skeleton dies, and you continue the adventure")

		elseif tinput == "run" then
		print("You have lost your coin!")
		table.remove(inv, 1)

		else 
		print("Skeleton attacks and You die! GAME OVER")
		os.exit()
		end	


	elseif input == "inv" then
		for i,v in pairs(inv) do
		print(i,v)
		end

	else
	print("Wrong command...")
	end

end

while not (have_key == true and input == "open gate") do	--interestingly, instead of "!" we can write "not"
								--and also "and" instead of &&

	print("What do you want to do?")
	input = io.read()

	if input == "inspect" then

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
		for i,v in pairs(inv) do
		print(i,v)
		end
	
	elseif input == "pick stick" then
	print("you now have magic wand")
	table.insert(inv, "magic wand")

	else
	print("Wrong command...")
	end

end

-- The command to remove the item from the table is "table.remove(nameOfTable, indexOfItem)"
