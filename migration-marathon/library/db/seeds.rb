# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'
Reader.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
Reader.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
Reader.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
Reader.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email)
