class Artist

    attr_accessor :songs, :name

    def initialize(hash) #with metaprogramming
        hash.each do |key, value|
            self.class.attr_accessor key
            self.send("#{key}=", value)
        end
        save
    end

    def self.find_by_id(id)
        all.find {|artist| artist.id == id}
    end

    def self.find_or_create(hash) #maybe we can just call it self.find_or_create
        find_by_id(hash["id"]) || new(hash)
    end

    def save
        self.class.all << self
    end
end
