require 'pry'

class API 

    token = "BQBZRaD4znFzYJ4ljUqANypbNjDV7nnW-0LY8OS49aHzBY4Prd7qv2lhNLgF2HT1qJr8Ya6-YQBABYVZ_UK-T74gJzh8ciWuLzKew9-Pd55P_pGzxaIq_Bxkqvch7Bsdo5lVFosnyJu_nMMIJ6gL3zqSld-Q_TERAFocal7JKWMHj1c" #replace with your own token if you want the example to work

    def self.find_artist_by_name(name)
        uri = URI("https://api.spotify.com/v1/search?q=#{name}&type=artist")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        artist = JSON(response.body)["artist"]
        Artist.find_or_create(artist)

        binding.pry
    end

    def self.find_artist_by_id(id)
        uri = URI("https://api.spotify.com/v1/artists/#{id}")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        artist = JSON(response.body)["artist"]
        Artist.find_or_create(artist)



    def self.find_by_playlist(playlist)
        uri = URI("https://api.spotify.com/v1/search?q=#{name}&type=playlist")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        playlist = JSON(response.body)["playlist"]
        Playlist.find_or_create(playlist)

    end

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
        uri = URI("https://api.spotify.com/v1/playlists/#{id}")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        playlist = JSON(response.body)["id"]
        binding.pry
        Playlist.find_or_create(id)
    end

    def self.find_song_by_id(song)
        uri = URI("https://api.spotify.com/v1/tracks/#{id}")
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        playlist = JSON(response.body)["id"]
        Song.find_or_create(id)
    end

    # how to play a song? 
  

end




