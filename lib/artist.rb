class Artist

    @@all = []

    def initialize(hash) #with metaprogramming
        hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        save
    end

    def self.find_artist_by_id(id)
        all.find {|artist| artist.id == id}
    end

    def songs 
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create(hash)
        find_artist_by_id(hash[:id]) || new(hash)
    end

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end
end
