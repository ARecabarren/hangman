module Display
    
    def welcome
        puts "_________________________________________"
        puts "Let's get started"
        puts "Your secret word has #{@secret_word.length} characters"
        puts "You have #{@max_attemps} trys"
        puts "------------------------------------------"
    end

    def lose
        puts "_________________________________________"
        puts "Better luck the next time"
        puts "You ran out of attempts"
        puts "The code was: #{@secret_word}"
    end

    def win
        puts "_________________________________________"
        puts "Congratulations you solved the code with #{@max_attemps- @attemp} remaining lifes"
        puts "Code: #{@secret_word}"
    end

    def display_guesses
        puts "_________________________________________"
        puts "Previous guesses: #{@guesses.join(', ')}"
    end
end
     