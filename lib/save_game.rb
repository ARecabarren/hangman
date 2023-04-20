require 'json'
module Manage_games

    def save_game
        
    end

    def write_status
        game_status = {}
        game_status[:secret_word] = @secret_word
        game_status[:attemp] = @attemp
        game_status[:guesses] = @guesses
        game_status[:output] = @output
        write_file(game_status)
    end

    def write_file(game_status)
        get_username
        username = gets.chomp
        filename = "../games/#{username}_game.json"
        File.open(filename,'w') do |file|
            file.puts game_status
        end
    end

    def load_game(user_input)
        
    end
end