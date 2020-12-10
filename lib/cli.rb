require 'pry'

class CLI

    PLAYLISTS = {"Christmas" => "4gxWLVXrcqc3SngxmwxxvH", "Top Hits" => "7v5KjTAPt7QbxC1nPMpJnk", "Country Hits" => "0n4C5STkf1aaVAavTxDqeM", "Workout" => "4E0tTH3iH1hGMLJ0MMo4dv", "Disney Hits" => "7AX97ePWr5Onf0kDazTeGt", "Classic Rock"=> "4fjIBk8D6FXUeRwlRNE2Zg"}
    def start 
        user_greeting
        playlist_you_might_like
        playlist_selection
        display_songs
        song_selection
        display_info
    end 

    def user_greeting
        puts "                           Welcome, Play your favorite songs now!".red.bold
        puts "
            ___|\\_______|________|_______________________O__________@____________
            ___|/_______|________|_|___|__________|__@__|_____@__|_|____O.______||
            __/|____4___|__O_____|_|___|__O.______|_|@__|____|___|_|___|O._____o||
            _(_/^\\__4__@|_|_____@__|___|_|________|_|@__|____|___|_|___|_______o||
            __\\|/'_____@__|________|__@|_|________|_|________|___|_____|________||
               d          |           @  |          |"
        puts ""

    end

    def playlist_you_might_like
        PLAYLISTS.keys.each.with_index(1) {|key, i| puts "#{i}. #{key}"}
    end

    def playlist_selection
        puts "Select the number that you are interested in"
        input = gets.strip

        if (1..PLAYLISTS.length).include?(input.to_i)
            keys = PLAYLISTS.keys
            name = keys[input.to_i - 1]
            id = PLAYLISTS[name]
            @playlist = API.find_playlist_by_id(id)
            @songs = Song.all
        
        else 
            puts "Wrong input, please type a number between 1-#{PLAYLISTS.length}"
            playlist_selection #recursion 
        end

    end

    def display_songs
        @songs.each.with_index(1) {|song, i| puts "#{i}. #{song.name}"}

    end

    def song_selection 
        puts "type a number you'd like to select"
        input = gets.strip.to_i
        @song = @songs[input -1]
        display_song
    end

    def display_song
        puts @song.artist
        puts @song.name
        puts @song.album
        puts @song.popularity
        puts @song.genre
        puts @song.duration
    end


    # def display_info
        
    #     API.find_artist_by_name 

        # if input == back
        #       song_selection

        # else input == playlist
    #         playlist_selection

    #     else input == exit
    #         goodbye
        # elsif 
            # playlist_selection
        #   end

    # end

        # Artist.find_or_create({id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity:song_hash["track"]["popularity"], playlist:playlist})
        # ["artists"], ["track"]["id"], ["track"]["popularity"]
    #{"title", "artist", "popularity"}
    #the song with (title, artist, popularity)


    def goodbye 
        puts "Thanks for listening! Have a good one!"
    end

end

