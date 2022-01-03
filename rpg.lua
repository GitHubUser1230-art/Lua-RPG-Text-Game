-- Adventure game

function contains(list, x)
	for _, v in pairs(list) do
		if v == x then return true end
	end
	return false
end

function indexOf(array, value)
    for i, v in ipairs(array) do
        if v == value then
            return i
        end
    end
    return nil
end


items = {} -- The items that player has. (Starts out with nothing)
pantryItems = {"oreos", "lays"}
fridgeItems = {"bread", "eggs"}

while true do
    
    
    print("Where do you want to go?")
    print("1 for refrigerator. 2 for toaster. 3 for stove. 4 for pantry. 5 to check your items. 6 to eat")
    response = io.read() --User response through io.read()
    stoveDecision = 0
    toasterDecision = 0
    eatenItem = 0
    
    if response == "1" then
        print("You found " .. table.concat(fridgeItems,", ") .. " in the fridge.")
        print("Which do you wish to take?")
        response = io.read()

        if contains(fridgeItems, response) then
            table.remove(fridgeItems, indexOf(fridgeItems, response))
            table.insert(items, response)
            print("You have taken the " .. response .. ".")
        else
            print("You did not take anything.")
        end
    elseif response == "2" then
        
        if contains(items, "bread") then --Checks if the player has the neccessary items to complete this task
            print("Do you want to toast your bread? y/n")
            response = io.read()
        else
            print("You have nothing to toast.")
        end
        if response == "y" then
            table.remove(items, indexOf(items, "bread")) -- Removes the item through finding the index through indexOf() and then using the table.remove() 
            table.insert(items, "toast")
            print("You got toast!")
        end

    elseif response == "3" then

        if contains(items, "eggs") then
            print("Do you want to cook your eggs? y/n")
            response = io.read()
        else
            print("You have nothing to cook.")
        end
        if response == "y" then
            table.remove(items, indexOf(items, "eggs"))
            table.insert(items, "scrambled eggs")
            print("You got scrambled eggs!")
        end

    elseif response == "4" then
        print("You found " .. table.concat(pantryItems,", ") .. " in the pantry.")
        print("Which do you wish to take?")
        response = io.read()

        if contains(pantryItems, response) then
            table.remove(pantryItems, indexOf(pantryItems, response))
            table.insert(items, response)
            print("You have taken the " .. response .. ".")
        else
            print("You did not take anything.")
        end

    elseif response == "5" then
        
        print("You have: " .. table.concat(items,", ")) --Shows the players item through the table.concat() function

    elseif response == "6" then
        print(table.concat(items,", "))
        print("Which item do you want to eat?")
        response = io.read()

        if contains(items, response) then
            table.remove(items, indexOf(items, response))
            print("You have eaten the " .. response .. ".")
        else
            print("You did not eat anything.")
        end
    end
end
