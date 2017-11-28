# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

require 'faker'

5.times do
  Recipe.create(title: Faker::Coffee.blend_name, description: Faker::Coffee.notes)
end

25.times do
  Comment.create(recipe_id: Faker::Number.between(1,5), body: Faker::Lorem.paragraph)
end
