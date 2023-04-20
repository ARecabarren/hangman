require 'json'
module Manage_games

    def save_game
        write_status
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
            file.puts game_status.to_json
        end
    end

    def load_game
        puts "Choose a game by it's numeric index '[number]'"
        display_saved_games
        game_to_load = gets.chomp.to_i
        data = read_file(game_to_load)
        data
    end

    def display_saved_games
        games_array = Dir.glob('../games/*.json')
        games_array.each_with_index do |game,index|
            user_name = File.basename(game,"_game.json")
            puts "[#{index}] #{user_name}"
        end
    end

    def read_file(game_to_load)
        games_array = Dir.glob('../games/*.json')
        directory = games_array[game_to_load]
        saved_game = File.read("#{directory}")
        JSON.parse(saved_game)
    end
end