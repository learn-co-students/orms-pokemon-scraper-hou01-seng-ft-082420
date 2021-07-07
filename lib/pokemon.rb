class Pokemon

    attr_accessor :id, :name, :type, :db
    
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)  
        v = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: v[0], name: v[1], type: v[2], db: db)
        # binding.pry
        # puts test
    end

end