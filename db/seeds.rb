# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'JSON'
puts "Cleaning ingredients"
Ingredient.destroy_all
puts "API call"
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients_raw = JSON.parse(ingredients_serialized)
ingredients = []
puts "Generating ingredients array"
ingredients_raw['drinks'].each do |ingredient|
  ingredients << ingredient["strIngredient1"]
end
puts "Generating ingredients"

ingr = []
10.times do
  ingredient = Ingredient.create(name: ingredients.sample)
  ingr << ingredient
  p ingredient
end

a = Cocktail.create(name: "Bloody Mary")
b = Cocktail.create(name: "Virgin Island")
c = Cocktail.create(name: "Negroni")

Dose.create(cocktail_id: a, ingredient_id: ingr.sample, description: "6cl")
Dose.create(cocktail_id: b, ingredient_id: ingr.sample, description: "2cl")
Dose.create(cocktail_id: c, ingredient_id: ingr.sample, description: "4cl")
