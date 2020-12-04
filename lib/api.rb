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
    end

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

    def self.browse 
        uri = URI ("https://api.spotify.com/v1/browse/categories")
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        browse = JSON(response.body)["browse"]
    end

    def self.playlist(christmas)
        uri = URI https://api.spotify.com/v1/playlists/{4gxWLVXrcqc3SngxmwxxvH}
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        christmas JSON(response.body)["christmas"]
    end

    def self.playlist(classic_rock)
        uri = URI https://api.spotify.com/v1/playlists/{4fjIBk8D6FXUeRwlRNE2Zg}
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        classic_rock JSON(response.body)["classic_rock"]
    end

    def self.playlist(workout)
        uri = URI https://api.spotify.com/v1/playlists/{4E0tTH3iH1hGMLJ0MMo4dv}
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        workout JSON(response)["workout"]
    end

    def self.playlist(disney_hits)
        uri = URI https://api.spotify.com/v1/playlists/{7AX97ePWr5Onf0kDazTeGt}
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        disney_hits JSON(response.body)["disney_hits"]
    end

    def self.playlist(top_hits)
        uri = URI https://api.spotify.com/v1/playlists/{7v5KjTAPt7QbxC1nPMpJnk}
        uri = URI(URL)
        req = Net::HTTP::Get.new(uri)
        req['Authorization'] = "Bearer #{token}" 
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = (uri.scheme == "https")
        response = http.request(req)
        top_hits JSON(response.body)["top_hits"]
    end
    binding.pry 
end

API.CLI



