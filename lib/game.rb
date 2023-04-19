require 'pry-byebug'
require_relative 'display.rb'

class Game
    include Display
    def initialize
        @secret_word = pick_random_word
        @output = set_output
        @max_attemps = @secret_word.length + 3
        @attemp = 0
        @guesses = []
        run_game
    end

    def pick_random_word
        word_list = File.readlines('../words_database.txt').map{|word| word.chomp}
        random_word = word_list.sample
    end

    def get_a_guess
        correct_guess = false
        until correct_guess
            puts "Guess a letter:"
            guess = gets().chomp.downcase
            if guess.match?(/[a-zA-Z]/) && guess.length == 1 && !guess.match?(/\d/)
                correct_guess = true
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



    def run_game
        welcome
        until @secret_word == @output || @attemp == @max_attemps
            display_guesses unless @guesses.empty?
            puts "Attemp ##{@attemp} : #{@output}"
            @guess = get_a_guess
            @matches = compare_guess
            update_guesses
            @output = update_output
            @attemp += 1 unless @secret_word.include?(@guess)
        end
        check_final_status

    end

end

lalala = Game.new
# puts Display.welcome