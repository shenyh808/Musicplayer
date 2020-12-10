class Playlist

    attr_accessor :name

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor key
            send("#{key}=", value)

        end
        save 
    end

    def save
        self.class.all << self
    end

    def genres
        Genre.all.select {|genre| genre.playlist == self}

    end

    def songs
        Song.all.select {|song| song.playlist == self}
    end

    def self.find_playlist_by_id(id)
        all.find {|playlist| playlist.id == id}
    end

    def self.find_or_create(hash)
        find_playlist_by_id(hash["id"]) || new(hash)
    end

    def self.all 
        @@all 
    end

end
 