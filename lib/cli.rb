require 'pry'

class CLI

    PLAYLISTS = {"Christmas" => "4gxWLVXrcqc3SngxmwxxvH", "Top Hits" => "7v5KjTAPt7QbxC1nPMpJnk", "Country Hits" => "0n4C5STkf1aaVAavTxDqeM", "Workout" => "4E0tTH3iH1hGMLJ0MMo4dv", "Disney Hits" => "7AX97ePWr5Onf0kDazTeGt", "Classic Rock"=> "4fjIBk8D6FXUeRwlRNE2Zg"}
    def start 
        user_greeting
        playlist_you_might_like
        playlist_selection
    end 

    def user_greeting
        puts "Welcome, Play your favorite songs now!"
    end

    def playlist_you_might_like(playlist)
        PLAYLISTS.keys.each.with_index {|key, i| puts "#{i}. #{key}"}
    end

    def playlist_selection
        puts "select the number that you are interested in"
        input = gets.strip

        if (1..PLAYLISTS.length).include?(input)
            keys = PLAYLISTS.keys
            name = keys[input]
            id = PLAYLISTS[name]
            API.find_playlist_by_id(id)

        else 
            puts "Wrong input, please type a number between 1-#{PLAYLIST.length}"
            playlist_selection #recursion 

        end

    end

end

