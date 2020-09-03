#require 'pry'
class Pokemon

    attr_accessor :id, :name, :type
    attr_reader :db
    
    @@all = []

    def initialize (id:, name:, type:, db:)
       @id = id
       @name = name
       @type = type
       @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) 
        VALUES (?,?)", name, type)
    end

    def self.find(id, db) 
       arr = db.execute("SELECT * FROM pokemon WHERE id=?", id)
       #binding.pry
       Pokemon.new(id:id, name:arr[0][1], type:arr[0][2], db:db)
       binding.pry
       0
    end

end
