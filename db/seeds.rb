# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
data_serialized = open(url).read
data = JSON.parse(data_serialized)

data['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

Cocktail.create(name: "Mojito")
Cocktail.create(name: "Cuba Libre")
Cocktail.create(name: "Sex on the beach")

Dose.create(description: "A teaspoon")
Dose.create(description: "A lot")
