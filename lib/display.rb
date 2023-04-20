module Display
    
    def start_menu
        puts "_________________________________________"
        puts 'Welcome to Hangman'
        puts 'Insert 1 to start a new game'
        puts 'Insert 2 to load a saved game'
    end

    def wrong_input
        puts 'Invalid choice'
        puts 'Insert 1 to start a new game'
        puts 'Insert 2 to load a saved game'
    end
    
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

    def guess_or_save
        puts "Guess a letter"
        puts "Or insert 'save game' to continue later"
    end

    def get_username
        puts "Write your username or an alias"
    end

    def game_saved
        puts ""
        puts "Game saved"
        puts "See you soon"
    end
end
     