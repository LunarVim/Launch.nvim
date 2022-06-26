-- create a game where a user must guess a number between 1 and 10

-- get input from user
function getInput()
    io.write("Enter a number: ")
    return io.read()
end

-- get a random number between 1 and 10
function getRandomNumber()
    return math.random(1, 10)
end

-- check if the user input is a number
function isNumber(input)
    return tonumber(input) ~= nil
end

-- check if the user input is a number between 1 and 10
function isValidNumber(input)
    return tonumber(input) >= 1 and tonumber(input) <= 10
end

-- check if the user input is the correct number
function isCorrectNumber(input, randomNumber)
    return tonumber(input) == randomNumber
end

-- play the game
function play()
    local randomNumber = getRandomNumber()
    local input = getInput()
    while not isCorrectNumber(input, randomNumber) do
        if not isNumber(input) then
            io.write("Invalid input.\n")
        elseif not isValidNumber(input) then
            io.write("Invalid input.\n")
        else
            io.write("Wrong.\n")
        end
        input = getInput()
    end
    io.write("Correct!\n")
end

play()
