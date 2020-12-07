require 'pry'

class API 
    
    
    def self.api_call(url)
        # token = "BQBZRaD4znFzYJ4ljUqANypbNjDV7nnW-0LY8OS49aHzBY4Prd7qv2lhNLgF2HT1qJr8Ya6-YQBABYVZ_UK-T74gJzh8ciWuLzKew9-Pd55P_pGzxaIq_Bxkqvch7Bsdo5lVFosnyJu_nMMIJ6gL3zqSld-Q_TERAFocal7JKWMHj1c" #replace with your own token if you want the example to work
        token = "BQADqDEnEZXI6c4rOe46Rbedly6qROCw-n2hv_oJoFBAkp-Nk2pimdDNFoxW2XjfGW_uYrjt7ZhZOXyj1jiTcLhvZ5VrA1aJDdVVwZL_tL__laBZqQnIUbRK-g3vTwWpWVrYIJ8ln2O6I_m1OXuL4USyTp55ScYlx8vjK0au5oXUQIg"
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
        Artist.find_or_create(artist)

        binding.pry
    end

    def self.find_artist_by_id(id)
        response = api_call("https://api.spotify.com/v1/artists/#{id}")
        artist = JSON(response.body)["artist"]
        Artist.find_or_create(artist)
    end



    # def self.find_by_playlist(playlist)
    #     uri = URI("https://api.spotify.com/v1/search?q=#{name}&type=playlist")
    #     req = Net::HTTP::Get.new(uri)
    #     req['Authorization'] = "Bearer #{token}" 
    #     http = Net::HTTP.new(uri.host, uri.port)
    #     http.use_ssl = (uri.scheme == "https")
    #     response = http.request(req)
    #     playlist = JSON(response.body)["playlist"]
    #     Playlist.find_or_create(playlist)

    # end

    # def self.browse 
    #     uri = URI ("https://api.spotify.com/v1/browse/categories")
    #     req = Net::HTTP::Get.new(uri)
    #     req['Authorization'] = "Bearer #{token}" 
    #     http = Net::HTTP.new(uri.host, uri.port)
    #     http.use_ssl = (uri.scheme == "https")
    #     response = http.request(req)
    #     browse = JSON(response.body)["browse"]
    #     Browse.find_or_create(browse)
    # end

    def self.find_playlist_by_id(id)
        response = api_call("https://api.spotify.com/v1/playlists/#{id}")
        playlist_hash = JSON(response.body)
        playlist = Playlist.find_or_create({id: playlist_hash["id"], name: playlist_hash["name"]})
        playlist_hash["tracks"]["items"].collect do |song_hash| 
            Song.find_or_create({id: song_hash["track"]["id"], name: song_hash["track"]["name"], popularity:song_hash["track"]["popularity"], playlist:playlist})
        end
    end

    def self.find_song_by_id(song)
        response = api_call("https://api.spotify.com/v1/tracks/#{id}")
        playlist = JSON(response.body)["id"]
        Song.find_or_create(id)
    end

    # how to play a song? 
  

end




