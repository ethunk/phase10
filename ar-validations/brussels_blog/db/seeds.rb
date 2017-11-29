# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

require 'faker'

3.times do
  Recipe.create(name: ('Brussels Sprouts ' + Faker::Coffee.blend_name), description: Faker::Coffee.notes, serving: Faker::Number.between(1,10))
end

9.times do
  Comment.create(recipe_id: Faker::Number.between(1,3), body: Faker::Lorem.sentence)
end
