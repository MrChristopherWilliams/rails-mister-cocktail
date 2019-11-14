# This file should contain all the record creation needed to seed the database with its default values.
require 'json'
require 'open-uri'

Ingredient.destroy_all

url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(
    name: ingredient["strIngredient1"])
  puts "#{i.name}"
end
