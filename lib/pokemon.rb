require 'pry'
class Pokemon

    #Notice that initialize requires keyword arguments.
    attr_accessor :id, :name, :type, :db
    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type, db)
        #saves an instance of a pokemon with the correct id
        db.execute("INSERT INTO pokemon (name, type) VALUES ( ?,  ? )", name, type)
    end

    def self.find(id, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
        Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
    end

end
