require 'pry'

class CLI

    PLAYLISTS = {"Christmas" => "4gxWLVXrcqc3SngxmwxxvH", "Top Hits" => "7v5KjTAPt7QbxC1nPMpJnk", "Country Hits" => "0n4C5STkf1aaVAavTxDqeM", "Workout" => "4E0tTH3iH1hGMLJ0MMo4dv", "Disney Hits" => "7AX97ePWr5Onf0kDazTeGt", "Classic Rock"=> "4fjIBk8D6FXUeRwlRNE2Zg"}
    def start 
        user_greeting
        playlist_you_might_like
        playlist_selection
        display_songs
        goodbye
    end 

    def user_greeting
        puts "Welcome, Play your favorite songs now!"
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
            @songs = API.find_playlist_by_id(id)

        else 
            puts "Wrong input, please type a number between 1-#{PLAYLISTS.length}"
            playlist_selection #recursion 

        end

    end

    def display_songs
        @songs.each.with_index(1) {|song, i| puts "#{i}. #{song.name}"}
    end

    type the song you want (title, artist, popularity)



    # def choice 
    #     if play_song
    #         play 
    #     else 
    #         find_artist_by_id
    #         artist
    #     else 
    #         goodbye 
    #     end
    # end
            #Question: after playlist selection.. can either play song or go to artist. 
            

    def goodbye 
        puts "Thanks for joining us! Have a good one!"
    end



end

