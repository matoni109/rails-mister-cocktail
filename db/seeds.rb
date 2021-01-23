require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
drinks = [ "Mojito",
           "Long Island Iced Tea",
           "Daiquiri",
           "Margarita",
           "Bloody Mary",
           "Cosmopolitan",
           "Moscow Mule",
           "Screwdriver"]


puts "cleaning house :)"
Cocktail.destroy_all
# Dose.destroy_all
Ingredient.destroy_all
puts "done cleaning "#

# Name Me
drinks.each do |drink|
  Cocktail.create!(
    name: drink
  )
  puts "made #{Cocktail.last.name}"
end


# Json Time
puts "JSON TIME "#

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
word_back = open(url).read
word = JSON.parse(word_back)
word["drinks"]
# p word["drinks"][0]["strIngredient1"]
# binding.pry

word["drinks"].each do |element|
  Ingredient.create!(
    name: element["strIngredient1"]
  )
  puts "made #{Ingredient.last.name}"
end


puts " finished seeds !!"
