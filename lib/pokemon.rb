class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:,name:,type:,db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(new_name, new_type, db)
        db.execute "INSERT INTO pokemon (name,type) VALUES ('Pikachu','electric');"
    end

    def self.find(id,db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
        Pokemon.new(id:id,name:pokemon[1],type:pokemon[2],db:db)
    end
end
