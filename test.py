import random
 
### Lottery Draws List ###
lottery_draws = []
 
### Actual Random Lottery Draws ###
for i in range(0, 5):
    number = random.randint(1, 20)
    while number in lottery_draws:
        number = random.randint(1, 20)
    lottery_draws.append(number)
 
### Player Guesses ###
 
print('Take a 5 guesses, between 1-20')
guesses = input('')
    if guesses in lottery_draws:
        return("Congratulations, you got X guesses right")
    elif guesses in lottery_draws: # Is equal to "1"
        return("Congratulations, you got 1 guess right")
    else:
        return("Too bad, you didn't get a single guess right")
 
### The Finale ###
def message():
    message1 = "Today's lottery draws are: " + lottery_draws
    message2 = # "\nYou got X guesses right."
    return(message1 + message2)
 
message