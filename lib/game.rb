require 'pry-byebug'
require_relative 'display.rb'
require_relative 'save_game.rb'
class Game
    include Display
    include Manage_games



    def initialize
        start_menu
        @user_choice = get_start_input

        if @user_choice == '1'
            @secret_word = pick_random_word
            @output = set_output
            @max_attemps = @secret_word.length + 3
            @attemp = 0
            @guesses = []
            run_game
        elsif @user_choice == '2'
            data = load_game
            @secret_word = data["secret_word"]
            @output = data["output"]
            @attemp = data["attemp"]
            @guesses = data["guesses"]
            @max_attemps = @secret_word.length + 3
            run_game
        end
        
    end

    def pick_random_word
        word_list = File.readlines('../words_database.txt').map{|word| word.chomp}
        random_word = word_list.sample
    end

    def get_a_guess
        correct_guess = false
        until correct_guess
            guess_or_save
            guess = gets().chomp.downcase
            if guess.match?(/[a-zA-Z]/) && guess.length == 1 && !guess.match?(/\d/)
                correct_guess = true
            elsif guess == 'save game'
                correct_guess = true
                # save_game
            else
                puts "Invalid guess. Please enter a single letter that is not a number."
            end
        end
        guess
    end

    def compare_guess
        indexes = []
        @secret_word.split('').each_with_index do |letter, index|
            if @guess == letter
                indexes.push(index) 
            end
        end
        indexes
    end

    def update_guesses
        unless @secret_word.include?(@guess)
            @guesses.push(@guess)
        end
    end

    def set_output
        output = ''
        @secret_word.length.times{ |time| output += '_'}
        output
    end

    def update_output
        @matches.each {|value| @output[value] =  @guess}
        @output
    end

    def check_final_status
        if @attemp == @max_attemps
            lose
        elsif @secret_word == @output
            win
        end
    end

    def get_start_input
        correct_start_input = false
        until correct_start_input
            user_input = gets.chomp
            if user_input.match?(/\d{1}/) && (user_input == '1' || user_input == '2')
                correct_start_input = true
            else
                wrong_input
            end
        end
        user_input
    end

    def run_game
        welcome
        until @secret_word == @output || @attemp == @max_attemps
            display_guesses unless @guesses.empty?
            puts "Attemp ##{@attemp} : #{@output}"
            @guess = get_a_guess

            if @guess == 'save game'
                save_game
                break
            end

            @matches = compare_guess
            update_guesses
            @output = update_output
            @attemp += 1 unless @secret_word.include?(@guess)
        end

        if @guess == 'save game'
            game_saved
        else
            check_final_status
        end

    end

end

lalala = Game.new
# puts Display.welcome