# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Cleaning database
Item.destroy_all
Category.destroy_all

20.times do 
    Item.create!(title: Faker::StarWars.character, description: Faker::StarWars.quote, category_id: rand(Category.first.id..Category.last.id), price: rand(1..100))
end

Category.create!(category_name: "Bois")
Category.create!(category_name: "Papier")
Category.create!(category_name: "Tissu")