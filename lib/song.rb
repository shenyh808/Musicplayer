class Song

    def self.find_by_id(id)
        all.find {|song| song.id == id}
    end

    def self.find_or_create(hash) #maybe we can just call it self.find_or_create
        find_by_id(hash["id"]) || new(hash)
    end

    def save
        self.class.all << self
    end
end
