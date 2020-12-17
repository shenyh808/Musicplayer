class Genre

    def initialize(hash)
        hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)

        end
        save 
    end

    def playlists
        Playlist.all {|playlist| playlist.genre == self}
    end

    def self.find_by_id(id)
        all.find {|genre| genre.id == id}
    end

    def self.find_or_create(hash)
        find_by_id(hash["id"]) || new(hash)
    end

    def save
        self.class.all << self
    end

end
