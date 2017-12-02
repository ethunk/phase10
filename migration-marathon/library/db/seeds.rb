# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'
require 'pry'
# Books [title, author]
5.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author)
end
# Categories [category, book_id]
categories = []

while categories.count < 5
  genre = Faker::Book.genre
  if !categories.include?(genre)
    categories << genre
  end
end

categories.each do |category|
  Category.create(category: category)
end
# Categorizations [book_id, category_id]

# Checkouts [book_id, reader_id]

# Readers [first name, last name, email, phone number]
5.times do
Reader.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone_number: Faker::Number.number(10))
end
