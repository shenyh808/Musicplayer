class Song
    attr_accessor :artist, :playlist, :genre

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

    def self.find_or_create(hash) #maybe we can just call it self.find_or_create
        find_by_id(hash["id"]) || new(hash)
    end

    def save
        self.class.all << self
    end

    # def play_song ?? How would I do this? Youtube? or Spotify ?

end
