require 'pry'

class API 
    
    
    def self.api_call(url)
        # token = ""
        token = "BQDLd-zYJPQ1vyIXAnzSvr-AD_dcrc2YiIUCeEmi5OXGAoYBvyCgkekfFegcXiQvkSwebNRBC2mwajgD16C6qLV7IODDTrXwJJOqHDbeeFHgN8fdlzMlhttPFFQyVC9vN2oU6qgBaG_GcNGnyClvm66mTfXE2WJv-N0Kf5Qmm2-Vj_Q"
        uri = URI(url)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
    end


    def self.find_artist_by_name(name)
        response = api_call("https://api.spotify.com/v1/search?q=#{name}&type=artist")
        artist = JSON(response.body)["artist"]
       
            Artist.find_or_create({name: artist["name"], id: ["track"]["id"], songs: ["track"]["name"], popularity: ["track"]["popularity"], playlist:playlist})
      
    end

    def self.find_artist_by_id(id)
        response = api_call("https://api.spotify.com/v1/artists/#{id}")
        artist = JSON(response.body)
        
        Artist.find_or_create({id: artist["id"], name: artist["name"], popularity: artist["popularity"], followers: artist["followers"]["total"], genres: artist["genres"]})
    end
    
    def self.find_playlist_by_id(id)
        response = api_call("https://api.spotify.com/v1/playlists/#{id}")
        playlist_hash = JSON(response.body)
        playlist = Playlist.find_or_create({id: playlist_hash["id"], name: playlist_hash["name"]})
        playlist_hash["tracks"]["items"].collect do |song_hash|
        artist = find_artist_by_id(song_hash["track"]["artists"][0]["id"])
            
            Song.find_or_create({id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity: song_hash["track"]["popularity"], playlist: playlist, duration: song_hash["track"]["duration_ms"], album: song_hash["track"]["album"], track_number: song_hash["track"]["track_number"], artist: artist})
        end
    end
    
    def self.find_song_by_id(id)
        response = api_call("https://api.spotify.com/v1/tracks/#{id}")
        json = JSON(response.body)
        id = json["id"]
        song = Song.find_song_by_id(id)
        
    end
    
end