require_relative "environment"

Scraper.new(@db).scrape

all_pokemon = @db.execute("SELECT * FROM pokemon;")

# test out your code here!
p1 = Pokemon.new(name: "Pikachu", type: "electric", db: @db)