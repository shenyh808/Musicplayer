require "pry"

class Song
    attr_accessor :artist, :playlist, :genre

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor key
            send("#{key}=", value)

        end
        save 
    end

    def self.find_song_by_id(id)
        all.find {|song| song.id == id}
    end

    def self.find_or_create(hash)
        
        find_song_by_id(hash["id"]) || new(hash)
    end

    def self.all 
        @@all
    end

    def save
        self.class.all << self
    end

end
