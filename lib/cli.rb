require 'pry'

class CLI

    PLAYLISTS = {"Christmas" => "4gxWLVXrcqc3SngxmwxxvH", "Top Hits" => "7v5KjTAPt7QbxC1nPMpJnk", "Country Hits" => "0n4C5STkf1aaVAavTxDqeM", "Workout" => "4E0tTH3iH1hGMLJ0MMo4dv", "Disney Hits" => "7AX97ePWr5Onf0kDazTeGt", "Classic Rock"=> "4fjIBk8D6FXUeRwlRNE2Zg", "The Feels" => "4gTqwWMa1YpyfIntqeoPHS"}
    def start 
        user_greeting
        playlist_you_might_like
        playlist_selection
        display_songs
        song_selection
        display_song
        
    end 

    def user_greeting

        puts "
                                        █░█░█ █▀▀ █░░ █▀▀ █▀█ █▀▄▀█ █▀▀
                                        ▀▄▀▄▀ ██▄ █▄▄ █▄▄ █▄█ █░▀░█ ██▄".red

        puts "
                        ___|\\_______|________|_______________________O__________@____________
                        ___|/_______|________|_|___|__________|__@__|_____@__|_|____O.______||
                        __/|____4___|__O_____|_|___|__O.______|_|@__|____|___|_|___|O._____o||
                        _(_/^\\__4__@|_|_____@__|___|_|________|_|@__|____|___|_|___|_______o||
                        __\\|/'_____@__|________|__@|_|________|_|________|___|_____|________||
                        d          |           @  |          |".bold
        puts ""
        puts "
        █▀█ █░░ ▄▀█ █▄█   █▄█ █▀█ █░█ █▀█   █▀▀ ▄▀█ █░█ █▀█ █▀█ █ ▀█▀ █▀▀   █▀ █▀█ █▄░█ █▀▀ █▀   █▄░█ █▀█ █░█░█ █
        █▀▀ █▄▄ █▀█ ░█░   ░█░ █▄█ █▄█ █▀▄   █▀░ █▀█ ▀▄▀ █▄█ █▀▄ █ ░█░ ██▄   ▄█ █▄█ █░▀█ █▄█ ▄█   █░▀█ █▄█ ▀▄▀▄▀ ▄".green

    end

    def playlist_you_might_like
        PLAYLISTS.keys.each.with_index(1) {|key, i| puts "#{i}. #{key}"}
    end

    def playlist_selection
        puts "Select the corresponding number for the playlist...".blue.bold
        input = gets.strip

        if (1..PLAYLISTS.length).include?(input.to_i)
            keys = PLAYLISTS.keys
            name = keys[input.to_i - 1]
            id = PLAYLISTS[name]
            @playlist = API.find_playlist_by_id(id)
            @songs = Song.all
        else 
            puts "Oops, an error has occurred... Please type a number between 1-#{PLAYLISTS.length}".red.bold
            playlist_selection #recursion 
        end

    end

    def display_songs
        @songs.each.with_index(1) {|song, i| puts "#{i}. #{song.name}"}

    end

    def song_selection 
        puts "Select the number corresponding to the song you want...".blue.bold
        input= gets.strip.to_i
        
        if  input.to_i.between?(1,@songs.length) && @song = @songs[input -1]
               display_song

        else 
            puts "Invalid input, please try again...".red.bold
            song_selection
           
        end
        
    end

    def display_song
        puts "Name: #{@song.name}".red
        puts "Artist: #{@song.artist.name}".green
        puts "Album: #{@song.album["name"]}".blue
        puts "Popularity: #{@song.popularity.to_s + "/100"}".red
        puts "Genre: #{@song.artist.genres}".green
        puts "Followers: #{@song.artist.followers}".blue
        puts "Duration: #{@song.duration}".red
        puts ""
        display
    end


    def display
        puts "Type 'back' to go to song selection".blue
        puts "Type 'playlist' to go to playlist".blue
        puts "Type 'exit' to exit".red
        input = gets.strip.downcase

        if input == "exit"
            goodbye


        elsif input == "back"
            display_songs
            song_selection

        elsif input == "playlist"
            playlist_you_might_like
            playlist_selection
            display_songs
            song_selection
            display_song

        else 
            puts "Hmm.. Unfortunately, that was invalid.. Please try again..".red
            display

        end
    end

    def goodbye 
        puts ""
        puts "
        ▀█▀ █░█ ▄▀█ █▄░█ █▄▀ █▀   █▀▀ █▀█ █▀█   █░░ █ █▀ ▀█▀ █▀▀ █▄░█ █ █▄░█ █▀▀ █
        ░█░ █▀█ █▀█ █░▀█ █░█ ▄█   █▀░ █▄█ █▀▄   █▄▄ █ ▄█ ░█░ ██▄ █░▀█ █ █░▀█ █▄█ ▄".blue
        puts "
                                ██████──██
                                ─██████████─────▄─▄─▄
                                ──███O▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
                                ───████████─────▀─▀─▀
                                ────██──██".red
        puts "
                █░█ ▄▀█ █░█ █▀▀   ▄▀█   █▀▀ █▀█ █▀█ █▀▄   █▀█ █▄░█ █▀▀ █
                █▀█ █▀█ ▀▄▀ ██▄   █▀█   █▄█ █▄█ █▄█ █▄▀   █▄█ █░▀█ ██▄ ▄".blue
        exit
    end

end

