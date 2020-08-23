
-- LESSON ONE --


print ("hi, whats name?")

name = io.read()	--io.read() is waiting for an input from user

print("name is " .. name)

--In lua we do not need to have libraries defined. Also, we do not need to specify the types of the variables...

lol = 4 	--this will work

kek = "qwe"	--that will also work

--to print something out we use this syntax:

print("test " .. lol)	--this will print out "test 4"

print("test " .. kek)	--this will print out "test qwe"

print(lol)
print(kek)	--these two wo;; print only variables themselves

print(name .. kek)	--interestingly, this will print two strings... I think ".." is some sort of 
			--equivalent for "<<" in C++, so it is not merging them, just prints one after another

print("End of the lesson one")
